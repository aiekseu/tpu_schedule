import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_campus_map/data/ScheduleData.dart';

import 'file:///D:/pa6ota/android/flutter_campus_map/lib/widgets/Class.dart';

class Schedule extends StatelessWidget {
  //DatePick('16.12', 'ср')

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30)),
                color: Colors.deepPurpleAccent,
              ),
              child: Container(
                margin: EdgeInsets.only(top: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      child: Text(
                        'ср\n11',
                      ),
                    ),
                    Container(
                      child: Text('чт\n12'),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: Color.fromARGB(70, 255, 255, 255)),
                        child: RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              text: 'пятница\n',
                              style: TextStyle(fontSize: 18),
                              children: [TextSpan(text: '13.11.2020')],
                            )),
                      ),
                    ),
                    Container(
                      child: Text('сб\n14'),
                    ),
                    Container(
                      child: Text('вс\n15'),
                    ),
                  ],
                ),
              ),
            ),
          ),
          ClassesList(),
        ],
      ),
    );
  }
}

class ClassesList extends StatefulWidget {
  @override
  _ClassesListState createState() => _ClassesListState();
}

class _ClassesListState extends State<ClassesList> {
  List<Class> monday = new ScheduleData().monday;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 11,
      child: ListView.separated(
        padding: EdgeInsets.only(top: 24),
        itemCount: monday.length,
        separatorBuilder: (context, index) =>
            const Divider(indent: 20, endIndent: 20),
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.symmetric(horizontal: 18),
            elevation: 0,
            child: InkWell(
              onTap: () {

              },
              child: Column(
                children: [
                  Container(
                    padding:
                        EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 3),
                    child: Row(
                      children: [
                        Text(
                          '${monday[index].startTime}',
                          style: TextStyle(fontSize: 16),
                        ),
                        Text(
                          ' - ',
                          style: TextStyle(fontSize: 16),
                        ),
                        Text(
                          '${monday[index].endTime}',
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 3),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      '${monday[index].name}',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  Container(
                    padding:
                        EdgeInsets.only(left: 16, right: 16, top: 3, bottom: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('${monday[index].lecturerName}'),
                        Text(
                            'к. ${monday[index].building}, ауд. ${monday[index].room}')
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
