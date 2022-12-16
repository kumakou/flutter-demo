import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';



class UserPage extends StatelessWidget {
 UserPage({super.key});
  @override
  Widget build(BuildContext context) {
    var _screenSize = MediaQuery.of(context).size;
    
    return Scaffold(
          backgroundColor: Color.fromARGB(255, 212, 230, 253),
          appBar: AppBar(
            title: const Text("Kax0812"),
          ),
        body: Column(
          children: [
            const SizedBox(
                height: 12,
              ),
             //ユーザ情報
            Row(
              children: [
                Container(
                  child: Expanded(
                    flex: 4,
                    child: Column(
                        children: [
                        //写真
                        Container(
                          padding: EdgeInsets.only(left: 20),
                          height: 100,
                          child: CircleAvatar(
                            radius: 50,
                            backgroundImage: AssetImage('assets/kaz.jpg'))
                        ),
                        //名前
                        Container(
                          padding: EdgeInsets.only(left: 20),
                          child: Text('いるかず',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                  )
                          ),
                        )
                        ]),
                    ),
                ),
        
                //投稿数とかフォロワー数とか
                Expanded(
                  flex: 10,
                  child: Container(
                    padding: EdgeInsets.only(right: 10, left: 10),

                    //投稿数とかレベルとか
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 10,
                        ),

                        //投稿、フォロワー、フォロー数
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: 80,
                              child: Column(
                                children: [
                                  Text('180',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17,
                                  )),
                                  Text('投稿'),
                                ],
                              ),
                            ),
                            Container(
                              width: 80,
                              child: Column(
                                children: [
                                  Text('2',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17,
                                  )),
                                  Text('フォロワー'),
                                ],
                              ),
                            ),
                            Container(
                              width: 80,
                              child: Column(
                                children: [
                                  Text('1098',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17,
                                  )),
                                  Text('フォロー中'),
                                ],
                              ),
                            ),
                          ],),
                          //投稿、フォロワー、フォロー数//

                        //隙間
                        const SizedBox(
                          height: 12,
                        ),

                        //サポーターレベル, 推しチーム、推し選手  
                        Container(
                          width: double.infinity,
                          padding: EdgeInsets.only(left: 23),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('サポーター      Lv5', style: TextStyle(fontSize: 13,)),
                                Text('推しチーム　  ベガルタ仙台', style: TextStyle(fontSize: 13,)),
                                Text('推し選手　     梁勇基',style: TextStyle(fontSize: 13,)),
                              ],),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
            //ユーザ情報終わり

            //隙間
            const SizedBox(
              height: 20,
            ),

            //フォローボタン
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  width: _screenSize.width*0.45,
                  child: ElevatedButton(
                            onPressed: () {},
                            child: Text('フォロー', style: TextStyle(fontWeight: FontWeight.bold,)),
                          ),
                ),
                Container(
                  width: _screenSize.width*0.45,
                  child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                            primary: Color.fromARGB(255, 255, 255, 255),
                            elevation: 16,
                          ),
                            child: Text('メッセージ',style: TextStyle(fontWeight: FontWeight.bold, color: Color.fromARGB(255, 0, 0, 0),)),
                          ),
                ),
              ],),
              //ボタン終わり

              const SizedBox(
              height: 15,
              ),

              Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 5),
                    alignment: Alignment.centerLeft,
                    child: Text('最新の投稿',
                      style: TextStyle(
                        fontWeight: FontWeight.bold, 
                        color: Color.fromARGB(255, 0, 31, 116),
                      )
                    )
                  )
                ],
              )
          ]
        ),


      );
    
  }
}