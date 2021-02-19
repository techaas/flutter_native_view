import 'package:flutter/material.dart';

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
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Embed Native View'),
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
          color: Colors.black,
          alignment: Alignment.topCenter,
          padding: EdgeInsets.all(10),
          child: Container(
              padding: EdgeInsets.all(10),
              color: Color.fromARGB(64, 0, 255, 255),
              child: SizedBox(
                width: 300,
                height: 300,
                child: UiKitView(viewType: 'NativeView'),
              ))),
    );
  }
}
