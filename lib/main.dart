import 'package:flutter/material.dart';
import 'package:ramchin_technologies_course/pages/angular_page.dart';
import 'package:ramchin_technologies_course/pages/contact_page.dart';
import 'package:ramchin_technologies_course/pages/courses_page.dart';
import 'package:ramchin_technologies_course/pages/flutter_page.dart';
import 'package:ramchin_technologies_course/pages/home_page.dart';
import 'package:ramchin_technologies_course/pages/internships_page.dart';
import 'package:ramchin_technologies_course/pages/privacy_policy_page.dart';
import 'package:ramchin_technologies_course/pages/react_native_page.dart';
import 'package:ramchin_technologies_course/pages/react_page.dart';
import 'package:ramchin_technologies_course/pages/terms_conditions_page.dart';
import 'package:ramchin_technologies_course/util.dart';

void main() {
  runApp(RamchinApp());
}

class RamchinApp extends StatelessWidget {
  const RamchinApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ramchin Technologies',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (_) => HomePage(),
        '/courses': (_) => CoursesPage(),
        '/internships': (_) => InternshipsPage(),
        '/contact': (context) => ContactPage(),
        '/terms': (context) => TermsConditionsPage(),
        '/privacy': (context) => PrivacyPolicyPage(),
        '/flutter': (context) => FlutterPage(
          courseName: 'Flutter',
          amount: '${course[0]['amount']}',
        ),
        '/react': (context) =>
            ReactPage(courseName: 'React', amount: '${course[1]['amount']}'),
        '/angular': (context) => AngularPage(
          courseName: 'Angular',
          amount: '${course[3]['amount']}',
        ),
        '/react-native': (context) => ReactNativePage(
          courseName: 'React Native',
          amount: '${course[2]['amount']}',
        ),
      },
    );
  }
}
