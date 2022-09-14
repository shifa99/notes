import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart';

import 'package:flutter/cupertino.dart';
import 'package:notes_project/core/apis/end_points.dart';
import 'package:notes_project/core/apis/handling_apis.dart';
import 'package:notes_project/features/manage_notes/data/models/interest_model.dart';
import 'package:notes_project/features/manage_notes/data/models/note_model.dart';
import 'package:notes_project/features/manage_notes/data/models/user_model.dart';
import 'package:notes_project/features/manage_notes/domain/entities/interest.dart';
import 'package:notes_project/features/manage_notes/domain/entities/note.dart';
import 'package:notes_project/features/manage_notes/domain/entities/user.dart';

class UserRepository {
  Future<List<Interest>> getAllIntersts() async {
    final response = await getData(url: EndPoints.getAllInterests);
    return List.from(response.data)
        .map((e) => InterstModel.fromJson(e))
        .toList();
  }

  Future<List<User>> getallUsers() async {
    final response = await getData(url: EndPoints.usersGetAll);
    log(response.toString());
    print(response.data.toString());
    return List.from(response.data).map((e) => UserModel.fromJson(e)).toList();
  }

  Future<Note> getNoteById({required String id}) async {
    final response = await getData(url: EndPoints.getNoteById + id);
    return NoteModel.fromJson(response.data);
  }

  Future<String> insertUser({
    required String username,
    required String password,
    required String email,
    required String interest,
    File? image,
  }) async {
    List<int> bytes = image != null ? image.readAsBytesSync() : [];
    String? img64 = base64Encode(bytes);
    final response = await postData(url: EndPoints.insertUser, data: {
      "Username": username,
      "Password": password,
      "Email": email,
      "ImageAsBase64": img64,
      "IntrestId": interest,
    });
    return response.data;
  }
}
