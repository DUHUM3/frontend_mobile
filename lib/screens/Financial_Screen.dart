import 'package:flutter/material.dart';

class InvoiceScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0D1B2A),
      appBar: AppBar(
        backgroundColor: Color(0xFF0D1B2A),
        elevation: 0,
        title: Text("Home",style: TextStyle(color: Colors.white),),
        iconTheme: IconThemeData(
            color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Illustration
            Container(
              child: Image.asset(
                'assets/images/Financial.png', // ضع هنا رابط لصورة التوضيحية الخاصة بك
                height: 250,
              ),
            ),

            SizedBox(height: 20),
            // Date range
            Text(
              '01/10/2019 - 01/11/2019',
              style: TextStyle(
                color: Colors.white.withOpacity(0.7),
                fontSize: 16,
              ),
            ),
            SizedBox(height: 20),
            // Details card
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              color: Color(0xFF1C2D41),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Name and phone number
                    buildInfoRow("Name", "Jackson Maine"),
                    buildInfoRow("Phone number", "+8424599721"),
                    Divider(color: Colors.grey.withOpacity(0.6)),
                    // Date range
                    buildInfoRow("From", "01/10/2019"),
                    buildInfoRow("To", "01/11/2019"),
                    Divider(color: Colors.grey.withOpacity(0.6)),
                    // Working hours and hour price
                    buildInfoRow("Working hours", "200"),
                    buildInfoRow("Hour price", "\$10"),
                    Divider(color: Colors.grey.withOpacity(0.6)),
                    // Total
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "TOTAL",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          "\$2000",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.redAccent,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              color: Colors.white.withOpacity(0.7),
              fontSize: 16,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}

void main() => runApp(MaterialApp(
      home: InvoiceScreen(),
      debugShowCheckedModeBanner: false,
    ));
