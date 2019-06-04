import 'package:flutter/material.dart';

class CitysWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CitysWidgetState();
  }
}

class CitysWidgetState extends State<CitysWidget> {
  String currentCity;

  @override
  Widget build(BuildContext context) {
    currentCity = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text("选择城市", style: TextStyle(fontSize:16,color: Colors.black87)),
        iconTheme: IconThemeData(color: Colors.green),
        backgroundColor: Colors.white,
        centerTitle: false,
        elevation: 1,
      ),
      body: Center(
        child: Text(currentCity),
      ),
    );
  }
}
