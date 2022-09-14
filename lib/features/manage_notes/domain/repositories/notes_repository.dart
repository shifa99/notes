import 'dart:developer';

import 'package:notes_project/core/apis/end_points.dart';
import 'package:notes_project/core/apis/handling_apis.dart';
import 'package:notes_project/features/manage_notes/data/models/note_model.dart';
import 'package:notes_project/features/manage_notes/domain/entities/note.dart';

class NotesRepository {
  Future<List<Note>> getallNotes() async {
    final response = await getData(url: EndPoints.notesGetAll);
    log(response.toString());
    return List.from(response.data).map((e) => NoteModel.fromJson(e)).toList();
  }

  Future<Note> getNoteById({required String id}) async {
    final response = await getData(url: EndPoints.getNoteById + id);
    return NoteModel.fromJson(response.data);
  }

  Future<String> updateNote({required Map<String, dynamic> noteModel}) async {
    log(noteModel.toString());
    final response = await postData(url: EndPoints.updateNote, data: noteModel);
    log('message');
    log(response.data.toString());
    return response.data;
  }
}
