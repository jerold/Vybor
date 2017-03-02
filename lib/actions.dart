import 'package:w_flux/w_flux.dart';

class Actions {
	/// authenticate.
	final Action signIn = new Action();

	/// Unauthenticate.
	final Action signOut = new Action();

	/// Configures app to show a view of the named group.
	final Action<String> joinGroup = new Action<String>();

	/// Removes the app's previous group configuration.
	final Action leaveGroup = new Action();

	/// Make a new group.
	final Action<String> createGroup = new Action<String>();

	/// Adds a Pick to the UserData in the list associated to their current group.
	final Action<String> deleteGroup = new Action<String>();

  /// Change the description of the current group.
  final Action<String> updateDescription = new Action<String>();

	/// Prevents a specific user's choice from being taken into consideration
	/// during pick within the current group.
	final Action<String> disableOption = new Action<String>();

	/// Choices are, by default, enabled. But if the Choice was previously
	/// blocked from pick consideration, this removes that block.
	final Action<String> enableOption = new Action<String>();

	/// Prevents any of a user's choices from being taken into consideration
	/// during pick within the current group.
	final Action<String> disableUser = new Action<String>();

	/// Users are, by default, enabled. But if the User was previously
	/// blocked from pick consideration, this removes that block.
	final Action<String> enableUser = new Action<String>();

  /// Option created by current user in current group.
  final Action<String> createOption = new Action<String>();

  /// Mark option as deleted.
  final Action<String> deleteOption = new Action<String>();

  /// Select one of the picks from one of the users in a group.
	final Action createPick = new Action();
}
