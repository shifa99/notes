import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notes_project/config/routes/navigation.dart';
import 'package:notes_project/core/utills/color_manager.dart';
import 'package:notes_project/core/utills/style_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:notes_project/core/utills/values_manager.dart';
import 'package:notes_project/features/manage_notes/domain/entities/note.dart';
import 'package:notes_project/features/manage_notes/presentation/cubit/manage_notes_cubit.dart';
import 'package:notes_project/features/manage_notes/presentation/screens/edit_note_screen.dart';

class NoteItem extends StatelessWidget {
  NoteItem({Key? key, required this.note}) : super(key: key);
  Note note;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 15.w),
      child: Row(
        children: [
          Expanded(
              child: Text(
            note.text,
            style: bodyStyle(),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          )),
          SizedBox(
            width: AppSizes.size20w,
          ),
          IconButton(
              onPressed: () async {
                Note? tempNote = await navigateTo(
                    context: context,
                    screen: EditNoteScreen(
                      id: note.id,
                    ));
                if (tempNote != null) 
                {
                  note = tempNote;
                  // ignore: use_build_context_synchronously
                  ManageNotesCubit.get(context).rebuild();
                }
              },
              icon: Icon(
                Icons.edit,
                color: ColorManager.semiBlackColor,
              ))
        ],
      ),
    );
  }
}
