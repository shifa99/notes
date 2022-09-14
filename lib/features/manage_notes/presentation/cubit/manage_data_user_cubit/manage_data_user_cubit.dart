import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_project/features/manage_notes/domain/entities/interest.dart';
import 'package:notes_project/features/manage_notes/domain/repositories/users_repository.dart';
part 'manage_data_user_state.dart';

class ManageDataUserCubit extends Cubit<ManageDataUserState> {
  ManageDataUserCubit() : super(ManageDataUserInitial());
  static ManageDataUserCubit get(context) => BlocProvider.of(context);
  final UserRepository _userRepository = UserRepository();
  List<Interest> interests = [];
  String? selectedInterest;
  Future<void> getIntersts() async {
    emit(ManageDataInterestsLoading());
    try {
      interests = await _userRepository.getAllIntersts();
      emit(ManageDataInterestsSuccess());
    } catch (e) {
      emit(ManageDataInterestsError(e.toString()));
      rethrow;
    }
  }

  Future<void> insertUser({
    required String username,
    required String password,
    required String email,
    File? image,
  }) async {
    emit(ManageDataUserLoading());
    try {

      String response = await _userRepository.insertUser(
          username: username,
          password: password,
          email: email,
          interest: selectedInterest!,
          image: image);
      emit(ManageDataUserSuccess(response));
    } catch (e) {
      
      emit(ManageDataUserError(e.toString()));
      rethrow;
    }
  }
}
