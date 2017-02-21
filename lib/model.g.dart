// GENERATED CODE - DO NOT MODIFY BY HAND

part of vybor.model;

// **************************************************************************
// Generator: BuiltValueGenerator
// Target: abstract class GroupData
// **************************************************************************

class _$GroupData extends GroupData {
  @override
  final String name;
  @override
  final String creator;
  @override
  final bool deleted;
  @override
  final BuiltList<String> options;
  @override
  final BuiltList<String> blockedOptions;
  @override
  final BuiltList<String> users;
  @override
  final BuiltList<String> blockedUsers;
  @override
  final BuiltList<String> picks;

  factory _$GroupData([updates(GroupDataBuilder b)]) =>
      (new GroupDataBuilder()..update(updates)).build();

  _$GroupData._(
      {this.name,
      this.creator,
      this.deleted,
      this.options,
      this.blockedOptions,
      this.users,
      this.blockedUsers,
      this.picks})
      : super._() {
    if (name == null) throw new ArgumentError.notNull('name');
    if (creator == null) throw new ArgumentError.notNull('creator');
    if (deleted == null) throw new ArgumentError.notNull('deleted');
    if (options == null) throw new ArgumentError.notNull('options');
    if (blockedOptions == null)
      throw new ArgumentError.notNull('blockedOptions');
    if (users == null) throw new ArgumentError.notNull('users');
    if (blockedUsers == null) throw new ArgumentError.notNull('blockedUsers');
    if (picks == null) throw new ArgumentError.notNull('picks');
  }

  @override
  GroupData rebuild(updates(GroupDataBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  GroupDataBuilder toBuilder() => new GroupDataBuilder()..replace(this);

  @override
  bool operator ==(dynamic other) {
    if (other is! GroupData) return false;
    return name == other.name &&
        creator == other.creator &&
        deleted == other.deleted &&
        options == other.options &&
        blockedOptions == other.blockedOptions &&
        users == other.users &&
        blockedUsers == other.blockedUsers &&
        picks == other.picks;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc($jc($jc(0, name.hashCode), creator.hashCode),
                            deleted.hashCode),
                        options.hashCode),
                    blockedOptions.hashCode),
                users.hashCode),
            blockedUsers.hashCode),
        picks.hashCode));
  }

  @override
  String toString() {
    return 'GroupData {'
        'name=${name.toString()},\n'
        'creator=${creator.toString()},\n'
        'deleted=${deleted.toString()},\n'
        'options=${options.toString()},\n'
        'blockedOptions=${blockedOptions.toString()},\n'
        'users=${users.toString()},\n'
        'blockedUsers=${blockedUsers.toString()},\n'
        'picks=${picks.toString()},\n'
        '}';
  }
}

class GroupDataBuilder implements Builder<GroupData, GroupDataBuilder> {
  GroupData _$v;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  String _creator;
  String get creator => _$this._creator;
  set creator(String creator) => _$this._creator = creator;

  bool _deleted;
  bool get deleted => _$this._deleted;
  set deleted(bool deleted) => _$this._deleted = deleted;

  ListBuilder<String> _options;
  ListBuilder<String> get options =>
      _$this._options ??= new ListBuilder<String>();
  set options(ListBuilder<String> options) => _$this._options = options;

  ListBuilder<String> _blockedOptions;
  ListBuilder<String> get blockedOptions =>
      _$this._blockedOptions ??= new ListBuilder<String>();
  set blockedOptions(ListBuilder<String> blockedOptions) =>
      _$this._blockedOptions = blockedOptions;

  ListBuilder<String> _users;
  ListBuilder<String> get users => _$this._users ??= new ListBuilder<String>();
  set users(ListBuilder<String> users) => _$this._users = users;

  ListBuilder<String> _blockedUsers;
  ListBuilder<String> get blockedUsers =>
      _$this._blockedUsers ??= new ListBuilder<String>();
  set blockedUsers(ListBuilder<String> blockedUsers) =>
      _$this._blockedUsers = blockedUsers;

  ListBuilder<String> _picks;
  ListBuilder<String> get picks => _$this._picks ??= new ListBuilder<String>();
  set picks(ListBuilder<String> picks) => _$this._picks = picks;

  GroupDataBuilder();

  GroupDataBuilder get _$this {
    if (_$v != null) {
      _name = _$v.name;
      _creator = _$v.creator;
      _deleted = _$v.deleted;
      _options = _$v.options?.toBuilder();
      _blockedOptions = _$v.blockedOptions?.toBuilder();
      _users = _$v.users?.toBuilder();
      _blockedUsers = _$v.blockedUsers?.toBuilder();
      _picks = _$v.picks?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GroupData other) {
    _$v = other;
  }

  @override
  void update(updates(GroupDataBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  GroupData build() {
    final result = _$v ??
        new _$GroupData._(
            name: name,
            creator: creator,
            deleted: deleted,
            options: options?.build(),
            blockedOptions: blockedOptions?.build(),
            users: users?.build(),
            blockedUsers: blockedUsers?.build(),
            picks: picks?.build());
    replace(result);
    return result;
  }
}

// **************************************************************************
// Generator: BuiltValueGenerator
// Target: abstract class OptionData
// **************************************************************************

class _$OptionData extends OptionData {
  @override
  final String name;
  @override
  final String creator;
  @override
  final bool deleted;
  @override
  final String group;

  factory _$OptionData([updates(OptionDataBuilder b)]) =>
      (new OptionDataBuilder()..update(updates)).build();

  _$OptionData._({this.name, this.creator, this.deleted, this.group})
      : super._() {
    if (name == null) throw new ArgumentError.notNull('name');
    if (creator == null) throw new ArgumentError.notNull('creator');
    if (deleted == null) throw new ArgumentError.notNull('deleted');
    if (group == null) throw new ArgumentError.notNull('group');
  }

  @override
  OptionData rebuild(updates(OptionDataBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  OptionDataBuilder toBuilder() => new OptionDataBuilder()..replace(this);

  @override
  bool operator ==(dynamic other) {
    if (other is! OptionData) return false;
    return name == other.name &&
        creator == other.creator &&
        deleted == other.deleted &&
        group == other.group;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, name.hashCode), creator.hashCode), deleted.hashCode),
        group.hashCode));
  }

  @override
  String toString() {
    return 'OptionData {'
        'name=${name.toString()},\n'
        'creator=${creator.toString()},\n'
        'deleted=${deleted.toString()},\n'
        'group=${group.toString()},\n'
        '}';
  }
}

class OptionDataBuilder implements Builder<OptionData, OptionDataBuilder> {
  OptionData _$v;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  String _creator;
  String get creator => _$this._creator;
  set creator(String creator) => _$this._creator = creator;

  bool _deleted;
  bool get deleted => _$this._deleted;
  set deleted(bool deleted) => _$this._deleted = deleted;

  String _group;
  String get group => _$this._group;
  set group(String group) => _$this._group = group;

  OptionDataBuilder();

  OptionDataBuilder get _$this {
    if (_$v != null) {
      _name = _$v.name;
      _creator = _$v.creator;
      _deleted = _$v.deleted;
      _group = _$v.group;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(OptionData other) {
    _$v = other;
  }

  @override
  void update(updates(OptionDataBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  OptionData build() {
    final result = _$v ??
        new _$OptionData._(
            name: name, creator: creator, deleted: deleted, group: group);
    replace(result);
    return result;
  }
}

// **************************************************************************
// Generator: BuiltValueGenerator
// Target: abstract class PickData
// **************************************************************************

class _$PickData extends PickData {
  @override
  final String option;
  @override
  final String creator;
  @override
  final String pickTimestamp;

  factory _$PickData([updates(PickDataBuilder b)]) =>
      (new PickDataBuilder()..update(updates)).build();

  _$PickData._({this.option, this.creator, this.pickTimestamp}) : super._() {
    if (option == null) throw new ArgumentError.notNull('option');
    if (creator == null) throw new ArgumentError.notNull('creator');
    if (pickTimestamp == null) throw new ArgumentError.notNull('pickTimestamp');
  }

  @override
  PickData rebuild(updates(PickDataBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  PickDataBuilder toBuilder() => new PickDataBuilder()..replace(this);

  @override
  bool operator ==(dynamic other) {
    if (other is! PickData) return false;
    return option == other.option &&
        creator == other.creator &&
        pickTimestamp == other.pickTimestamp;
  }

  @override
  int get hashCode {
    return $jf($jc($jc($jc(0, option.hashCode), creator.hashCode),
        pickTimestamp.hashCode));
  }

  @override
  String toString() {
    return 'PickData {'
        'option=${option.toString()},\n'
        'creator=${creator.toString()},\n'
        'pickTimestamp=${pickTimestamp.toString()},\n'
        '}';
  }
}

class PickDataBuilder implements Builder<PickData, PickDataBuilder> {
  PickData _$v;

  String _option;
  String get option => _$this._option;
  set option(String option) => _$this._option = option;

  String _creator;
  String get creator => _$this._creator;
  set creator(String creator) => _$this._creator = creator;

  String _pickTimestamp;
  String get pickTimestamp => _$this._pickTimestamp;
  set pickTimestamp(String pickTimestamp) =>
      _$this._pickTimestamp = pickTimestamp;

  PickDataBuilder();

  PickDataBuilder get _$this {
    if (_$v != null) {
      _option = _$v.option;
      _creator = _$v.creator;
      _pickTimestamp = _$v.pickTimestamp;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PickData other) {
    _$v = other;
  }

  @override
  void update(updates(PickDataBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  PickData build() {
    final result = _$v ??
        new _$PickData._(
            option: option, creator: creator, pickTimestamp: pickTimestamp);
    replace(result);
    return result;
  }
}

// **************************************************************************
// Generator: BuiltValueGenerator
// Target: abstract class UserData
// **************************************************************************

class _$UserData extends UserData {
  @override
  final String name;
  @override
  final BuiltList<String> groups;
  @override
  final BuiltList<String> options;
  @override
  final bool active;
  @override
  final String activeTimestamp;

  factory _$UserData([updates(UserDataBuilder b)]) =>
      (new UserDataBuilder()..update(updates)).build();

  _$UserData._(
      {this.name, this.groups, this.options, this.active, this.activeTimestamp})
      : super._() {
    if (name == null) throw new ArgumentError.notNull('name');
    if (groups == null) throw new ArgumentError.notNull('groups');
    if (options == null) throw new ArgumentError.notNull('options');
    if (active == null) throw new ArgumentError.notNull('active');
    if (activeTimestamp == null)
      throw new ArgumentError.notNull('activeTimestamp');
  }

  @override
  UserData rebuild(updates(UserDataBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  UserDataBuilder toBuilder() => new UserDataBuilder()..replace(this);

  @override
  bool operator ==(dynamic other) {
    if (other is! UserData) return false;
    return name == other.name &&
        groups == other.groups &&
        options == other.options &&
        active == other.active &&
        activeTimestamp == other.activeTimestamp;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc($jc(0, name.hashCode), groups.hashCode), options.hashCode),
            active.hashCode),
        activeTimestamp.hashCode));
  }

  @override
  String toString() {
    return 'UserData {'
        'name=${name.toString()},\n'
        'groups=${groups.toString()},\n'
        'options=${options.toString()},\n'
        'active=${active.toString()},\n'
        'activeTimestamp=${activeTimestamp.toString()},\n'
        '}';
  }
}

class UserDataBuilder implements Builder<UserData, UserDataBuilder> {
  UserData _$v;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  ListBuilder<String> _groups;
  ListBuilder<String> get groups =>
      _$this._groups ??= new ListBuilder<String>();
  set groups(ListBuilder<String> groups) => _$this._groups = groups;

  ListBuilder<String> _options;
  ListBuilder<String> get options =>
      _$this._options ??= new ListBuilder<String>();
  set options(ListBuilder<String> options) => _$this._options = options;

  bool _active;
  bool get active => _$this._active;
  set active(bool active) => _$this._active = active;

  String _activeTimestamp;
  String get activeTimestamp => _$this._activeTimestamp;
  set activeTimestamp(String activeTimestamp) =>
      _$this._activeTimestamp = activeTimestamp;

  UserDataBuilder();

  UserDataBuilder get _$this {
    if (_$v != null) {
      _name = _$v.name;
      _groups = _$v.groups?.toBuilder();
      _options = _$v.options?.toBuilder();
      _active = _$v.active;
      _activeTimestamp = _$v.activeTimestamp;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UserData other) {
    _$v = other;
  }

  @override
  void update(updates(UserDataBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  UserData build() {
    final result = _$v ??
        new _$UserData._(
            name: name,
            groups: groups?.build(),
            options: options?.build(),
            active: active,
            activeTimestamp: activeTimestamp);
    replace(result);
    return result;
  }
}
