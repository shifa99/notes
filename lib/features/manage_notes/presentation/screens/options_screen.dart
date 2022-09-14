import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:notes_project/core/widgets/default_app_bar.dart';
import 'package:notes_project/features/manage_notes/presentation/widgets/option_item.dart';

class OptionsScreen extends StatelessWidget {
  const OptionsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppbar(title: 'Options'),
      body: const OptionItem(),
    );

  }
}
