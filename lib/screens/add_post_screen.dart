import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import '../providers/user_provider.dart';
import '../providers/player_provider.dart';
import '../utils/utils.dart';
import '../resources/firestore_method.dart';

final _userProvider = ChangeNotifierProvider(
  (ref) => UserProvider(),
);

final _playerProvider = ChangeNotifierProvider(
  (ref) => PlayerProvider(),
);

class AddPostScreen extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final playerName = useState<String>("");
    final playerListIndex = useState<int>(0);
    final phrase = useState<String>("");
    final description = useState<String>("");
    final infoText = useState<String>("");
    final image = useState<Uint8List?>(null);

    final userProvider = ref.watch(_userProvider);
    final playerProvider = ref.watch(_playerProvider);

    _selectImage(BuildContext parentContext) async {
      return showDialog(
        context: parentContext,
        builder: (BuildContext context) {
          return SimpleDialog(
            title: const Text('投稿する写真を選択'),
            children: <Widget>[
              SimpleDialogOption(
                  padding: const EdgeInsets.all(20),
                  child: const Text('Take a photo'),
                  onPressed: () async {
                    Navigator.pop(context);
                    Uint8List file = await pickImage(ImageSource.camera);
                    image.value = file;
                  }),
              SimpleDialogOption(
                  padding: const EdgeInsets.all(20),
                  child: const Text('Choose from Gallery'),
                  onPressed: () async {
                    Navigator.of(context).pop();
                    Uint8List file = await pickImage(ImageSource.gallery);
                    image.value = file;
                  }),
              SimpleDialogOption(
                padding: const EdgeInsets.all(20),
                child: const Text("Cancel"),
                onPressed: () {
                  Navigator.pop(context);
                },
              )
            ],
          );
        },
      );
    }

    void clearPost() {
      playerName.value = "";
      phrase.value = "";
      description.value = "";
      image.value = null;
    }

    void postImage(String uid, String username, String profImage) async {
      try {
        // upload to storage and db
        String res = await FireStoreMethods().uploadPost(
          playerName.value,
          "ベガルタ仙台",
          20,
          phrase.value,
          description.value,
          "FW",
          image.value,
          uid,
          username,
          profImage,
        );
        if (res == "success") {
          infoText.value = "投稿に成功しました";
          clearPost();
        } else {
          infoText.value = res;
        }
      } catch (err) {
        infoText.value = err.toString();
      }
    }

    return Scaffold(
        appBar: AppBar(
          title: const Text("投稿画面"),
          centerTitle: true,
        ),
        body: playerProvider.getPlayer == null || userProvider.getUser == null
            ? Container() // ロード画面かなんかを挟む?
            : SingleChildScrollView(
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Padding(
                          padding: EdgeInsets.fromLTRB(25.0, 0, 25.0, 30.0),
                          child: Text('新規投稿',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold))),

                      Stack(
                        children: [
                          Center(
                            child: Column(children: [
                              image.value != null
                                  ? Image.memory(image.value!)
                                  : Container(),
                              IconButton(
                                onPressed: () => _selectImage(context),
                                icon: const Icon(Icons.upload),
                              ),
                            ]),
                          )
                        ],
                      ),

                      // Padding(
                      //     padding: EdgeInsets.fromLTRB(25.0, 0, 25.0, 0),
                      //     child: Row(
                      //       children: [
                      //         Text(
                      //           '選手を選択',
                      //           style: TextStyle(fontSize: 15),
                      //         ),
                      //         SizedBox(
                      //           width: 100,
                      //         ),
                      //         DropdownButton(
                      //           value: playerListIndex.value,
                      //           onChanged: (value) => playerListIndex.value = value,
                      //           items: playerProvider.getPlayers.map((value) {
                      //             return DropdownMenuItem<String>(
                      //               value: ,
                      //               child: Text(value.playerName),
                      //             );
                      //           }).toList(),
                      //         ),
                      //       ],
                      //     )),

                      // フレーズの入力フォーム
                      Padding(
                        padding: EdgeInsets.fromLTRB(25.0, 0, 25.0, 10.0),
                        child: TextFormField(
                            decoration: InputDecoration(labelText: "フレーズ"),
                            onChanged: (String value) {
                              phrase.value = value;
                            }),
                      ),

                      // 説明の入力フォーム
                      Padding(
                          padding: EdgeInsets.fromLTRB(25.0, 0, 25.0, 0),
                          child: TextFormField(
                            decoration: InputDecoration(labelText: "エピソード"),
                            onChanged: (String value) {
                              description.value = value;
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
                            '投稿する',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          onPressed: () async {
                            postImage(
                                userProvider.getUser!.uid,
                                userProvider.getUser!.username,
                                userProvider.getUser!.photoUrl);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ));
  }
}
