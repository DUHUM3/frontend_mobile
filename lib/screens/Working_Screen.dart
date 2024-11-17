import 'package:flutter/material.dart';

void main() {
  runApp(WorkingScreen());
}

class WorkingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xFF0A1930),
        appBar: AppBar(
          title:
              Text('Hours Calculation', style: TextStyle(color: Colors.white)),
          backgroundColor: Color(0xFF0A1930),
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              // Image or illustration section
              Center(
                child: Container(
                  margin: EdgeInsets.only(bottom: 20),
                  child: Image.asset(
                    'assets/images/work.png', // Add your image here
                    height: 150,
                  ),
                ),
              ),
              // Table section
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: DataTable(
                    headingRowColor: MaterialStateColor.resolveWith(
                        (states) => Colors.blueGrey),
                    columns: [
                      DataColumn(
                          label: Text('NAME',
                              style: TextStyle(color: Colors.white))),
                      DataColumn(
                          label: Text('SA',
                              style: TextStyle(color: Colors.white))),
                      DataColumn(
                          label: Text('SUN',
                              style: TextStyle(color: Colors.white))),
                      DataColumn(
                          label: Text('MO',
                              style: TextStyle(color: Colors.white))),
                      DataColumn(
                          label: Text('TU',
                              style: TextStyle(color: Colors.white))),
                      DataColumn(
                          label: Text('WE',
                              style: TextStyle(color: Colors.white))),
                      DataColumn(
                          label: Text('TH',
                              style: TextStyle(color: Colors.white))),
                      DataColumn(
                          label: Text('FR',
                              style: TextStyle(color: Colors.white))),
                    ],
                    rows: [
                      DataRow(cells: [
                        DataCell(Text('Ryan Leslie',
                            style: TextStyle(color: Colors.white))),
                        DataCell(
                            Text('0.0', style: TextStyle(color: Colors.white))),
                        DataCell(
                            Text('0.0', style: TextStyle(color: Colors.white))),
                        DataCell(
                            Text('0.0', style: TextStyle(color: Colors.white))),
                        DataCell(
                            Text('0.0', style: TextStyle(color: Colors.white))),
                        DataCell(
                            Text('0.0', style: TextStyle(color: Colors.white))),
                        DataCell(
                            Text('0.0', style: TextStyle(color: Colors.white))),
                        DataCell(
                            Text('0.0', style: TextStyle(color: Colors.white))),
                      ]),
                      DataRow(cells: [
                        DataCell(Text('Arona Anne',
                            style: TextStyle(color: Colors.white))),
                        DataCell(
                            Text('0.0', style: TextStyle(color: Colors.white))),
                        DataCell(
                            Text('0.0', style: TextStyle(color: Colors.white))),
                        DataCell(
                            Text('0.0', style: TextStyle(color: Colors.white))),
                        DataCell(
                            Text('0.0', style: TextStyle(color: Colors.white))),
                        DataCell(
                            Text('0.0', style: TextStyle(color: Colors.white))),
                        DataCell(
                            Text('0.0', style: TextStyle(color: Colors.white))),
                        DataCell(
                            Text('0.0', style: TextStyle(color: Colors.white))),
                      ]),
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.blueGrey[700],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('08',
                            style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.white)),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('09:08 AM',
                                style: TextStyle(
                                    fontSize: 16, color: Colors.white)),
                            Text('Punch In',
                                style: TextStyle(color: Colors.white70)),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('06:05 PM',
                                style: TextStyle(
                                    fontSize: 16, color: Colors.white)),
                            Text('Punch Out',
                                style: TextStyle(color: Colors.white70)),
                          ],
                        ),
                        Text('08:13',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white)),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                height: 70,
                padding: EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: Color(0xFF4A738F), 
                  borderRadius:
                      BorderRadius.circular(30),  
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: Icon(Icons.fingerprint, color: Colors.white),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: Icon(Icons.person, color: Colors.white),
                      onPressed: () {},
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                      decoration: BoxDecoration(
                        color: Color(
                            0xFF0A1930),  
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.insert_chart, color: Colors.white),
                          SizedBox(width: 4),
                          Text("REPORTS",
                              style: TextStyle(color: Colors.white)),
                        ],
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.home, color: Colors.white),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: Icon(Icons.access_time, color: Colors.white),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: Icon(Icons.attach_money, color: Colors.white),
                      onPressed: () {},
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
