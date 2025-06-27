import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:js/js.dart';

import '../razorpay_web.dart';
import 'course_internship_page.dart';

class RegisterPage extends StatefulWidget {
  final String courseName;
  final String amount;

  RegisterPage({required this.courseName, required this.amount});

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final contactController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    contactController.dispose();
    super.dispose();
  }

  void _startPayment() {
    if (nameController.text.isEmpty ||
        emailController.text.isEmpty ||
        contactController.text.isEmpty) {
      _showDialog("Missing Fields", "Please fill all the fields.");
      return;
    }

    final options = RazorpayOptions(
      key: 'rzp_test_EH1UEwLILEPXCj',
      amount: int.parse(widget.amount) * 100, // Razorpay uses paise
      currency: 'INR',
      name: 'Ramchin Technologies',
      description: '${widget.courseName} Course & Internship',
      image: '',
      prefill: Prefill(
        name: nameController.text,
        email: emailController.text,
        contact: contactController.text,
      ),
    );

    final razorpay = Razorpay(options);

    razorpay.on(
      'payment.success',
      allowInterop((response) {
        _submitToServer('paid');
        _showDialog(
          "Payment Successful",
          "Payment ID: ${response['razorpay_payment_id']}",
        );
      }),
    );

    razorpay.on(
      'payment.failed',
      allowInterop((response) {
        _submitToServer('not_paid');
        _showDialog("Payment Failed", response['error']['description']);
      }),
    );

    razorpay.open();
  }

  Future<void> _submitToServer(String status) async {
    final url = Uri.parse(
      'https://ramchintech.com/school_attendance/register.php',
    );

    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'name': nameController.text,
        'email': emailController.text,
        'mobile': contactController.text,
        'courseName': widget.courseName,
        'amount': int.parse(widget.amount),
        'paymentStatus': status,
      }),
    );

    print("Server Response: ${response.body}");
  }

  void _showDialog(String title, String message) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              if (title == "Payment Successful") {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => CourseAndInternshipPage()),
                );
              }
            },
            child: Text("OK"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade50,
      appBar: AppBar(
        title: Text("Register & Pay"),
        backgroundColor: Colors.white,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            Text(
              "Enroll for ${widget.courseName}",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            _inputField("Full Name", Icons.person, nameController),
            SizedBox(height: 16),
            _inputField(
              "Email",
              Icons.email,
              emailController,
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: 16),
            _inputField(
              "Mobile",
              Icons.phone,
              contactController,
              keyboardType: TextInputType.phone,
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: _startPayment,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                padding: EdgeInsets.symmetric(vertical: 14, horizontal: 30),
              ),
              child: Text(
                "Pay ₹${widget.amount}",
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _inputField(
    String label,
    IconData icon,
    TextEditingController controller, {
    TextInputType keyboardType = TextInputType.text,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        filled: true,
        fillColor: Colors.white,
      ),
    );
  }
}
