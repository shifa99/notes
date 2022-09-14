part of 'manage_note_cubit.dart';

@immutable
abstract class ManageNoteState {}

class ManageNoteInitial extends ManageNoteState {}

class ManageNoteEditLoading extends ManageNoteState {}

class ManageNoteEditSuccess extends ManageNoteState {}

class ManageNoteEditError extends ManageNoteState {
  final String error;
  ManageNoteEditError(this.error);
}

class ManageNoteEditedLoading extends ManageNoteState {}

class ManageNoteEditedSuccess extends ManageNoteState {
  final String success;
  ManageNoteEditedSuccess(this.success);
}

class ManageNoteEditedError extends ManageNoteState {
  final String error;
  ManageNoteEditedError(this.error);
}
