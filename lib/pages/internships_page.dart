import 'package:flutter/material.dart';

import '../widgets/course_card.dart';

class InternshipsPage extends StatelessWidget {
  final List<String> internships = ['Flutter', 'React'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Internships')),
      body: ListView.builder(
        padding: EdgeInsets.all(16),
        itemCount: internships.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(bottom: 16),
            child: CourseCard(title: internships[index]),
          );
        },
      ),
    );
  }
}
