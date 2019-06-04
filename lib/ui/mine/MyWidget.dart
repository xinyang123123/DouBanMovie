import 'dart:async';

import 'package:flutter/material.dart';

class MyWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyWidgetState();
  }
}

class MyWidgetState extends State<MyWidget> {

  int _count = 0;

  static final _streamController = StreamController<int>.broadcast();
  static final _sink = _streamController.sink;
  static final _stream = _streamController.stream;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: StreamBuilder(
          stream: _stream,
          initialData: 0,
          builder: (context,snapshot){
            return Text('you clicked ' + snapshot.data.toString() + ' times');
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => onClick(),
      ),
    );
  }

  void onClick() {
    _sink.add(++_count);
  }
}
