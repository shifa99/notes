import 'package:notes_project/features/manage_notes/domain/entities/note.dart';

class NoteModel extends Note {
  NoteModel(
      {required super.text,
      required super.placeDateTime,
      required super.userId,
      required super.id});
  factory NoteModel.fromJson(Map<String, dynamic> data) {
    return NoteModel(
        text: data['text'],
        placeDateTime: data['placeDateTime'],
        userId: data['userId'] ?? '',
        id: data['id']);
  }
  Map<String, dynamic> toMap() {
    return 
    {
      'text': text,
      'placeDateTime': placeDateTime,
      'userId': userId,
      'id': id,
    };
  }
}
