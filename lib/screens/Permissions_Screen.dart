import 'package:flutter/material.dart';

class LeaveRequestScreen extends StatefulWidget {
  @override
  _LeaveRequestScreenState createState() => _LeaveRequestScreenState();
}

class _LeaveRequestScreenState extends State<LeaveRequestScreen> {
  String? leaveType;
  bool isFullDay = true;
  bool isCompOff = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0D1B2A),
      appBar: AppBar(
        backgroundColor: Color(0xFF0D1B2A),
        title: Text("Home"),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Leave Type",
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(height: 10),
              DropdownButtonFormField<String>(
                dropdownColor: Color(0xFF1C2D41),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                value: leaveType,
                items: ["Sick Leave", "Casual Leave", "Earned Leave"]
                    .map((type) => DropdownMenuItem(
                          value: type,
                          child: Text(type),
                        ))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    leaveType = value;
                  });
                },
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Expanded(child: buildDateField("From date")),
                  SizedBox(width: 10),
                  Expanded(child: buildDateField("To date")),
                ],
              ),
              SizedBox(height: 20),
              buildTextField("Duration"),
              SizedBox(height: 20),
              Text(""),
              Row(
                children: [
                  buildToggleButton("Full day", true),
                  buildToggleButton("AN", false),
                  buildToggleButton("FN", false),
                ],
              ),
              SizedBox(height: 20),
              buildTextField("Reason for leave"),
              SizedBox(height: 20),
              Text("Is it a Comp Off?", style: TextStyle(color: Colors.white)),
              SizedBox(height: 10),
              Row(
                children: [
                  buildCompOffToggle("No", false),
                  buildCompOffToggle("Yes", true),
                ],
              ),
              SizedBox(height: 20),
              buildTextField("Employee Name"),
              SizedBox(height: 20),
              buildTextField("Phone Number"),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF1C2D41),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  minimumSize: Size(double.infinity, 50),
                ),
                child: Text("SUBMIT", style: TextStyle(fontSize: 18)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildDateField(String label) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: label,
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }

  Widget buildTextField(String label) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: label,
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }

  Widget buildToggleButton(String label, bool value) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            isFullDay = value;
          });
        },
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 4),
          padding: EdgeInsets.symmetric(vertical: 12),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: isFullDay == value ? Colors.redAccent : Colors.white,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            label,
            style: TextStyle(
              color: isFullDay == value ? Colors.white : Colors.black,
            ),
          ),
        ),
      ),
    );
  }

  Widget buildCompOffToggle(String label, bool value) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            isCompOff = value;
          });
        },
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 4),
          padding: EdgeInsets.symmetric(vertical: 12),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: isCompOff == value ? Colors.redAccent : Colors.white,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            label,
            style: TextStyle(
              color: isCompOff == value ? Colors.white : Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}

void main() => runApp(MaterialApp(
      home: LeaveRequestScreen(),
      debugShowCheckedModeBanner: false,
    ));
