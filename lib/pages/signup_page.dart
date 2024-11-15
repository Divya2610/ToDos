//
// import 'package:flutter/material.dart';
// import 'signin_page.dart';
//
// class SignUpPage extends StatelessWidget {
//   final TextEditingController _firstNameController = TextEditingController();
//   final TextEditingController _lastNameController = TextEditingController();
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//   final TextEditingController _confirmPasswordController = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             colors: [Colors.blue.shade200, Colors.blueAccent.shade400],
//             begin: Alignment.topLeft,
//             end: Alignment.bottomRight,
//           ),
//         ),
//         child: Center(
//           child: SingleChildScrollView(
//             padding: const EdgeInsets.all(16.0),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 // Title "Sign Up" at the top
//                 Text(
//                   'SignUp',
//                   style: TextStyle(
//                     fontSize: 32,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.white,
//                   ),
//                 ),
//                 SizedBox(height: 30),
//                 // Card for Sign Up form with adjusted height and width
//                 Card(
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(16),
//                   ),
//                   elevation: 6,
//                   child: Container(
//                     width: MediaQuery.of(context).size.width * 0.30, // Width of the card
//                     padding: const EdgeInsets.all(20.0),
//                     child: Column(
//                       mainAxisSize: MainAxisSize.min, // Set to min to reduce height
//                       children: [
//                         _buildTextField(
//                           controller: _firstNameController,
//                           labelText: 'First Name',
//                           icon: Icons.person,
//                           obscureText: false,
//                         ),
//                         SizedBox(height: 16.0),
//                         _buildTextField(
//                           controller: _lastNameController,
//                           labelText: 'Last Name',
//                           icon: Icons.person_outline,
//                           obscureText: false,
//                         ),
//                         SizedBox(height: 16.0),
//                         _buildTextField(
//                           controller: _emailController,
//                           labelText: 'Email',
//                           icon: Icons.email,
//                           keyboardType: TextInputType.emailAddress,
//                           obscureText: false,
//                         ),
//                         SizedBox(height: 16.0),
//                         _buildTextField(
//                           controller: _passwordController,
//                           labelText: 'Password',
//                           icon: Icons.lock,
//                           obscureText: true,
//                         ),
//                         SizedBox(height: 16.0),
//                         _buildTextField(
//                           controller: _confirmPasswordController,
//                           labelText: 'Confirm Password',
//                           icon: Icons.lock_outline,
//                           obscureText: true,
//                         ),
//                         SizedBox(height: 24.0),
//                         ElevatedButton(
//                           onPressed: () {
//                             // Handle sign-up button press
//                           },
//                           style: ElevatedButton.styleFrom(
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(24.0),
//                             ),
//                             padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 16), // Increased padding
//                             textStyle: TextStyle(fontSize: 20), // Increased font size
//                           ),
//                           child: Text('Sign Up'),
//                         ),
//                         SizedBox(height: 16.0),
//                         // Divider with "or"
//                         Row(
//                           children: [
//                             Expanded(child: Divider(thickness: 1)),
//                             Padding(
//                               padding: const EdgeInsets.symmetric(horizontal: 8.0),
//                               child: Text('or', style: TextStyle(color: Colors.grey)),
//                             ),
//                             Expanded(child: Divider(thickness: 1)),
//                           ],
//                         ),
//                         SizedBox(height: 16.0),
//                         // Google Sign-In button with increased size
//                         ElevatedButton.icon(
//                           onPressed: () {
//                             // Handle Google sign-in
//                           },
//                           icon: Icon(Icons.login, size: 20), // Increased icon size
//                           label: Text(
//                             'Sign In with Google',
//                             style: TextStyle(fontSize: 18), // Increased font size
//                           ),
//                           style: ElevatedButton.styleFrom(
//                             backgroundColor: Colors.white,
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(24.0),
//                             ),
//                             padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16), // Increased padding
//                           ),
//                         ),
//                         SizedBox(height: 16.0),
//                         // Text button to navigate to SignInPage
//                         TextButton(
//                           onPressed: () {
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(builder: (context) => SignInPage()),
//                             );
//                           },
//                           child: Text(
//                             'Already have an account? Sign In',
//                             style: TextStyle(color: Colors.grey),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   // Helper method to build each TextField with a consistent style
//   Widget _buildTextField({
//     required TextEditingController controller,
//     required String labelText,
//     required IconData icon,
//     TextInputType keyboardType = TextInputType.text,
//     bool obscureText = false,
//   }) {
//     return TextField(
//       controller: controller,
//       decoration: InputDecoration(
//         labelText: labelText,
//         prefixIcon: Icon(icon, color: Colors.purple),
//         filled: true,
//         fillColor: Colors.white,
//         contentPadding: EdgeInsets.symmetric(vertical: 16.0),
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(24.0),
//           borderSide: BorderSide.none,
//         ),
//       ),
//       keyboardType: keyboardType,
//       obscureText: obscureText,
//     );
//   }
// }
//
//
//
//


import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart'; // Import Firebase Auth
import 'signin_page.dart';

class SignUpPage extends StatelessWidget {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>(); // Form key for validation

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue.shade200, Colors.blueAccent.shade400],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Form( // Wrap in Form widget
              key: _formKey, // Assign the form key
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Title "Sign Up" at the top
                  Text(
                    'Sign Up',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 30),
                  // Card for Sign Up form
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    elevation: 6,
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.80, // Width of the card
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          _buildTextField(
                            controller: _firstNameController,
                            labelText: 'First Name',
                            icon: Icons.person,
                            obscureText: false,
                          ),
                          SizedBox(height: 16.0),
                          _buildTextField(
                            controller: _lastNameController,
                            labelText: 'Last Name',
                            icon: Icons.person_outline,
                            obscureText: false,
                          ),
                          SizedBox(height: 16.0),
                          _buildTextField(
                            controller: _emailController,
                            labelText: 'Email',
                            icon: Icons.email,
                            keyboardType: TextInputType.emailAddress,
                            obscureText: false,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your email';
                              }
                              if (!RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$').hasMatch(value)) {
                                return 'Please enter a valid email';
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 16.0),
                          _buildTextField(
                            controller: _passwordController,
                            labelText: 'Password',
                            icon: Icons.lock,
                            obscureText: true,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your password';
                              }
                              if (value.length < 6) {
                                return 'Password must be at least 6 characters';
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 16.0),
                          _buildTextField(
                            controller: _confirmPasswordController,
                            labelText: 'Confirm Password',
                            icon: Icons.lock_outline,
                            obscureText: true,
                            validator: (value) {
                              if (value != _passwordController.text) {
                                return 'Passwords do not match';
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 24.0),
                          ElevatedButton(
                            onPressed: () {
                              _signUp(context);
                            },
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(24.0),
                              ),
                              padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 16),
                              textStyle: TextStyle(fontSize: 20),
                            ),
                            child: Text('Sign Up'),
                          ),
                          SizedBox(height: 16.0),
                          // Divider with "or"
                          Row(
                            children: [
                              Expanded(child: Divider(thickness: 1)),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Text('or', style: TextStyle(color: Colors.grey)),
                              ),
                              Expanded(child: Divider(thickness: 1)),
                            ],
                          ),
                          SizedBox(height: 16.0),
                          // Google Sign-In button
                          ElevatedButton.icon(
                            onPressed: () {
                              // Handle Google sign-in
                            },
                            icon: Icon(Icons.login, size: 20),
                            label: Text(
                              'Sign In with Google',
                              style: TextStyle(fontSize: 18),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(24.0),
                              ),
                              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                            ),
                          ),
                          SizedBox(height: 16.0),
                          // Text button to navigate to SignInPage
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => SignInPage()),
                              );
                            },
                            child: Text(
                              'Already have an account? Sign In',
                              style: TextStyle(color: Colors.grey),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Sign Up method
  Future<void> _signUp(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      try {
        UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailController.text,
          password: _passwordController.text,
        );

        // If needed, you can save additional user data in Firestore here
        // For example:
        // await FirebaseFirestore.instance.collection('users').doc(userCredential.user!.uid).set({
        //   'firstName': _firstNameController.text,
        //   'lastName': _lastNameController.text,
        //   'email': _emailController.text,
        // });

        // Navigate to login screen or home page
        Navigator.pushNamed(context, '/home'); // Use the correct route for your app
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Sign Up failed: $e")),
        );
      }
    }
  }

  // Helper method to build each TextField with a consistent style
  Widget _buildTextField({
    required TextEditingController controller,
    required String labelText,
    required IconData icon,
    TextInputType keyboardType = TextInputType.text,
    bool obscureText = false,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        prefixIcon: Icon(icon, color: Colors.purple),
        filled: true,
        fillColor: Colors.white,
        contentPadding: EdgeInsets.symmetric(vertical: 16.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(24.0),
          borderSide: BorderSide.none,
        ),
      ),
      keyboardType: keyboardType,
      obscureText: obscureText,
      validator: validator,
    );
  }
}

