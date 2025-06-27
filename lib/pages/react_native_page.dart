import 'package:flutter/material.dart';
import 'package:ramchin_technologies_course/pages/register_page.dart';

class ReactNativePage extends StatelessWidget {
  final String courseName;
  final String amount;

  const ReactNativePage({
    super.key,
    required this.courseName,
    required this.amount,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("React Native Course & Internship"),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                "React Native Development Program",
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                "Master mobile app development for Android & iOS with React Native. Perfect for cross-platform developers.",
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),
              _sectionTitle("What You'll Learn"),
              _bullet("React Native CLI & Expo"),
              _bullet("UI components & styling"),
              _bullet("Navigation (Stack, Tab, Drawer)"),
              _bullet("State management (Redux, Context API)"),
              _bullet("API integration and Firebase"),
              _bullet("Publishing apps to Play Store / App Store"),
              SizedBox(height: 20),
              _sectionTitle("Internship Program"),
              Text(
                "Work on real-world apps and receive a recognized internship certificate.",
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
                          amount: amount, // Dynamically passed
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
