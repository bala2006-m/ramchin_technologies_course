import 'package:flutter/material.dart';

import '../util.dart';

class MobileHome extends StatelessWidget {
  const MobileHome({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            SizedBox(height: 30),
            Text(
              "Welcome to Ramchin Technologies",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 24, color: Colors.blue.shade500),
            ),
            SizedBox(height: 10),
            Text(
              'Empowering developers through quality education!',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, color: Colors.black),
            ),

            SizedBox(height: 50),
            Text(
              "Our Courses",
              style: TextStyle(color: Colors.black, fontSize: 24),
            ),
            SizedBox(height: 20),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: course
                  .map(
                    (c) => ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        fixedSize: Size(
                          MediaQuery.sizeOf(context).width / 2,
                          MediaQuery.sizeOf(context).width / 6,
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 12,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, c['route']!);
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset(c['img']!, width: 30, height: 30),
                          SizedBox(width: 8),
                          Text(c['name'] ?? 'Course'),
                        ],
                      ),
                    ),
                  )
                  .toList(),
            ),
            SizedBox(height: 30),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(20),
              color: Colors.white,
              child: Column(
                children: [
                  Text(
                    "Invest in your career",
                    style: TextStyle(color: Colors.black, fontSize: 24),
                  ),
                  SizedBox(height: 30),
                  Wrap(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _infoBox(
                            "Explore new skills",
                            "Access Courses \nand Learn new skills",
                          ),
                          SizedBox(height: 20),
                          _infoBox(
                            "Earn valuable credentials",
                            "Get certificates for every course you finish and boost your chances of getting hired after your trial ends at no additional cost.",
                            width: 200,
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 40),
                  Text(
                    "Why Choose Us?",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20),
                  _buildFeatureRow(
                    Icons.school,
                    "Expert-Led Courses",
                    "Learn from industry professionals with real-world experience.",
                  ),
                  SizedBox(height: 15),
                  _buildFeatureRow(
                    Icons.work,
                    "Job-Ready Skills",
                    "Gain practical skills that employers are looking for.",
                  ),
                  SizedBox(height: 15),
                  _buildFeatureRow(
                    Icons.lightbulb_outline,
                    "Internship Opportunities",
                    "Apply your knowledge in real projects and gain valuable experience.",
                  ),
                  SizedBox(height: 15),
                  _buildFeatureRow(
                    Icons.group,
                    "Supportive Community",
                    "Connect with fellow learners and mentors.",
                  ),
                  SizedBox(height: 50),

                  /// Footer links
                  Divider(thickness: 1),
                  Wrap(
                    alignment: WrapAlignment.center,
                    spacing: 20,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/contact');
                        },
                        child: Text(
                          "Contact Us",
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/terms');
                        },
                        child: Text(
                          "Terms & Conditions",
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/privacy');
                        },
                        child: Text(
                          "Privacy Policy",
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFeatureRow(IconData icon, String title, String description) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, color: Colors.blue.shade500, size: 30),
        SizedBox(width: 15),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 5),
              Text(
                description,
                style: TextStyle(color: Colors.grey.shade700, fontSize: 15),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _infoBox(String title, String description, {double width = 150}) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(title, style: TextStyle(color: Colors.black, fontSize: 22)),
        SizedBox(height: 10),
        ConstrainedBox(
          constraints: BoxConstraints(maxWidth: width),
          child: Text(
            description,
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.black87),
          ),
        ),
      ],
    );
  }
}
