import 'dart:async';

import 'package:vybor/model.dart';


abstract class Client {
  // getters

  Map<String, GroupData> get groups;

  Map<String, OptionData> get options;

  Map<String, PickData> get picks;

  Map<String, UserData> get users;

  GroupData get theGroup;

  UserData get theUser;

  // streams

  Stream<String> get groupDidChange;

  Stream<String> get optionDidChange;

  Stream<String> get pickDidChange;

  Stream<String> get userDidChange;

  Stream<GroupData> get theGroupDidChange;

  Stream<UserData> get theUserDidChange;

  // setters

  Future signIn();

  Future signOut();

  Future joinGroup(uid);

  Future leaveGroup();

  Future createGroup(name);

  Future deleteGroup(uid);

  Future disableOption(uid);

  Future enableOption(uid);

  Future disableUser(uid);

  Future enableUser(uid);

  Future createOption(name);

  Future deleteOption(String uid);

  Future createPick(String uid);
}
