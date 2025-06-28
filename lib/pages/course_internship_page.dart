import 'package:flutter/material.dart';

class CourseAndInternshipPage extends StatelessWidget {
  const CourseAndInternshipPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Courses & Internships")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '🎓 Your Courses & Internship Access is Ready!',
              style: TextStyle(fontSize: 22),
            ),
            SizedBox(height: 20),
            Text('Thank you for your payment. Start learning today!'),
          ],
        ),
      ),
    );
  }
}
