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

  Future joinGroup(String uid);

  Future leaveGroup();

  Future createGroup(String name);

  Future deleteGroup(String uid);

  Future updateDescription(String text);

  Future disableOption(String uid);

  Future enableOption(String uid);

  Future disableUser(String uid);

  Future enableUser(String uid);

  Future createOption(String name);

  Future deleteOption(String uid);

  Future createPick(String uid);
}
