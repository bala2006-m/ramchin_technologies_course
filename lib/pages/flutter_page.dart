import 'package:flutter/material.dart';

import 'register_page.dart';

class FlutterPage extends StatelessWidget {
  final String courseName;
  final String amount;

  const FlutterPage({
    super.key,
    required this.courseName,
    required this.amount,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Course & Internship"),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                "Flutter Development Program",
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                "Master cross-platform mobile app development with Flutter & Dart. Learn to build performant UIs from scratch.",
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),
              _sectionTitle("What You'll Learn"),
              _bullet("Flutter architecture & widgets"),
              _bullet("Dart fundamentals"),
              _bullet("State management (Provider, Bloc)"),
              _bullet("API integration & Firebase"),
              _bullet("Animations & custom UIs"),
              _bullet("Publishing to Play Store & App Store"),
              SizedBox(height: 20),
              _sectionTitle("Internship Program"),
              Text("Work on real projects and receive a certified internship."),
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
