part of 'manage_notes_cubit.dart';

abstract class ManageNotesState {
  const ManageNotesState();
}

class ManageNotesInitial extends ManageNotesState {}

class ManageNotesLoading extends ManageNotesState {}

class ManageNotesSuccess extends ManageNotesState {}

class ManageNotesError extends ManageNotesState {
  final String error;
  ManageNotesError(this.error);
}
class ManageNotesEditLoading extends ManageNotesState {}

class ManageNotesEditSuccess extends ManageNotesState {}

class ManageNotesSuccessError extends ManageNotesState {
  final String error;
  ManageNotesSuccessError(this.error);
}
