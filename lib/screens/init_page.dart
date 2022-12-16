import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'Home/home.dart';
import 'player_directory.dart';
import 'others.dart';

class InitPage extends HookConsumerWidget {
  final String userId;
  const InitPage({Key? key, required this.userId}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pageWidgets = [Home(), PlayerDirectory(), Others()];
    final currentIndex = useState(0);

    return Scaffold(
      body: pageWidgets.elementAt(currentIndex.value),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'ホーム'),
          BottomNavigationBarItem(
              icon: Icon(Icons.collections_bookmark), label: '選手名鑑'),
          BottomNavigationBarItem(icon: Icon(Icons.table_rows), label: 'その他'),
        ],
        currentIndex: currentIndex.value,
        fixedColor: Colors.blueAccent,
        onTap: (int index) => currentIndex.value = index,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
