import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:space/Apod.dart';
import 'package:space/api/api.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:optional/optional.dart';

const appName = 'Apod - Astronomy Picture of the Day';

void main() => runApp(MaterialApp(
      title: appName,
      home: MyHomePage(),
      theme: ThemeData.light().copyWith(
          inputDecorationTheme:
              InputDecorationTheme(border: OutlineInputBorder())),
    ));

class MyHomePage extends StatefulWidget {
  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  var initDate = DateTime.now();

  final formats = {
    InputType.date: DateFormat('yyyy-MM-dd'),
  };
  InputType inputType = InputType.date;
  bool editable = false;
  DateTime date;

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(title: Text(appName)),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: ListView(
          children: <Widget>[
            DateTimePickerFormField(
              lastDate: DateTime.now(),
              initialDate: DateTime.now().subtract(new Duration(minutes: 1)),
              inputType: inputType,
              format: formats[inputType],
              editable: editable,
              decoration: InputDecoration(
                  labelText: 'Date', hasFloatingPlaceholder: false),
              onChanged: (dt) => setState(() => date = dt)
            ),
            SizedBox(height: 16.0),
            FutureBuilder<Apod>(
              future: getApod(checkDate(date?.toIso8601String())),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Center(
                    child: Column(
                      children: <Widget>[
                        Text(
                          snapshot.data.title,
                          style: TextStyle(fontSize: 20.0),
                        ),
                        //displays the title
                        Padding(padding: EdgeInsets.all(10.0)),
                        CachedNetworkImage(
                          imageUrl: snapshot.data?.hdurl ?? "",
                          placeholder: CircularProgressIndicator(),
                          fadeOutDuration: new Duration(seconds: 1),
                          fadeInDuration: new Duration(seconds: 3),
                          errorWidget: new Icon(Icons.error),
                        ),
                        Padding(padding: EdgeInsets.all(10.0)),
                        Text(
                          snapshot.data.explanation,
                          style: TextStyle(fontSize: 18.0)
                        ),
                      ],
                    ),
                  );
                } else if (snapshot.hasError) {
                  return Text("${snapshot.error}");
                }
                return CircularProgressIndicator();
              },
            )
          ],
        ),
      ));

  checkDate(String date) {
    if (date == null) {
      print(DateTime.now());
      return DateTime.now().toIso8601String();
    } else {
      return date;
    }
  }
}
