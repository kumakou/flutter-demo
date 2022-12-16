import 'dart:ffi';
import 'dart:io' as io;
import 'dart:typed_data';
import 'package:flutter/services.dart' show rootBundle;

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'init_page.dart';
import '../resources/auth_methods.dart';
import '../utils/utils.dart';

class SignupScreen extends HookConsumerWidget {
  // Firebase Authenticationを利用するためのインスタンス
  final FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final newEmail = useState<String>("");
    final newPassword = useState<String>("");
    final username = useState<String>("");
    final gender = useState<String>("無回答");
    final age = useState<int>(0);
    final infoText = useState<String>("");
    final pswd_OK = useState<bool>(false);
    final image = useState<Uint8List?>(null);

    selectImage() async {
      Uint8List im = await pickImage(ImageSource.gallery);
      // set state because we need to display the image we selected on the circle avatar
      image.value = im;
    }

    void signUpUser() async {
      Uint8List bytesImage;
      if (image.value == null) {
        final byteData = await rootBundle.load('assets/profile_icon.png');
        bytesImage = byteData.buffer
            .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes);
      } else {
        bytesImage = image.value!;
      }
      // signup user using our authmethodds
      String res = await Auth_Methods().signUpUser(
          email: newEmail.value,
          password: newPassword.value,
          username: username.value,
          gender: gender.value,
          age: age.value,
          file: bytesImage);
      // if string returned is sucess, user has been created
      if (res == "succses") {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => InitPage(userId: auth.currentUser!.uid),
            ));
      } else {
        // show the error
        infoText.value = res;
      }
    }

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('ユーザー登録'),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Padding(
                    padding: EdgeInsets.fromLTRB(25.0, 0, 25.0, 30.0),
                    child: Text('新規アカウントの作成',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold))),

                Stack(
                  children: [
                    image.value != null
                        ? CircleAvatar(
                            radius: 64,
                            backgroundImage: MemoryImage(image.value!),
                            backgroundColor: Colors.blue,
                          )
                        : const CircleAvatar(
                            radius: 64,
                            backgroundImage:
                                AssetImage('assets/image/profile_icon.png'),
                            backgroundColor: Colors.blue,
                          ),
                    Positioned(
                      bottom: -10,
                      left: 80,
                      child: IconButton(
                        onPressed: () => selectImage(),
                        icon: const Icon(Icons.add_a_photo),
                      ),
                    )
                  ],
                ),

                // メールアドレスの入力フォーム
                Padding(
                    padding: EdgeInsets.fromLTRB(25.0, 0, 25.0, 0),
                    child: TextFormField(
                      decoration: InputDecoration(labelText: "メールアドレス"),
                      onChanged: (String value) {
                        newEmail.value = value;
                      },
                    )),

                // パスワードの入力フォーム
                Padding(
                  padding: EdgeInsets.fromLTRB(25.0, 0, 25.0, 10.0),
                  child: TextFormField(
                      decoration: InputDecoration(labelText: "パスワード（8～20文字）"),
                      obscureText: true, // パスワードが見えないようRにする
                      maxLength: 20, // 入力可能な文字数
                      onChanged: (String value) {
                        if (value.length >= 8) {
                          newPassword.value = value;
                          pswd_OK.value = true;
                        } else {
                          pswd_OK.value = false;
                        }
                      }),
                ),

                // 名前の入力フォーム
                Padding(
                    padding: EdgeInsets.fromLTRB(25.0, 0, 25.0, 0),
                    child: TextFormField(
                      decoration: InputDecoration(labelText: "名前"),
                      onChanged: (String value) {
                        username.value = value;
                      },
                    )),

                // 性別の入力フォーム
                Padding(
                    padding: EdgeInsets.fromLTRB(25.0, 0, 25.0, 0),
                    child: Row(
                      children: [
                        Text(
                          '性別',
                          style: TextStyle(fontSize: 15),
                        ),
                        SizedBox(
                          width: 100,
                        ),
                        DropdownButton(
                          value: gender.value,
                          onChanged: (value) => gender.value = value!,
                          items: <String>['無回答', '男性', '女性'].map((value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ],
                    )),

                // 年齢の入力フォーム
                Padding(
                    padding: EdgeInsets.fromLTRB(25.0, 0, 25.0, 0),
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(labelText: "年齢"),
                      onChanged: (value) {
                        try {
                          age.value = int.parse(value);
                        } catch (e) {
                          infoText.value = '年齢には数字を入力してください';
                        }
                      },
                    )),

                // 登録失敗時のエラーメッセージ
                Padding(
                  padding: EdgeInsets.fromLTRB(20.0, 0, 20.0, 5.0),
                  child: Text(
                    infoText.value,
                    style: TextStyle(color: Colors.red),
                  ),
                ),

                ButtonTheme(
                  minWidth: 350.0,
                  // height: 100.0,
                  child: TextButton(
                    child: Text(
                      '登録',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    onPressed: () async {
                      if (pswd_OK.value) {
                        signUpUser();
                      } else {
                        infoText.value = 'パスワードは8文字以上です。';
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
