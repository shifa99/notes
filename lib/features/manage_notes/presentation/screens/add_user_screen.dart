import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:notes_project/config/error_toast.dart';
import 'package:notes_project/core/helpers/pickers.dart';
import 'package:notes_project/core/utills/style_manager.dart';
import 'package:notes_project/core/utills/values_manager.dart';
import 'package:notes_project/core/widgets/default_app_bar.dart';
import 'package:notes_project/core/widgets/default_dropdown.dart';
import 'package:notes_project/core/widgets/default_loading.dart';
import 'package:notes_project/core/widgets/default_text_button.dart';
import 'package:notes_project/core/widgets/default_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:email_validator/email_validator.dart';
import 'package:notes_project/core/widgets/success_toast.dart';
import 'package:notes_project/features/manage_notes/presentation/cubit/helper_cubit/helper_cubit.dart';
import 'package:notes_project/features/manage_notes/presentation/cubit/manage_data_user_cubit/manage_data_user_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddUserScreen extends StatelessWidget {
  AddUserScreen({Key? key}) : super(key: key);
  TextEditingController userName = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController email = TextEditingController();
  final formKey = GlobalKey<FormState>();
  File? file;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppbar(title: 'Add User'),
      body: Padding(
        padding: EdgeInsets.all(16.r),
        child: BlocProvider(
          create: (context) => ManageDataUserCubit()..getIntersts(),
          child: BlocConsumer<ManageDataUserCubit, ManageDataUserState>(
            listener: (context, state) {
              if (state is ManageDataUserSuccess) {
                Navigator.pop(context);
                successToast(state.success);
              }
            },
            builder: (context, state) {
              if (state is! ManageDataInterestsLoading &&
                  state is! ManageDataInterestsError) {
                ManageDataUserCubit cubit = ManageDataUserCubit.get(context);
                return SingleChildScrollView(
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        BlocProvider(
                          create: (context) => HelperCubit(),
                          child: BlocBuilder<HelperCubit, HelperState>(
                            builder: (context, state) {
                              return InkWell(
                                onTap: () async {
                                  file = await PickerServices.pickImage();
                                  if (file != null) {
                                    HelperCubit.get(context).rebuildPart();
                                  }
                                },
                                child: CircleAvatar(
                                  backgroundImage:
                                      file == null ? null : FileImage(file!),
                                  radius: 80.r,
                                ),
                              );
                            },
                          ),
                        ),
                        SizedBox(
                          height: AppSizes.size5H,
                        ),
                        Text(
                          'Select Image',
                          style: bodyStyle(),
                        ),
                        SizedBox(
                          height: AppSizes.size30H,
                        ),
                        defaultTextField(
                            controller: userName,
                            hint: 'User Name',
                            validator: (String val) {
                              if (val.isEmpty) {
                                return 'Please enter your username';
                              }
                              return null;
                            },
                            type: TextInputType.name),
                        SizedBox(
                          height: AppSizes.size30H,
                        ),
                        BlocProvider(
                          create: (context) => HelperCubit(),
                          child: BlocBuilder<HelperCubit, HelperState>(
                            builder: (context, state) {
                              HelperCubit cubit = HelperCubit.get(context);
                              return defaultTextField(
                                  isPassword: cubit.passwordVisiable,
                                  suffix: IconButton(
                                      onPressed: () {
                                        cubit.togglePassword();
                                      },
                                      icon: Icon(cubit.passwordVisiable
                                          ? Icons.visibility
                                          : Icons.visibility_off)),
                                  controller: password,
                                  hint: 'Password',
                                  validator: (String password) {
                                    if (password.isEmpty) {
                                      return 'Please Enter your password';
                                    } else if (password.length < 8) {
                                      return 'Password should have alphabet & numbers with minmum length 8';
                                    }
                                    return null;
                                  },
                                  type: TextInputType.visiblePassword);
                            },
                          ),
                        ),
                        SizedBox(
                          height: AppSizes.size30H,
                        ),
                        defaultTextField(
                            controller: email,
                            action: TextInputAction.done,
                            hint: 'Email',
                            validator: (String email) {
                              if (email.isEmpty) {
                                return 'Please enter your email';
                              } else if (!EmailValidator.validate(email)) {
                                return 'Please enter valid email';
                              }
                            },
                            type: TextInputType.emailAddress),
                        SizedBox(
                          height: AppSizes.size30H,
                        ),
                        defaultDropdownButton(
                            title: 'Interests',
                            value: cubit.selectedInterest,
                            onChanged: (value) {
                              cubit.selectedInterest = value;
                            },
                            items: cubit.interests
                                .map((e) => DropdownMenuItem(
                                      value: e.title,
                                      child: Text(
                                        e.title,
                                        style: bodyStyle(),
                                      ),
                                    ))
                                .toList()),
                        SizedBox(
                          height: AppSizes.size30H,
                        ),
                        SizedBox(
                          width: double.maxFinite,
                          child: state is ManageDataUserLoading
                              ? const DefaultLoading()
                              : defaultTextButton(
                                  onPressed: () {
                                    if (formKey.currentState!.validate() &&
                                        cubit.selectedInterest != null) {
                                      cubit.insertUser(
                                          username: userName.text,
                                          password: password.text,
                                          email: email.text,
                                          image: file);
                                    } else {
                                      errorToast('Please enter all data');
                                    }
                                  },
                                  title: 'Save',
                                ),
                        ),
                      ],
                    ),
                  ),
                );
              } else
                return const DefaultLoading();
            },
          ),
        ),
      ),
    );
  }
}
