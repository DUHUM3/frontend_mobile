import 'package:flutter/material.dart';
// import 'package:frontend_mobile/screens/Home_Screen.dart';

class AttendanceReportPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF001F3F),
      appBar: AppBar(
        backgroundColor: Color(0xFF0D1B2A),
        elevation: 0,
        title: Text("Home",style: TextStyle(color: Colors.white),),
        iconTheme: IconThemeData(
            color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.grey.shade300,
                  child: Icon(Icons.person, size: 40, color: Colors.grey),
                ),
                SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "USER NAME",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "JOB TYPE",
                      style: TextStyle(color: Colors.white70, fontSize: 14),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          "Reports",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Spacer(),
                        DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            value: "Month",
                            dropdownColor:
                                Color(0xFF001F3F), 
                            items: <String>["Month", "Week", "Year"]
                                .map((String value) => DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(
                                        value,
                                        style: TextStyle(
                                            color: Colors
                                                .white), 
                                      ),
                                    ))
                                .toList(),
                            onChanged: (_) {},
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 16),
                    Expanded(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: DataTable(
                            columns: [
                              DataColumn(
                                  label: Text("Day",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold))),
                              DataColumn(
                                  label: Text("Status",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold))),
                              DataColumn(
                                  label: Text("Check-In",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold))),
                              DataColumn(
                                  label: Text("Check-Out",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold))),
                              DataColumn(
                                  label: Text("Late",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold))),
                              DataColumn(
                                  label: Text("T-Hours",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold))),
                            ],
                            rows: List.generate(30, (index) {
                              // مثال لـ 30 يوم
                              return DataRow(cells: [
                                DataCell(Text("SAT")),
                                DataCell(Text("Present")),
                                DataCell(Text("8:00 AM")),
                                DataCell(Text("12:00 AM")),
                                DataCell(Text("0h")),
                                DataCell(Text("4h")),
                              ]);
                            }),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                buildStatCard("Total Hours", "100 H", Colors.green),
                buildStatCard("Attendance Days", "26 D", Colors.blue),
                buildStatCard("Delay Hours", "20 H", Colors.red),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildStatCard(String title, String value, Color color) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.all(4),
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 14, color: color),
            ),
            SizedBox(height: 8),
            Text(
              value,
              style: TextStyle(
                  fontSize: 18, color: color, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: AttendanceReportPage(),
  ));
}
