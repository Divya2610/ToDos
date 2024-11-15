//
// import 'package:flutter/material.dart';
// import 'signup_page.dart';
//
// class SignInPage extends StatelessWidget {
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
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
//                 // Title "Sign In" at the top
//                 Text(
//                   'Sign In',
//                   style: TextStyle(
//                     fontSize: 32,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.white,
//                   ),
//                 ),
//                 SizedBox(height: 30),
//                 // Card for Sign In form
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
//                         SizedBox(height: 24.0),
//                         ElevatedButton(
//                           onPressed: () {
//                             // Handle sign-in button press
//                           },
//                           style: ElevatedButton.styleFrom(
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(24.0),
//                             ),
//                             padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 16), // Increased padding
//                             textStyle: TextStyle(fontSize: 20), // Increased font size
//                           ),
//                           child: Text('Sign In'),
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
//                         // Text button to navigate to SignUpPage
//                         TextButton(
//                           onPressed: () {
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(builder: (context) => SignUpPage()),
//                             );
//                           },
//                           child: Text(
//                             'Don\'t have an account? Sign Up',
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


import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'signup_page.dart';
import 'home_page.dart'; // Import your HomePage

class SignInPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>(); // Form Key for validation

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
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Sign In',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 30),
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    elevation: 6,
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.30,
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          _buildTextField(
                            controller: _emailController,
                            labelText: 'Email',
                            icon: Icons.email,
                            keyboardType: TextInputType.emailAddress,
                            obscureText: false,
                          ),
                          SizedBox(height: 16.0),
                          _buildTextField(
                            controller: _passwordController,
                            labelText: 'Password',
                            icon: Icons.lock,
                            obscureText: true,
                          ),
                          SizedBox(height: 24.0),
                          ElevatedButton(
                            onPressed: () async {
                              await _login(context);
                            },
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(24.0),
                              ),
                              padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 16),
                              textStyle: TextStyle(fontSize: 20),
                            ),
                            child: Text('Sign In'),
                          ),
                          SizedBox(height: 16.0),
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
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => SignUpPage()),
                              );
                            },
                            child: Text(
                              'Don\'t have an account? Sign Up',
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

  Future<void> _login(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      try {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _emailController.text,
          password: _passwordController.text,
        );
        // Navigate to HomePage after successful sign in
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        );
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Login failed: $e")),
        );
      }
    }
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String labelText,
    required IconData icon,
    TextInputType keyboardType = TextInputType.text,
    bool obscureText = false,
  }) {
    return TextField(
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
    );
  }
}
