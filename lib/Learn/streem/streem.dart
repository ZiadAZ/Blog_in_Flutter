//import 'dart:async';
//import 'package:flutter/material.dart';
//
//class TestStream extends StatefulWidget {
//  @override
//  _TestStreamState createState() => _TestStreamState();
//}
//final StreamController _sController = StreamController();
//
//class _TestStreamState extends State<TestStream> {
//
//  @override
//  void dispose() {
//    _sController.close();
//    super.dispose();
//  }
//
//
//  @override
//  Widget build(BuildContext context) {
//    int _caounter = 0;
//    return Scaffold(
//      body: Center(
//        child: Column(
//          mainAxisAlignment: MainAxisAlignment.center,
//          children: <Widget>[
//        Container(
//        color: Colors.greenAccent,
//          child: Text(
//            "ZZ",
//          ),
//        ),
//            Row(
//              mainAxisAlignment: MainAxisAlignment.spaceBetween,
//              children: <Widget>[
//                RaisedButton(
//                    child: Icon(Icons.add),
//                    onPressed: () {
//                      ++_caounter;
//                      _sController.sink.add(null);
//                    }),
//                RaisedButton(
//                    child: Icon(Icons.remove),
//                    onPressed: () {
//                      --_caounter;
//
//                      _sController.sink.add(8);
//                    }),
//              ],
//            )
//          ],
//        ),
//      ),
//    );
//  }
//}
//
//
//class TextState extends StatefulWidget {
//  String _string;
//
//  TextState(this._string);
//  @override
//  State<StatefulWidget> createState() {
//    // TODO: implement createState
//    return _TextSrate();
//  }
//
//}
//
//class _TextSrate extends State<TextState> {
//s(dynamic d){
//
//    setState(() {
//
//    });
//
//}
//  @override
//  Widget build(BuildContext context) {
//
//    _sController.stream.listen(s);
//
//
//
//    return Text(widget._string);
//  }
//@override
//  void dispose() {
//_sController.close();
// super.dispose();
//  }
//}
//
//class TickerControler {
//  final StreamController<int> _streamController = StreamController<int>();
//
//  Stream<int> get _stream => _streamController.stream; //  Listen to anythig
//  StreamSink<int> get _streamSink => _streamController.sink;
//
//  TickerControler() {
//    _streamController.add(5);
//  }
//
//  void dispos() {
//    _streamController.close();
//  }
//}
