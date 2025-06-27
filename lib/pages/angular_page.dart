import 'package:flutter/material.dart';
import 'package:ramchin_technologies_course/pages/register_page.dart';

class AngularPage extends StatelessWidget {
  final String courseName;
  final String amount;

  const AngularPage({
    super.key,
    required this.courseName,
    required this.amount,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Angular Course & Internship"),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                "Angular Development Program",
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                "Learn to build scalable and maintainable web apps using Angular. Suitable for developers aiming for enterprise-grade development skills.",
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),
              _sectionTitle("What You'll Learn"),
              _bulletPoint("Angular CLI and component architecture"),
              _bulletPoint("Templates, directives, and pipes"),
              _bulletPoint("Form handling (Reactive & Template-driven)"),
              _bulletPoint("Routing and lazy loading"),
              _bulletPoint("RESTful API integration with HttpClient"),
              _bulletPoint("Services and dependency injection"),
              SizedBox(height: 20),
              _sectionTitle("Internship Program"),
              Text(
                "Apply your Angular skills in live projects, gain experience with SCRUM methodology, and receive an official internship certificate.",
              ),
              SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  icon: Icon(Icons.app_registration, color: Colors.white),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    padding: EdgeInsets.symmetric(vertical: 15),
                    textStyle: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
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

                  label: Text(
                    "Enroll Now",
                    style: TextStyle(color: Colors.white),
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

  Widget _bulletPoint(String text) => Padding(
    padding: const EdgeInsets.symmetric(vertical: 2),
    child: Row(
      children: [
        Icon(Icons.check, color: Colors.green),
        SizedBox(width: 8),
        Expanded(child: Text(text)),
      ],
    ),
  );
}
