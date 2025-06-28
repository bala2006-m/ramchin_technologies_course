import 'package:flutter/material.dart';

class TermsConditionsPage extends StatelessWidget {
  const TermsConditionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade50,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text(
          'Terms & Conditions',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.blue.shade500,
          ),
        ),

        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'By accessing or using our services, you agree to the following terms:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 20),
            _buildTermItem('1. You must be at least 18 years old to register.'),
            _buildTermItem('2. Subscription is monthly and billed in INR.'),
            _buildTermItem(
              '3. No refunds will be provided after a course has been accessed.',
            ),
            _buildTermItem('4. Content is for personal educational use only.'),
            _buildTermItem(
              '5. Ramchin Technologies holds the right to update or modify courses.',
            ),
            SizedBox(height: 20),
            Text(
              'Please read all our policies carefully before proceeding.',
              style: TextStyle(
                fontSize: 16,
                fontStyle: FontStyle.italic,
                color: Colors.grey.shade700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _buildTermItem(String text) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Icon(
          Icons.check_circle_outline,
          color: Colors.deepPurple.shade300,
          size: 20,
        ),
        SizedBox(width: 10),
        Expanded(
          child: Text(
            text,
            style: TextStyle(fontSize: 16, color: Colors.black87, height: 1.5),
          ),
        ),
      ],
    ),
  );
}
