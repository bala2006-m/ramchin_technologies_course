import 'package:flutter/material.dart';

import '../widgets/course_card.dart';

class CoursesPage extends StatelessWidget {
  final List<String> courses = ['Flutter', 'React', 'Angular'];

  CoursesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Courses')),
      body: GridView.builder(
        padding: EdgeInsets.all(16),
        itemCount: courses.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3,
        ),
        itemBuilder: (context, index) {
          return CourseCard(title: courses[index]);
        },
      ),
    );
  }
}
