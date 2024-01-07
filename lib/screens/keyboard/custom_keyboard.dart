import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class CustomKeyboardScreen extends StatefulWidget {
  const CustomKeyboardScreen({super.key});

  @override
  State<CustomKeyboardScreen> createState() => _CustomKeyboardScreenState();
}

class _CustomKeyboardScreenState extends State<CustomKeyboardScreen> {
  var textController = TextEditingController();
  var text = '';

  static const platform = MethodChannel('geekinput');

  @override
  void initState() {
    super.initState();

    // Start listening to changes.
    textController.addListener(() async {
      debugPrint(textController.text);
      EasyLoading.showToast(textController.text);
      await platform.invokeMethod('setText', {'text': textController.text});
      setState(() {
        text = textController.value as String;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(text),
        const SizedBox(height: 20),
        Row(
          children: [
            TextButton(
                onPressed: () {
                  textController.text = 'A';
                },
                child: const Text('A')),
            const SizedBox(width: 2),
            TextButton(
                onPressed: () {
                  textController.text = 'S';
                },
                child: const Text('S')),
            const SizedBox(width: 2),
            TextButton(
                onPressed: () {
                  textController.text = 'D';
                },
                child: const Text('D')),
            const SizedBox(width: 2),
            TextButton(
                onPressed: () {
                  textController.text = 'F';
                },
                child: const Text('F')),
            const SizedBox(width: 2),
            TextButton(
                onPressed: () {
                  platform.invokeMapMethod('delete');
                },
                child: const Icon(Icons.backspace_outlined)),
            const SizedBox(width: 2),
            TextButton(
                onPressed: () {
                },
                child: const Icon(Icons.switch_left_outlined)),
            const SizedBox(width: 2),


          ],
        )
      ],
    );
  }
}
