import 'package:flutter/material.dart';
import 'package:final_project/view/login.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController _firstnameController = TextEditingController();
  TextEditingController _lastnameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  final _authService = FirebaseAuth.instance;
  bool _isPasswordVisible = false;

  @override
  void dispose() {
    _firstnameController.dispose();
    _lastnameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Register',
              style: TextStyle(fontSize: 36.0),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 30.0),
            _buildInputField('First Name', 'Enter your first name',
                radius: 20.0, controller: _firstnameController),
            SizedBox(height: 16.0),
            _buildInputField('Last Name', 'Enter your last name',
                radius: 20.0, controller: _lastnameController),
            SizedBox(height: 16.0),
            _buildInputField('Email', 'Enter your email',
                radius: 20.0, controller: _emailController),
            SizedBox(height: 16.0),
            _buildPasswordInputField(
              'Password', 'Enter your password', _passwordController,
              radius: 20.0,
            ),
            SizedBox(height: 30.0),
            ElevatedButton(
              onPressed: () async {
                if (_firstnameController.text.isEmpty ||
                    _lastnameController.text.isEmpty ||
                    _emailController.text.isEmpty ||
                    _passwordController.text.isEmpty) {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text('Warning'),
                      content: Text('Please fill in all fields.'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text('OK'),
                        ),
                      ],
                    ),
                  );
                  return;
                }

                String firstName = _firstnameController.text;
                String lastName = _lastnameController.text;
                String email = _emailController.text;
                String password = _passwordController.text;

                try {
                  UserCredential userCredential =
                      await _authService.createUserWithEmailAndPassword(
                    email: email,
                    password: password,
                  );

                  User? user = userCredential.user;

                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('You have successfully registered.'),
                      duration: Duration(seconds: 2),
                    ),
                  );

                  await Future.delayed(Duration(seconds: 2));

                  if (user != null) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage()),
                    );
                  }
                } catch (e) {
                  
                  if (e is FirebaseAuthException) {
                    
                    if (e.code == 'email-already-in-use') {
                     
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text('Registration Failed'),
                          content: Text(
                              'The email address is already in use. Please use another email.'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text('OK'),
                            ),
                          ],
                        ),
                      );
                    } else {
                      
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text('Registration Failed'),
                          content: Text(
                              'An error occurred while registering. Please try again later.'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text('OK'),
                            ),
                          ],
                        ),
                      );
                    }
                  }
                }
              },
              child: Text('Register'),
              style: ElevatedButton.styleFrom(
                primary: Colors.green,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Already have account? '),
                TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage()),
                    );
                  },
                  child: Text(
                    'Login',
                    style: TextStyle(color: Colors.green),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInputField(String label, String hint,
      {double radius = 0.0,
      required TextEditingController controller,
      bool obscureText = false}) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        border: Border.all(color: Colors.green),
      ),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          labelText: label,
          hintText: hint,
          border: InputBorder.none,
          contentPadding:
              EdgeInsets.symmetric(horizontal: 20.0, vertical: 14.0),
        ),
      ),
    );
  }

  Widget _buildPasswordInputField(
      String label, String hint, TextEditingController controller,
      {double radius = 0.0}) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        border: Border.all(color: Colors.green),
      ),
      child: Stack(
        alignment: Alignment.centerRight,
        children: [
          TextField(
            controller: controller,
            obscureText: !_isPasswordVisible, 
            decoration: InputDecoration(
              labelText: label,
              hintText: hint,
              border: InputBorder.none,
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 20.0, vertical: 14.0),
            ),
          ),
          IconButton(
            icon: Icon(
              _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
              color: Colors.grey,
            ),
            onPressed: () {
              setState(() {
                _isPasswordVisible = !_isPasswordVisible; 
              });
            },
          ),
        ],
      ),
    );
  }
}

