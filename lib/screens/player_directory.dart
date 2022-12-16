import 'package:flutter/material.dart';
import 'add_post_screen.dart';

class PlayerDirectory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: Text('選手名鑑'),
          automaticallyImplyLeading: false),
      body: Center(
        child: PlayerPage(),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () => {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return AddPostScreen();
                }))
              },
          child: const Icon(Icons.add)),
    );
  }
}

class PlayerCard extends StatelessWidget {
  const PlayerCard({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      //margin: EdgeInsets.symmetric({double vertical = 3.0}),
      width: 370,
      height: 80,
      decoration: const ShapeDecoration(shape: 
        RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
      ),
      color: Color.fromARGB(255, 255, 255, 255), 
    ),
      child: Row(
          children:[
            //選手写真
            Container(
              margin: EdgeInsets.all(5),
              child: Image(image: AssetImage('assets/Yuma.png')),
            ),
            //選手詳細
            Column(
              children: [
                //背番号と年齢
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 10.0),
                        child: Text('背番号１'),
                      ),
                      Text('年齢20')]
                  ),
                ),
                //名前
                Text('小畑祐馬',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  )
                )
              ],
            )
          ],
                  ),
    );
  }
}

//選手一覧ページ
class PlayerPage extends StatelessWidget {
  const PlayerPage({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home:Scaffold(
          backgroundColor: Color.fromARGB(255, 229, 229, 229),
          body: SingleChildScrollView(
            child: Column(
                children: [
                  //ベガルタの表紙
                  Container(
                    width: double.infinity,
                    height: 80,
                    color: Color.fromARGB(255, 251, 206, 7),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children:[
                          Container(
                          child: Image(image: AssetImage('assets/vegalta.png')),
                          ),
                          Container(
                              width: 220,
                              child: Text('ベガルタ仙台', 
                              textAlign: TextAlign.center,
                              style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                              color: Color.fromARGB(255, 255, 255, 255), 
                            ))
                          ),
                          Container(
                             width: 80,
                             child: Text('')
                            ),
                        ],
                    ),
                  ),
          
                  //隙間
                  const SizedBox(height: 24),
                  //GK
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text('GK',
                    style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                            )
                    ),
                  ),
          
                  PlayerCard(),
                  PlayerCard(),
                  PlayerCard(),
          
                  //隙間
                  const SizedBox(height: 24),
                  //DF  
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text('DF',
                    style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                            )
                    ),
                  ),
          
                  PlayerCard(),
                  PlayerCard(),
                  PlayerCard(),
                  
          
                  //隙間
                  const SizedBox(height: 24),
                  //MF
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text('MF',
                    style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                            )
                    ),
                  ),

                  PlayerCard(),
                  PlayerCard(),
                  
                  //隙間
                  const SizedBox(height: 24),
                  //FW
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text('FW',
                    style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                            )
                    ),
                  ),
                  PlayerCard(),
                  PlayerCard(),
                  PlayerCard(),
                  PlayerCard(),
                  PlayerCard(),
                  PlayerCard(),
                  PlayerCard(),
              ],
            ),
          ), 
         )
    );
  }
}
