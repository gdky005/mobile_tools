import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
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
  int _counter = 0;
  var textStr = "";

  void _incrementCounter() {
    setState(() {
      _counter++;
      awaitData();
    });

    // copyText("$textStr 1");
  }


  void awaitData() async{
    var text = await getData();


    setState(() {
      textStr = text.text;
    });


    print("剪切板的数据是：$textStr");
  }

  @override
  void initState() {
    super.initState();
  }


  //复制
  copyText(text){
    Clipboard.setData(ClipboardData(text:text));
  }

  //读取剪切板 返回
  Future<ClipboardData> getData() async{
    return await Clipboard.getData(Clipboard.kTextPlain);
  }

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
              '拷贝的内容是：',
            ),

            Text(
              '$textStr',
              style: Theme.of(context).textTheme.headline4,
            ),

            Text(
              '计数器：$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
