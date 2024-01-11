# program_keyboard

## Warning

ios customkeybord has 40M memory limit，so can not use Flutter in this kind of extension.

```
Due to the memory limitations of app extensions, it is only recommended to use Flutter to build app extension UI for extension types that have memory limits larger than 100MB. For example, share extensions which have a 120MB memory limit.

In addition, Flutter uses extra memory in debug mode. Therefore, Flutter does not fully support running app extensions in debug mode on physical devices when used to build extension UI. As an alternative, use an iOS simulator to test your extension in debug mode.

```

So this code can only run in simulation, not in the real device.

## Refer Docs

- [Adding iOS app extensions](https://docs.flutter.dev/platform-integration/ios/app-extensions)
- [Adding a Home Screen widget to your Flutter App](https://codelabs.developers.google.com/flutter-home-screen-widgets#3)
- [Custom Keyboard](https://developer.apple.com/library/archive/documentation/General/Conceptual/ExtensibilityPG/CustomKeyboard.html#//apple_ref/doc/uid/TP40014214-CH16)
- [Creating a custom keyboard](https://developer.apple.com/documentation/uikit/keyboards_and_input/creating_a_custom_keyboard)
- [KeyboardKit](https://github.com/KeyboardKit/KeyboardKit)
- [第三方输入法App原理调研](https://juejin.cn/post/6962836883659456542c)
- [](https://developer.apple.com/documentation/uikit/keyboards_and_input/creating_a_custom_keyboard/handling_text_interactions_in_custom_keyboards)