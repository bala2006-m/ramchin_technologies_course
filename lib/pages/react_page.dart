import 'package:flutter/material.dart';

import 'register_page.dart';

class ReactPage extends StatelessWidget {
  final String courseName;
  final String amount;

  const ReactPage({super.key, required this.courseName, required this.amount});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("React Course & Internship"),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                "React Development Program",
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                "Build modern web applications with React.js. Aimed at developers ready to master frontend frameworks.",
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),
              _sectionTitle("What You'll Learn"),
              _bullet("JSX, components & props"),
              _bullet("Hooks (useState, useEffect, useContext)"),
              _bullet("Routing & navigation"),
              _bullet("Form handling & validation"),
              _bullet("API integration with fetch/Axios"),
              _bullet("State management (Redux/Context API)"),
              SizedBox(height: 20),
              _sectionTitle("Internship Program"),
              Text(
                "Apply your React skills on client projects and receive certification.",
              ),
              SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  icon: Icon(Icons.app_registration),
                  label: Text("Enroll Now"),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => RegisterPage(
                          courseName: courseName,
                          amount: amount,
                        ),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    padding: EdgeInsets.symmetric(vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    textStyle: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _sectionTitle(String title) => Padding(
    padding: const EdgeInsets.symmetric(vertical: 8),
    child: Text(
      title,
      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
    ),
  );

  Widget _bullet(String text) => Padding(
    padding: const EdgeInsets.symmetric(vertical: 2),
    child: Row(
      children: [
        Icon(Icons.check_circle_outline, color: Colors.green),
        SizedBox(width: 8),
        Expanded(child: Text(text)),
      ],
    ),
  );
}
