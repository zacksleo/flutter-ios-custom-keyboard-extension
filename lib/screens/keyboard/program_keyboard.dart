import 'package:built_in_keyboard/built_in_keyboard.dart';
import 'package:built_in_keyboard/language.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class ProgramKeyboardScreen extends StatefulWidget {
  const ProgramKeyboardScreen({super.key});

  @override
  State<ProgramKeyboardScreen> createState() => _ProgramKeyboardScreenState();
}

class _ProgramKeyboardScreenState extends State<ProgramKeyboardScreen> {
  var textController = TextEditingController();
  @override
  void initState() {
    super.initState();

    // Start listening to changes.
    textController.addListener(() {
      debugPrint(textController.text);
      EasyLoading.showToast(textController.text);
      TextInput.updateEditingValue(TextEditingValue(text: textController.text));
    });
  }

  @override
  Widget build(BuildContext context) {
    return BuiltInKeyboard(
        controller: textController, // required
        language: Language.EN, // optional
        layout: Layout.QWERTY, // optional, BUT MUST be checked if you modify the language!
        enableSpaceBar: true, // optional, add a spacebar
        enableBackSpace: true, // optional, add a backspace button
        enableCapsLock: true, // optional, add a Caps Lock button
        borderRadius: BorderRadius.circular(8.0), // changes the border radius of the keys
        letterStyle: const TextStyle(fontSize: 25, color: Colors.black) // styles the text inside the keys
        );
  }
}
