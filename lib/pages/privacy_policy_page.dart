import 'package:flutter/material.dart';

class PrivacyPolicyPage extends StatelessWidget {
  const PrivacyPolicyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade50,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Privacy Policy',
          style: TextStyle(
            color: Colors.blue.shade500,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0, // Remove shadow for a flatter look
        iconTheme: IconThemeData(
          color: Colors.black,
        ), // Ensure back button is white
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'We respect your privacy:',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.blue.shade500,
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              '''- We collect basic personal information like name and email for communication and course access.
              \n- Your information is never sold to third parties.
              \n- We use secure platforms for handling payments and data.
              \n- You can request data removal by contacting us at hr@ramchintech.com.
              \n\nYour trust is important to us. We are committed to protecting your privacy.''',
              style: TextStyle(
                fontSize: 16,
                height: 1.5,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
