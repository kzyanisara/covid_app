import 'package:covid_app/stat_box.dart';
import 'package:flutter/material.dart';
import 'package:covid_app/covid_result.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stat COVID-19 Today',
      theme: ThemeData(primarySwatch: Colors.pink),
      home: MyHomePage(title: 'Stat COVID-19 Today'),
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
  void initState() {
    super.initState();

    print('init state');
    getData();
  }

  Future<CovidToday> getData() async {
    print('get data');
    var response = await http.get('https://covid19.th-stat.com/api/open/today');
    print(response.body);

    var result = covidTodayFromJson(response.body);
    return result;
  }

  @override
  Widget build(BuildContext context) {
    print('build');

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: FutureBuilder(
        future: getData(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            var result = snapshot.data;
            return Padding(
              padding: const EdgeInsets.fromLTRB(10, 25, 10, 20),
              child: Column(
                children: <Widget>[
                  StatBox(
                    title: 'ผู้ป่วยสะสม',
                    total: result?.confirmed,
                    backgroundColor: Color(0xffF54B96),
                  ),
                  SizedBox(height: 20),
                  StatBox(
                    title: 'หายแล้ว',
                    total: result?.recovered,
                    backgroundColor: Color(0xffF56496),
                  ),
                  SizedBox(height: 20),
                  StatBox(
                    title: 'รักษาอยู่ในโรงพยาบาล',
                    total: result?.hospitalized,
                    backgroundColor: Color(0xffF57D96),
                  ),
                  SizedBox(height: 20),
                  StatBox(
                    title: 'เสียชีวิต',
                    total: result?.deaths,
                    backgroundColor: Color(0xffF59696),
                  ),
                ],
              ),
            );
          }

          return LinearProgressIndicator();
        },
      ),
//        body: Column(
//          children: <Widget>[
//            indicator ?? Container(),
//            Expanded(
//            )
//          ],
//        )
    );
  }
}
