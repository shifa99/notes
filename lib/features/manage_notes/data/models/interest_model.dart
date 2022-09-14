import 'package:notes_project/features/manage_notes/domain/entities/interest.dart';
import 'package:notes_project/features/manage_notes/domain/entities/user.dart';

class InterstModel extends Interest {
  InterstModel({required super.id, required super.title});
  factory InterstModel.fromJson(Map<String,dynamic>data)
  {
    return InterstModel(id: data['id'], title: data['intrestText']);

  }
}
