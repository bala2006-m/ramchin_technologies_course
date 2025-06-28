import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:js/js.dart';

import '../razorpay_web.dart';
import 'course_internship_page.dart';

class RegisterPage extends StatefulWidget {
  final String courseName;
  final String amount;

  const RegisterPage({
    super.key,
    required this.courseName,
    required this.amount,
  });

  @override
  RegisterPageState createState() => RegisterPageState();
}

class RegisterPageState extends State<RegisterPage> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final contactController = TextEditingController();
  bool isProcessing = false;

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    contactController.dispose();
    super.dispose();
  }

  Future<void> _startPayment() async {
    await _submitToServer('not_paid');
    final name = nameController.text.trim();
    final email = emailController.text.trim();
    final mobile = contactController.text.trim();

    if (name.isEmpty || email.isEmpty || mobile.isEmpty) {
      _showDialog("Missing Fields", "Please fill all the fields.");
      return;
    }

    if (!RegExp(r'^[\w\.-]+@[\w\.-]+\.\w{2,4}$').hasMatch(email)) {
      _showDialog("Invalid Email", "Please enter a valid email.");
      return;
    }

    if (!RegExp(r'^[6-9]\d{9}$').hasMatch(mobile)) {
      _showDialog("Invalid Mobile", "Enter a valid 10-digit mobile number.");
      return;
    }

    final options = RazorpayOptions(
      key: 'rzp_test_EH1UEwLILEPXCj',
      amount: int.parse(widget.amount) * 100,
      currency: 'INR',
      name: 'Ramchin Technologies',
      description: '${widget.courseName} Course & Internship',
      image: '',
      prefill: Prefill(name: name, email: email, contact: mobile),
    );

    final razorpay = Razorpay(options);

    razorpay.on(
      'payment.success',
      allowInterop((response) async {
        final success = await _submitToServer('paid');
        if (success) {
          _showDialog(
            "Payment Successful",
            "Payment ID: ${response['razorpay_payment_id']}",
          );
        }
      }),
    );

    razorpay.on(
      'payment.failed',
      allowInterop((response) async {
        await _submitToServer('not_paid');
        _showDialog("Payment Failed", response['error']['description']);
      }),
    );

    razorpay.open();
  }

  Future<bool> _submitToServer(String status) async {
    setState(() => isProcessing = true);

    final url = Uri.parse(
      'https://ramchintech.com/school_attendance/register.php',
    );

    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'name': nameController.text.trim(),
          'email': emailController.text.trim(),
          'mobile': contactController.text.trim(),
          'courseName': widget.courseName,
          'amount': widget.amount,
          'paymentStatus': status,
        }),
      );

      final data = jsonDecode(response.body);
      print(nameController.text);
      print(emailController.text);
      print(contactController.text);
      print(widget.courseName);
      print(widget.amount);
      print(status);
      print(data);
      setState(() => isProcessing = false);

      if (!data['success']) {
        _showDialog("Server Error", data['message']);
        return false;
      }

      return true;
    } catch (e) {
      setState(() => isProcessing = false);
      _showDialog("Error", "Something went wrong. Please try again.");
      print(e);
      return false;
    }
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
              onPressed: isProcessing ? null : _startPayment,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                padding: EdgeInsets.symmetric(vertical: 14, horizontal: 30),
              ),
              child: isProcessing
                  ? CircularProgressIndicator(color: Colors.white)
                  : Text(
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
