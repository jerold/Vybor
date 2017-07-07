import 'dart:async';
import 'dart:html' show window;

import 'package:firebase/firebase.dart' as firebase;

import 'package:vybor/client.dart';
import 'package:vybor/model.dart';

// Fields

const String GROUP_KEY = 'group';
const String GROUPS_KEY = 'groups';

const String OPTION_KEY = 'option';
const String OPTIONS_KEY = 'options';
const String BLOCKED_OPTIONS_KEY = 'blocked-options';

const String USER_KEY = 'user';
const String USERS_KEY = 'users';
const String BLOCKED_USERS_KEY = 'blocked-users';

const String PICK_KEY = 'pick';
const String PICKS_KEY = 'picks';

const String NAME_KEY = 'name';
const String CREATOR_KEY = 'creator';
const String ACTIVE_KEY = 'active';
const String DELETED_KEY = 'deleted';
const String DESCRIPTION_KEY = 'description';
const String ACTIVE_TIMESTAMP_KEY = 'active-timestamp';
const String PICK_TIMESTAMP_KEY = 'pick-timestamp';

///     "Vybor": {
///       "groups": {
///         "$uid": {
///           "name": "Places to eat",
///           "creator": "$uid",
///           "deleted": false,
///           "users": {
///             "$uid": true,
///           },
///           "blockedUsers": {
///             "$uid": true,
///           }
///           "options": {
///             "$uid": true,
///           }
///           "blockedOptions": {
///             "$uid": true,
///           }
///           "picks": {
///             "$uid": true,
///           }
///         },
///       }
///       "options": {
///         "$uid": {
///           "name": "Chipotle",
///           "creator": "$uid",
///           "deleted": false,
///           "group": "$uid",
///         },
///       }
///       "picks": {
///         "$uid": {
///           "option": "$uid",
///           "pickTimestamp": 2017-2-12 13:14:56
///         }
///       },
///       "users": {
///         "$uid": {
///           "name": "Jerold",
///           "connected": true,
///           "activityTimestamp": 2017-2-12 13:14:56
///           "groups": {
///             "${uid}": true,
///           },
///           "options": {
///             "${uid}": true,
///           }
///         }
///       }
///     }

class FirebaseClient implements Client {
  firebase.GoogleAuthProvider _fbGoogleAuthProvider;
  firebase.Auth _fbAuth;
  firebase.Database _fbDatabase;

  firebase.DatabaseReference _fbGroups;

  firebase.DatabaseReference _fbOptions;

  firebase.DatabaseReference _fbPicks;

  firebase.DatabaseReference _fbUsers;

  List<StreamSubscription> _subs = new List<StreamSubscription>();

  // getters

	Map<String, GroupData> _groups = new Map<String, GroupData>();

  Map<String, GroupData> get groups => new Map<String, GroupData>.from(_groups);

  Map<String, OptionData> _options = new Map<String, OptionData>();

  Map<String, OptionData> get options => new Map<String, OptionData>.from(_options);

  Map<String, PickData> _picks = new Map<String, PickData>();

  Map<String, PickData> get picks => new Map<String, PickData>.from(_picks);

	Map<String, UserData> _users = new Map<String, UserData>();

  Map<String, UserData> get users => new Map<String, UserData>.from(_users);

  String _theGroupUid;

  GroupData get theGroup => _groups[_theGroupUid];

  String _theUserUid;

  UserData get theUser => _users[_theUserUid];

  // streams

  StreamController<String> _groupDidChange = new StreamController<String>.broadcast();
  Stream<String> get groupDidChange => _groupDidChange.stream;

  StreamController<String> _optionDidChange = new StreamController<String>.broadcast();
  Stream<String> get optionDidChange => _optionDidChange.stream;

  StreamController<String> _pickDidChange = new StreamController<String>.broadcast();
  Stream<String> get pickDidChange => _pickDidChange.stream;

  StreamController<String> _userDidChange = new StreamController<String>.broadcast();
  Stream<String> get userDidChange => _userDidChange.stream;

  StreamController<UserData> _theUserDidChange = new StreamController<UserData>.broadcast();
  Stream<UserData> get theUserDidChange => _theUserDidChange.stream;

  StreamController<GroupData> _theGroupDidChange = new StreamController<GroupData>.broadcast();
  Stream<GroupData> get theGroupDidChange => _theGroupDidChange.stream;

  FirebaseClient() {
    String groupUid = Uri.base.queryParameters[GROUP_KEY];
    if (groupUid != null && groupUid.length > 0) _selectGroup(groupUid);
    else if (window.localStorage.containsKey(GROUP_KEY)) _selectGroup(window.localStorage[GROUP_KEY]);

    firebase.initializeApp(
      apiKey: "AIzaSyDkmbRvyvMdRP78cG_KO1rqx32gU_5jAbU",
      authDomain: "vybor-3a9d5.firebaseapp.com",
      databaseURL: "https://vybor-3a9d5.firebaseio.com",
      storageBucket: "vybor-3a9d5.appspot.com",
    );

    _fbGoogleAuthProvider = new firebase.GoogleAuthProvider();
    _fbAuth = firebase.auth();
    _fbAuth.onAuthStateChanged.listen(_authChanged);

    _fbDatabase = firebase.database();
  }

  /// Convenience Getters

  String _timeStamp([DateTime now]) {
    now = now ?? new DateTime.now();
    return now.toString();
  }

  firebase.DatabaseReference ref(String entityType, String uid, [String childType]) {
    String option = childType != null ? "/${childType}" : "";
    return _fbDatabase.ref("$entityType/$uid$option");
  }

  firebase.DatabaseReference groupRef(String uid, [String child]) => ref(GROUPS_KEY, uid, child);

  firebase.DatabaseReference optionRef(String uid, [String child]) => ref(OPTIONS_KEY, uid, child);

  firebase.DatabaseReference pickRef(String uid, [String child]) => ref(PICKS_KEY, uid, child);

  firebase.DatabaseReference userRef(String uid, [String child]) => ref(USERS_KEY, uid, child);

  GroupData _groupDateFromEvent(firebase.QueryEvent event) {
    final data = event.snapshot.val();
    return new GroupData((GroupDataBuilder builder) {
      builder
        ..name = data[NAME_KEY]
        ..creator = data[CREATOR_KEY]
        ..deleted = data[DELETED_KEY] ?? false
        ..description = data[DESCRIPTION_KEY] ?? '';
      if (data[OPTIONS_KEY] != null) builder.options.addAll(data[OPTIONS_KEY].keys);
      if (data[BLOCKED_OPTIONS_KEY] != null) builder.blockedOptions.addAll(data[BLOCKED_OPTIONS_KEY].keys);
      if (data[USERS_KEY] != null) builder.users.addAll(data[USERS_KEY].keys);
      if (data[BLOCKED_USERS_KEY] != null) builder.blockedUsers.addAll(data[BLOCKED_USERS_KEY].keys);
      if (data[PICKS_KEY] != null) builder.picks.addAll(data[PICKS_KEY].keys);
      return builder;
    });
  }

  OptionData _optionDateFromEvent(firebase.QueryEvent event) {
    final data = event.snapshot.val();
    return new OptionData((OptionDataBuilder b) => b
      ..name = data[NAME_KEY]
      ..creator = data[CREATOR_KEY]
      ..deleted = data[DELETED_KEY] ?? false
      ..group = data[GROUP_KEY]
    );
  }

  PickData _pickDateFromEvent(firebase.QueryEvent event) {
    final data = event.snapshot.val();
    return new PickData((PickDataBuilder b) => b
      ..option = data[OPTION_KEY]
      ..creator = data[CREATOR_KEY]
      ..pickTimestamp = data[PICK_TIMESTAMP_KEY]
    );
  }

  UserData _userDateFromEvent(firebase.QueryEvent event) {
    final data = event.snapshot.val();
    return new UserData((UserDataBuilder builder) {
      builder
        ..name = data[NAME_KEY]
        ..active = data[ACTIVE_KEY]
        ..activeTimestamp = data[ACTIVE_TIMESTAMP_KEY];
      if (data[GROUPS_KEY] != null) builder.groups.addAll(data[GROUPS_KEY].keys);
      if (data[OPTIONS_KEY] != null) builder.options.addAll(data[OPTIONS_KEY].keys);
      return builder;
    });
  }

  _entityAdded(firebase.QueryEvent event, Function deserializer, Map<String, Object> map, StreamController controller) {
    final data = deserializer(event);
    map[event.snapshot.key] = data;
    controller.add(event.snapshot.key);
    _checkChangeKey(event.snapshot.key);
  }

  _entityChanged(firebase.QueryEvent event, Function deserializer, Map<String, Object> map, StreamController controller) {
    map.remove(event.snapshot.key);
    final data = deserializer(event);
    map[event.snapshot.key] = data;
    controller.add(event.snapshot.key);
    _checkChangeKey(event.snapshot.key);
  }

  _entityRemoved(firebase.QueryEvent event, Function deserializer, Map<String, Object> map, StreamController controller) {
    map.remove(event.snapshot.key);
    _userDidChange.add(event.snapshot.key);
    _checkChangeKey(event.snapshot.key);
  }

  _checkChangeKey(String uid) {
    if (_theGroupUid == uid) _theGroupDidChange.add(theGroup);
    if (_theUserUid == uid) _theUserDidChange.add(theUser);
  }

  // Lifecycle

  Future signIn() async {
    try {
      await _fbAuth.signInWithRedirect(_fbGoogleAuthProvider);
    } catch (error) {
      try {
        await _fbAuth.signInWithPopup(_fbGoogleAuthProvider);
      } catch (error) {}
    }
  }

  Future signOut() async {
    _fbAuth.signOut();
  }

  void _authChanged(firebase.AuthEvent authData) {
    String userUid;
    if (authData.user != null) {
      userRef(authData.user.uid).once('value').then((firebase.QueryEvent event) {
        _userExistsCallback(authData, event);
      });
      userUid = authData.user.uid;
      _setupSubs();
    } else {
      userUid = null;
      _cancelSubs();
    }
    // If the user's uid is known update it.
    if (userUid != _theUserUid) {
      _theUserUid = userUid;
      _theUserDidChange.add(theUser);
    }
  }

  void _userExistsCallback(firebase.AuthEvent authData, firebase.QueryEvent event) {
    if (event.snapshot.val() != null) {
      userRef(authData.user.uid).update({
        ACTIVE_KEY: true,
        ACTIVE_TIMESTAMP_KEY: _timeStamp(),
      });
      userRef(authData.user.uid).onDisconnect().update({
        ACTIVE_KEY: false,
        ACTIVE_TIMESTAMP_KEY: _timeStamp(),
      });
    } else {
      userRef(authData.user.uid).set({
        NAME_KEY: _displayName(authData.user.displayName),
        ACTIVE_KEY: true,
        ACTIVE_TIMESTAMP_KEY: _timeStamp(),
      });
    }
  }

  String _displayName(String name) {
    List<String> splitName = name.split(" ");
    if (splitName.length == 2) return "${splitName[0]} ${splitName[1].substring(0,1)}.";
    return name;
  }

  void _setupSubs() {
    _cancelSubs();
    _fbGroups = _fbDatabase.ref(GROUPS_KEY);
    _subs.add(_fbGroups.onChildAdded.listen((firebase.QueryEvent event) => _entityAdded(event, _groupDateFromEvent, _groups, _groupDidChange)));
    _subs.add(_fbGroups.onChildChanged.listen((firebase.QueryEvent event) => _entityChanged(event, _groupDateFromEvent, _groups, _groupDidChange)));
    _subs.add(_fbGroups.onChildRemoved.listen((firebase.QueryEvent event) => _entityRemoved(event, _groupDateFromEvent, _groups, _groupDidChange)));

    _fbOptions = _fbDatabase.ref(OPTIONS_KEY);
    _subs.add(_fbOptions.onChildAdded.listen((firebase.QueryEvent event) => _entityAdded(event, _optionDateFromEvent, _options, _optionDidChange)));
    _subs.add(_fbOptions.onChildChanged.listen((firebase.QueryEvent event) => _entityChanged(event, _optionDateFromEvent, _options, _optionDidChange)));
    _subs.add(_fbOptions.onChildRemoved.listen((firebase.QueryEvent event) => _entityRemoved(event, _optionDateFromEvent, _options, _optionDidChange)));

    _fbPicks = _fbDatabase.ref(PICKS_KEY);
    _subs.add(_fbPicks.onChildAdded.listen((firebase.QueryEvent event) => _entityAdded(event, _pickDateFromEvent, _picks, _pickDidChange)));
    _subs.add(_fbPicks.onChildChanged.listen((firebase.QueryEvent event) => _entityChanged(event, _pickDateFromEvent, _picks, _pickDidChange)));
    _subs.add(_fbPicks.onChildRemoved.listen((firebase.QueryEvent event) => _entityRemoved(event, _pickDateFromEvent, _picks, _pickDidChange)));

    _fbUsers = _fbDatabase.ref(USERS_KEY);
    _subs.add(_fbUsers.onChildAdded.listen((firebase.QueryEvent event) => _entityAdded(event, _userDateFromEvent, _users, _userDidChange)));
    _subs.add(_fbUsers.onChildChanged.listen((firebase.QueryEvent event) => _entityChanged(event, _userDateFromEvent, _users, _userDidChange)));
    _subs.add(_fbUsers.onChildRemoved.listen((firebase.QueryEvent event) => _entityRemoved(event, _userDateFromEvent, _users, _userDidChange)));
  }

  void _cancelSubs() {
    _subs.forEach((sub) => sub.cancel());
    _subs.clear();
  }

  // update methods

  Future<String> createGroup(String groupName) async {
    if (theUser == null) return '';
    firebase.DatabaseReference pushRef = _fbGroups.push({
      NAME_KEY: groupName,
      CREATOR_KEY: _theUserUid,
    });
    groupRef(pushRef.key, USERS_KEY).child(_theUserUid).set(true);
    userRef(_theUserUid, GROUPS_KEY).child(pushRef.key).set(true);
    return pushRef.key;
  }

  Future deleteGroup(String uid) async {
    if (!groups.containsKey(uid) || _theUserUid != groups[uid].creator) return;
    groupRef(uid, DELETED_KEY).set(true);
  }

  Future updateDescription(String text) async {
    if (theGroup == null || _theUserUid != theGroup.creator) return;
    groupRef(_theGroupUid, DESCRIPTION_KEY).set(text);
  }

  Future disableOption(String uid) async {
    if (theGroup == null || !theGroup.options.contains(uid)) return;
    groupRef(_theGroupUid, BLOCKED_OPTIONS_KEY).child(uid).set(true);
  }

  Future enableOption(String uid) async {
    if (theGroup == null) return;
    groupRef(_theGroupUid, BLOCKED_OPTIONS_KEY).child(uid).remove();
  }

  Future disableUser(String uid) async {
    if (theGroup == null || !theGroup.users.contains(uid)) return;
    groupRef(_theGroupUid, BLOCKED_USERS_KEY).child(uid).set(true);
  }

  Future enableUser(String uid) async {
    if (theGroup == null) return;
    groupRef(_theGroupUid, BLOCKED_USERS_KEY).child(uid).remove();
  }

  Future<String> createOption(String optionName) async {
    if (theGroup == null || theUser == null) return '';
    firebase.DatabaseReference pushRef = _fbOptions.push({
      NAME_KEY: optionName,
      CREATOR_KEY: _theUserUid,
      GROUP_KEY: _theGroupUid,
    });
    groupRef(_theGroupUid, OPTIONS_KEY).child(pushRef.key).set(true);
    groupRef(_theGroupUid, USERS_KEY).child(_theUserUid).set(true);
    userRef(_theUserUid, OPTIONS_KEY).child(pushRef.key).set(true);
    return pushRef.key;
  }

  Future deleteOption(String uid) async {
    if (!options.containsKey(uid) || _theUserUid != options[uid].creator) return;
    optionRef(uid, DELETED_KEY).set(true);
  }

  Future<String> createPick(String uid) async {
    if (theGroup == null || theGroup == null) return '';
    firebase.DatabaseReference pushRef = _fbPicks.push({
      OPTION_KEY: uid,
      CREATOR_KEY: _theUserUid,
      PICK_TIMESTAMP_KEY: _timeStamp(),
    });
    groupRef(_theGroupUid, PICKS_KEY).child(pushRef.key).set(true);
    return pushRef.key;
  }

  // Local only

  Future joinGroup(String uid) async => _selectGroup(uid);

  Future leaveGroup() async => _selectGroup(null);

  void _selectGroup(String uid) {
    _theGroupUid = uid;
    _theGroupDidChange.add(theGroup);
    _setGroupToLocal(uid);
  }

  void _setGroupToLocal(String uid) {
    Uri current = Uri.base;
    Map<String, String> params = new Map<String, String>();
    if (uid != null) {
      params[GROUP_KEY] = uid;
      window.localStorage[GROUP_KEY] = uid;
    } else {
      window.localStorage.remove(GROUP_KEY);
    }
    current = current.replace(queryParameters: params);
    window.history.pushState('', '', current.toString());
    _theGroupDidChange.add(theGroup);
  }
}
