//
//  KeyboardViewController.swift
//  geekinput
//
//  Created by 李俊伟 on 2024/1/7.
//

import UIKit
import Flutter
import Foundation

class KeyboardViewController: UIInputViewController {

    @IBOutlet var nextKeyboardButton: UIButton!

    let src = CGEventSource(stateID: CGEventSourceStateID.hidSystemState)

    let cmdd = CGEvent(keyboardEventSource: src, virtualKey: 0x38, keyDown: true)
    let cmdu = CGEvent(keyboardEventSource: src, virtualKey: 0x38, keyDown: false)
    let spcd = CGEvent(keyboardEventSource: src, virtualKey: 0x31, keyDown: true)
    let spcu = CGEvent(keyboardEventSource: src, virtualKey: 0x31, keyDown: false)

    override func updateViewConstraints() {
        super.updateViewConstraints()

        // Add custom view sizing constraints here
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        showFlutter()

        //        // Perform custom UI setup here
        //        self.nextKeyboardButton = UIButton(type: .system)
        //
        //        self.nextKeyboardButton.setTitle(NSLocalizedString("Next Keyboard", comment: "Title for 'Next Keyboard' button"), for: [])
        //        self.nextKeyboardButton.sizeToFit()
        //        self.nextKeyboardButton.translatesAutoresizingMaskIntoConstraints = false
        //
        //        self.nextKeyboardButton.addTarget(self, action: #selector(handleInputModeList(from:with:)), for: .allTouchEvents)
        //
        //        self.view.addSubview(self.nextKeyboardButton)
        //
        //        self.nextKeyboardButton.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        //        self.nextKeyboardButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
    }

    override func viewWillLayoutSubviews() {
        //        self.nextKeyboardButton.isHidden = !self.needsInputModeSwitchKey
        super.viewWillLayoutSubviews()
    }

    override func textWillChange(_ textInput: UITextInput?) {
        // The app is about to change the document's contents. Perform any preparation here.
    }

    override func textDidChange(_ textInput: UITextInput?) {
        // The app has just changed the document's contents, the document context has been updated.

        //        var textColor: UIColor
        //        let proxy = self.textDocumentProxy
        //        if proxy.keyboardAppearance == UIKeyboardAppearance.dark {
        //            textColor = UIColor.white
        //        } else {
        //            textColor = UIColor.black
        //        }
        //        self.nextKeyboardButton.setTitleColor(textColor, for: [])
    }

    func showFlutter() {
        let flutterViewController = FlutterViewController(project: nil, initialRoute: "/keyboard/program", nibName: nil, bundle: nil)
        addChild(flutterViewController)
        view.addSubview(flutterViewController.view)
        flutterViewController.view.frame = view.bounds
        let channel = FlutterMethodChannel(name: "geekinput", binaryMessenger: flutterViewController.binaryMessenger)
        channel.setMethodCallHandler { [weak self] (call: FlutterMethodCall, result: @escaping FlutterResult) in
            self?.handleMethodCall(call, result: result)
        }
    }

    func handleMethodCall(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        if call.method == "setText" {
            // 处理方法调用
            if let arguments = call.arguments as? [String: Any],
               let text = arguments["text"] as? String {
                // 使用 text 值进行操作
                print("Received text: \(text)")
                textDocumentProxy.insertText(text)
                result(nil) // 返回结果给 Flutter
            } else {
                result(FlutterMethodNotImplemented) // 方法未实现
            }
        } else if (call.method == "delete") {
            textDocumentProxy.deleteBackward()
        } else if (call.method == "shortcut") {
            if let arguments = call.arguments as? [String: Any],
               let text = arguments["key"] as? String {
                // 如果key 是 ctrl+c, 模拟键盘输入，发送快捷键 ^C
                result(nil) // 返回结果给 Flutter
            } else {
                result(FlutterMethodNotImplemented) // 方法未实现
            }
        }

    }
}
