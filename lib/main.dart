import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'カワウソ'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  String _type = "偶数";

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  bool _flag = false;
  _click() async {
    setState(() {
      _flag = !_flag;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(children: const [Icon(Icons.create), Text("初めてのタイトル")]),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(FontAwesomeIcons.gift, color: Colors.teal),
          // Text(
          //   '$_counter',
          //   style: Theme.of(context).textTheme.headline4,
          // ),
          // if (_counter % 2 == 0)
          //   Text('偶数です', style: TextStyle(fontSize: 20, color: Colors.red)),
          // TextButton(
          //   onPressed: () => {print("ボタンが押されたよ")},
          //   child: const Text("テキストボタン"),
          // ),
          AnimatedOpacity(
              opacity: _flag ? 0.01 : 1.0,
              duration: const Duration(seconds: 3),
              child: Text(
                "ちんちん",
                style: Theme.of(context).textTheme.headline4,
              )),
          AnimatedSize(
              duration: const Duration(seconds: 3),
              child: SizedBox(
                  width: _flag ? 50 : 200,
                  height: _flag ? 50 : 200,
                  child: Container(color: Colors.purple))),
          AnimatedAlign(
              duration: const Duration(seconds: 3),
              alignment: _flag ? Alignment.topLeft : Alignment.bottomRight,
              child: SizedBox(
                  width: 50,
                  height: 50,
                  child: Container(color: Colors.green))),
          // Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceAround,
          //     children: const [
          //       Icon(
          //         Icons.favorite,
          //         color: Colors.pink,
          //         size: 24.0,
          //       ),
          //       Icon(
          //         Icons.audiotrack,
          //         color: Colors.green,
          //         size: 30.0,
          //       ),
          //       Icon(
          //         Icons.beach_access,
          //         color: Colors.blue,
          //         size: 36.0,
          //       ),
          //     ]),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _click(),
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
      drawer: const Drawer(
          child: Center(
        child: Text("Drawer"),
      )),
      endDrawer: const Drawer(
          child: Center(
        child: Text("EndDrawer"),
      )),
    );
  }
}
