library vybor.model;

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';

part 'model.g.dart';

/// As good as having never picked or been active or anything.
final DateTime UNK_DATE = new DateTime.fromMillisecondsSinceEpoch(0);

abstract class DataModel {}

abstract class GroupData implements Built<GroupData, GroupDataBuilder>, DataModel {
	String get name;

  String get creator;

  bool get deleted;

  BuiltList<String> get options;

	BuiltList<String> get blockedOptions;

  BuiltList<String> get users;

	BuiltList<String> get blockedUsers;

  BuiltList<String> get picks;

  factory GroupData([updates(GroupDataBuilder b)]) = _$GroupData;
  GroupData._();
}

abstract class OptionData implements Built<OptionData, OptionDataBuilder>, DataModel {
  String get name;

  String get creator;

  bool get deleted;

  String get group;

  factory OptionData([updates(OptionDataBuilder b)]) = _$OptionData;
  OptionData._();
}

abstract class PickData implements Built<PickData, PickDataBuilder>, DataModel {
  String get option;

  String get creator;

  String get pickTimestamp;

  factory PickData([updates(PickDataBuilder b)]) = _$PickData;
  PickData._();
}

abstract class UserData implements Built<UserData, UserDataBuilder>, DataModel {
	String get name;

  /// Groups created by this User.
  BuiltList<String> get groups;

  /// Options created by this User.
  BuiltList<String> get options;

  bool get active;

  String get activeTimestamp;

  factory UserData([updates(UserDataBuilder b)]) = _$UserData;
  UserData._();
}
