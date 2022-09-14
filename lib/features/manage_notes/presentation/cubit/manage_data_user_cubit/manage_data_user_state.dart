part of 'manage_data_user_cubit.dart';

@immutable
abstract class ManageDataUserState {}

class ManageDataUserInitial extends ManageDataUserState {}

class ManageDataInterestsLoading extends ManageDataUserState {}

class ManageDataInterestsSuccess extends ManageDataUserState {}

class ManageDataInterestsError extends ManageDataUserState {
  final String error;
  ManageDataInterestsError(this.error);
}

class ManageDataUserLoading extends ManageDataUserState {}

class ManageDataUserSuccess extends ManageDataUserState {
  final String success;
  ManageDataUserSuccess(this.success);
}

class ManageDataUserError extends ManageDataUserState {
  final String error;
  ManageDataUserError(this.error);
}
