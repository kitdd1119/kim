import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '바다',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: '바닷속'),
    );
  }
}
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  // ignore: unused_field, non_constant_identifier_names
  int _img = 0;
  // Ml = Marine_life
  List<String> Ml_List = [
    "게",
    "돌고래",
    "거북이",
    "노란물고기",
    "코상어",
    "가시물고기",
    "물개",
  ];
  String Ml_Name = "게"; // Ml = Marine_life
  void _incrementCounter() {
    setState(() {
      _counter++;
      /*
      _img = Random().nextInt(7);  이는 0~6까지의 숫자가 나온다.
      이렇게 하면 리스트가 추가될 때마다
      인트 숫자를 계속 바꿔줘야한다는 단점이 있다.
      */
      _img = Random().nextInt(Ml_List.length);
      /*
      이런 식으로 문자형으로 바꿔주면
      리스트에 종류 추가만 해주면 된다.
      */
      Ml_Name = Ml_List[_img];
      // _img 숫자가 1이나오면 Ml_Name은 돌고래가 나온다.
    });
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              '버튼을 누르면 해양생물 사진나옴',
            ),
            Text(
              // 숫자는 '$_img' 이렇게 표현해야한다.
              Ml_Name,
              style: Theme.of(context).textTheme.headlineMedium,

            ),
            Expanded(child: Image.asset('assets/$Ml_Name.jpg'))

          ],
        ),

      ),

      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: '어떤 생물일까?',
        child: const Icon(Icons.add),
      ),
    );
  }
}

