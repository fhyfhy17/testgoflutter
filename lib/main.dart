import 'dart:io';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: MyHomePage(title: '第一个Flutter'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int c = 0;
  String s = "";


  void _incrementCounter() {
    setState(() {
      c = c + 5;
      _getLocalFile().then((String value) {
        setState(() {
          s = value;
        });
      });
    });
  }

  Future<String> _getLocalFile() async {
    // get the path to the document directory.
    String dir = (await getApplicationDocumentsDirectory()).path;
    print(dir);
    return dir;
//    return new File('D:/workspace/flutter_my/1.txt').readAsString();
  }



//  Future<int> _readCounter() async {
//    try {
//      File file = await _getLocalFile();
//      // read the variable as a string from the file.
//      String contents = await file.readAsString();
//      return int.parse(contents);
//    } on FileSystemException {
//      return 0;
//    }
//  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '点下面的图标这里会变化 ',
            ),
            Text(
              '$s',
//              style: Theme.of(context).textTheme.display4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
        backgroundColor: Color(0xFFFF9000),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
