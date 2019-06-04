import 'package:flutter/material.dart';

class CitiesWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CitiesWidgetState();
  }
}

class CitiesWidgetState extends State<CitiesWidget> {
  String currentCity;

  @override
  Widget build(BuildContext context) {
    currentCity = ModalRoute.of(context).settings.arguments;

    List<String> hotCities = [
      '北京',
      '上海',
      '广州',
      '深圳',
      '成都',
      '武汉',
      '杭州',
      '重庆',
      '郑州',
      '南京',
      '西安',
      '苏州',
      '长沙',
      '天津',
      '福州'
    ];

    return Scaffold(
        appBar: AppBar(
          title: Text("选择城市",
              style: TextStyle(fontSize: 16, color: Colors.black87)),
          iconTheme: IconThemeData(color: Colors.green),
          backgroundColor: Colors.white,
          centerTitle: false,
          elevation: 1,
        ),
        body: Column(
          children: <Widget>[
            Expanded(
                child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        childAspectRatio: 2.6,
                        mainAxisSpacing: 20,
                        crossAxisSpacing: 50),
                    itemCount: hotCities.length,
                    itemBuilder: (context, index) => MaterialButton(
                          onPressed: () => selCity(hotCities[index]),
                          child: Text(hotCities[index]),
                          color: Colors.white,
                          elevation: 0,
                        )))
          ],
        ));
  }

  void selCity(String selCity) {
    Navigator.pop(context, selCity);
  }
}
