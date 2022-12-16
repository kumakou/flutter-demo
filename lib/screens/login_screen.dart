import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'init_page.dart';
import 'signup_screen.dart';
import '../resources/auth_methods.dart';

class LoginScreen extends HookConsumerWidget {
  // Firebase Authenticationを利用するためのインスタンス
  final FirebaseAuth auth = FirebaseAuth.instance;

  // エラーメッセージを日本語化するためのクラス
  // final auth_error = Authentication_error();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final login_Email = useState("");
    final login_Password = useState("");
    final infoText = useState("");

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('FootReco-demoへようこそ！'),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            // メールアドレスの入力フォーム
            Padding(
                padding: EdgeInsets.fromLTRB(25.0, 0, 25.0, 0),
                child: TextFormField(
                  decoration: InputDecoration(labelText: "メールアドレス"),
                  onChanged: (String value) {
                    login_Email.value = value;
                    infoText.value = '';
                  },
                )),

            // パスワードの入力フォーム
            Padding(
              padding: EdgeInsets.fromLTRB(25.0, 0, 25.0, 10.0),
              child: TextFormField(
                decoration: InputDecoration(labelText: "パスワード（8～20文字）"),
                obscureText: true, // パスワードが見えないようRにする
                maxLength: 20, // 入力可能な文字数
                // maxLengthEnforced: false, // 入力可能な文字数の制限を超える場合の挙動の制御
                onChanged: (String value) {
                  login_Password.value = value;
                  infoText.value = '';
                },
              ),
            ),

            // ログイン失敗時のエラーメッセージ
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
                    'ログイン',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  onPressed: () async {
                    String res = await Auth_Methods().loginUser(
                        email: login_Email.value,
                        password: login_Password.value);
                    if (res == 'success') {
                      final user = auth.currentUser;
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            fullscreenDialog: true,
                            builder: (context) => InitPage(
                              userId: user!.uid,
                            ),
                          ));
                    } else {
                      infoText.value = res;
                    }
                  }),
            ),
          ],
        ),
      ),

      // 画面下にボタンの配置
      bottomNavigationBar:
          Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ButtonTheme(
            minWidth: 350.0,
            // height: 100.0,
            child: TextButton(
                child: Text(
                  'アカウントを作成する',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),

                // ボタンクリック後にアカウント作成用の画面の遷移する。
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => SignupScreen(),
                    ),
                  );
                }),
          ),
        ),
      ]),
    );
  }
}
