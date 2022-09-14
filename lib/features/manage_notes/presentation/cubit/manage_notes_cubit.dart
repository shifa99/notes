import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_project/core/apis/end_points.dart';
import 'package:notes_project/core/apis/handling_apis.dart';
import 'package:notes_project/features/manage_notes/domain/entities/note.dart';
import 'package:notes_project/features/manage_notes/domain/repositories/notes_repository.dart';
part 'manage_notes_state.dart';

class ManageNotesCubit extends Cubit<ManageNotesState> {
  ManageNotesCubit() : super(ManageNotesInitial());
  static ManageNotesCubit get(context) => BlocProvider.of(context);
  final NotesRepository _notesRepository = NotesRepository();
  List<Note> notes = [];
  void rebuild() {
    log('rebuild');
    emit(ManageNotesSuccess());
  }

  Future<void> getAllNotes() async {
    emit(ManageNotesLoading());
    try {
      notes = await _notesRepository.getallNotes();
      emit(ManageNotesSuccess());
    } catch (e) {
      emit(ManageNotesError(e.toString()));
      rethrow;
    }
  }

  Future<void> editSpecificNote({
    required String id,
  }) async {
    emit(ManageNotesLoading());
    try {
      Note note = await _notesRepository.getNoteById(id: id);
      emit(ManageNotesSuccess());
    } catch (e) {
      emit(ManageNotesError(e.toString()));
      rethrow;
    }
  }
}
