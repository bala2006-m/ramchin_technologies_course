import 'package:flutter/material.dart';

class CourseCard extends StatelessWidget {
  final String title;

  const CourseCard({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      color: Colors.indigo[50],
      child: Center(
        child: Text(
          title,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
