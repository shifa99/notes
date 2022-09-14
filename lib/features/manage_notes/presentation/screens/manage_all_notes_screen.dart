import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:notes_project/config/routes/navigation.dart';
import 'package:notes_project/core/utills/color_manager.dart';
import 'package:notes_project/core/utills/style_manager.dart';
import 'package:notes_project/core/utills/values_manager.dart';
import 'package:notes_project/core/widgets/default_app_bar.dart';
import 'package:notes_project/core/widgets/default_loading.dart';
import 'package:notes_project/core/widgets/default_text_field.dart';
import 'package:notes_project/features/manage_notes/presentation/cubit/manage_notes_cubit.dart';
import 'package:notes_project/features/manage_notes/presentation/screens/add_user_screen.dart';
import 'package:notes_project/features/manage_notes/presentation/screens/options_screen.dart';
import 'package:notes_project/features/manage_notes/presentation/widgets/note_item.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ManageAllNotesScreen extends StatelessWidget {
  ManageAllNotesScreen({Key? key}) : super(key: key);
  final TextEditingController search = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {},
      ),
      appBar: defaultAppbar(title: 'Notes', actions: [
        IconButton(
            onPressed: () {
              navigateTo(context: context, screen: AddUserScreen());
            },
            icon: const Icon(Icons.person_add)),
        IconButton(
            onPressed: () {
              navigateTo(context: context, screen: const OptionsScreen());
            },
            icon: const Icon(Icons.settings)),
        IconButton(onPressed: () {}, icon: const Icon(Icons.bar_chart)),
      ]),
      body: BlocProvider(
        create: (context) => ManageNotesCubit()..getAllNotes(),
        lazy: false,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
              child: Row(
                children: [
                  IconButton(onPressed: () {}, icon: const Icon(Icons.filter)),
                  Expanded(
                    child: defaultTextField(
                        controller: search,
                        prefix: const Icon(Icons.search),
                        hint: 'Search',
                        onChanged: (value) {},
                        validator: (String value) {},
                        type: TextInputType.name),
                  ),
                ],
              ),
            ),
            Expanded(
              child: BlocBuilder<ManageNotesCubit, ManageNotesState>(
                builder: (context, state) {
                  if (state is ManageNotesSuccess) {
                    ManageNotesCubit cubit=ManageNotesCubit.get(context);
                    return ListView.separated(
                        itemBuilder: (context, index) =>  NoteItem(note: cubit.notes[index],),
                        separatorBuilder: (context, index) => Divider(
                              thickness: 1,
                              color: ColorManager.semiBlackColor,
                              height: AppSizes.size15H,
                            ),
                        itemCount: cubit.notes.length);
                  } else if (state is ManageNotesError) 
                  {
                    return Center(child: Text(state.error,style: bodyStyle(color: ColorManager.errorColor,)));
                  } else {
                    return const DefaultLoading();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
