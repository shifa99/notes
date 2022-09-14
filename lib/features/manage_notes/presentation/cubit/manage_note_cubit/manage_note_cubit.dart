import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_project/features/manage_notes/data/models/note_model.dart';
import 'package:notes_project/features/manage_notes/domain/entities/note.dart';
import 'package:notes_project/features/manage_notes/domain/entities/user.dart';
import 'package:notes_project/features/manage_notes/domain/repositories/notes_repository.dart';
import 'package:notes_project/features/manage_notes/domain/repositories/users_repository.dart';
part 'manage_note_state.dart';

class ManageNoteCubit extends Cubit<ManageNoteState> {
  ManageNoteCubit() : super(ManageNoteEditLoading());
  static ManageNoteCubit get(context) => BlocProvider.of(context);
  final NotesRepository _notesRepository = NotesRepository();
  final UserRepository _userRepository = UserRepository();
  late Note note;
  List<User> users = [];
  String? selectedUser;
  String getUserIdByName(String username) {
    for (int index = 0; index < users.length; index++) {
      if (users[index].username == username) {
        note.userId = users[index].id;
        return note.userId;
      }
    }
   
    return "-1";
  }

  Future<void> getNoteById({required String id}) async {
    emit(ManageNoteEditLoading());
    try {
      final respones = await Future.wait([
        _notesRepository.getNoteById(id: id),
        _userRepository.getallUsers(),
      ]);
      note = respones[0] as Note;
      users = respones[1] as List<User>;
      if (note.userId.isNotEmpty) {
        for (User user in users) {
          if (user.id == note.userId) {
            selectedUser = user.username;
            break;
          }
        }
      }
      emit(ManageNoteEditSuccess());
    } catch (e) {
      emit(ManageNoteEditError(e.toString()));
      rethrow;
    }
  }
  //edit

  Future<void> updateNote() async {
    emit(ManageNoteEditedLoading());
    try {
      Map<String, dynamic> data = {
        'text': note.text,
        'placeDateTime': note.placeDateTime,
        'userId':selectedUser==null?null :getUserIdByName(selectedUser!),
        'id': note.id,
      };
      String respons = await _notesRepository.updateNote(noteModel: data);

      emit(ManageNoteEditedSuccess(respons));
    } catch (e) {
      emit(ManageNoteEditedError(e.toString()));
      rethrow;
    }
  }
}
