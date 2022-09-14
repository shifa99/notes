import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:notes_project/config/success_toast.dart';
import 'package:notes_project/core/utills/color_manager.dart';
import 'package:notes_project/core/utills/style_manager.dart';
import 'package:notes_project/core/widgets/default_app_bar.dart';
import 'package:notes_project/core/widgets/default_dropdown.dart';
import 'package:notes_project/core/widgets/default_loading.dart';
import 'package:notes_project/core/widgets/default_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:notes_project/features/manage_notes/presentation/cubit/manage_note_cubit/manage_note_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_project/features/manage_notes/presentation/cubit/manage_notes_cubit.dart';

class EditNoteScreen extends StatelessWidget {
  EditNoteScreen({Key? key, required this.id}) : super(key: key);
  final String id;
  TextEditingController note = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      lazy: false,
      create: (context) => ManageNoteCubit()..getNoteById(id: id),
      child: Form(
        key: formKey,
        child: Builder(builder: (context) {
          return Scaffold(
            appBar: defaultAppbar(title: 'Edit Note', actions: [
              IconButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      ManageNoteCubit.get(context).note.text = note.text;
                      ManageNoteCubit.get(context).updateNote();
                    }
                  },
                  icon: const Icon(Icons.save)),
            ]),
            body: Padding(
              padding: EdgeInsets.all(16.r),
              child: BlocConsumer<ManageNoteCubit, ManageNoteState>(
                listener: (context, state) {
                  if (state is ManageNoteEditedSuccess) {
                    Navigator.pop(context,ManageNoteCubit.get(context).note);
                    successToast(state.success);
                  }
                },
                builder: (context, state) {
                  if (state is! ManageNoteEditLoading &&
                      state is! ManageNoteEditError) {
                    ManageNoteCubit cubit = ManageNoteCubit.get(context);
                    if (state is ManageNoteEditSuccess)
                      note.text = cubit.note.text;
                    return SingleChildScrollView(
                      child: Column(
                        children: [
                          defaultTextField(
                              controller: note,
                              maxLines: null,
                              hint: 'Note',
                              validator: (String note) {
                                if (note.isEmpty) {
                                  return 'Please enter note';
                                }
                                return null;
                              },
                              type: TextInputType.text),
                          SizedBox(
                            height: 20.h,
                          ),
                          if (cubit.users.isNotEmpty)
                            defaultDropdownButton(
                                title: 'Assign To User',
                                value: cubit.selectedUser,
                                onChanged: (value) {
                                  cubit.selectedUser = value;
                                },
                                items: cubit.users
                                    .map((e) => DropdownMenuItem(
                                          value: e.username,
                                          child: Text(
                                            e.username,
                                            style: bodyStyle(),
                                          ),
                                        ))
                                    .toList())
                        ],
                      ),
                    );
                  } else if (state is ManageNoteEditError) {
                    return Center(
                        child: Text(
                      state.error,
                      style: bodyStyle(
                        color: ColorManager.errorColor,
                      ),
                    ));
                  } else {
                    return const DefaultLoading();
                  }
                },
              ),
            ),
          );
        }),
      ),
    );
  }
}
