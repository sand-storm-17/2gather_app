import 'package:flutter/material.dart';
import 'package:gather/constants/assets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:gather/routing/models/routes.dart';
import 'package:gather/theme/app_colors.dart';
import 'package:gather/theme/app_theme.dart';
import 'package:go_router/go_router.dart';
import 'package:gather/routing/models/routes.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<StatefulWidget> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _isLoading = false;

  Future<void> _signUp() async {
    if (!_formKey.currentState!.validate()) return;

      setState(() => _isLoading = true);

    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );

      // Save user details in Firestore
      await _firestore.collection('users').doc(userCredential.user!.uid).set({
        'firstName': _firstNameController.text.trim(),
        'lastName': _lastNameController.text.trim(),
        'phone': _phoneController.text.trim(),
        'email': _emailController.text.trim(),
        'username': _usernameController.text.trim(),
        'createdAt': FieldValue.serverTimestamp(),
      });

      // Navigate to the sign-in screen
      context.go(Routes.signIn);
    } on FirebaseAuthException catch (e) {
      String errorMessage = "Sign-up failed. Try again.";
      if (e.code == 'email-already-in-use') {
        errorMessage = "Email is already in use.";
      }
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(errorMessage)));
    } finally {
      setState(() => _isLoading = false);
    }
  }

  Future<void> _signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) return;

      final GoogleSignInAuthentication? googleAuth = await googleUser.authentication;

      if (googleAuth == null) return;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      UserCredential userCredential = await _auth.signInWithCredential(credential);
      User? user = userCredential.user;

      if (user != null) {
        DocumentSnapshot userDoc = await _firestore.collection('users').doc(user.uid).get();

        if (userDoc.exists) {
          // User exists, update details if necessary
          await _firestore.collection('users').doc(user.uid).update({
            'username': _usernameController.text.trim().isNotEmpty ? _usernameController.text.trim() : userDoc['username'],
            'phone': _phoneController.text.trim().isNotEmpty ? _phoneController.text.trim() : userDoc['phone'],
          });
        } else {
          // New user, save details
          await _firestore.collection('users').doc(user.uid).set({
            'firstName': user.displayName?.split(" ").first ?? '',
            'lastName': user.displayName?.split(" ").last ?? '',
            'email': user.email,
            'username': _usernameController.text.trim(),
            'phone': _phoneController.text.trim(),
            'createdAt': FieldValue.serverTimestamp(),
          });
        }

        context.go(Routes.signIn);
      }
    } catch (e) {
      print("Google Sign-In Error: $e");
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Column(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: Image.asset(Assets.blob1),
          ),
          Image.asset(Assets.logo),
          Image.asset(Assets.friends),
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50),
                  ),
                  color: AppColors.whiteShade700,
                ),
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    Text("Create togetherly", style: AppTheme.headLineLarge24),
                    Text("Join the evergrowing us", style: AppTheme.bodyMedium14),
                    SizedBox(height: 20),
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: TextFormField(
                                  controller: _firstNameController,
                                  decoration: const InputDecoration(
                                    labelText: 'First Name',
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(15.00)),
                                    ),
                                    filled: true,
                                    fillColor: AppColors.white,
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter a name';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              SizedBox(width: 10),
                              Expanded(
                                child: TextFormField(
                                  controller: _lastNameController,
                                  decoration: const InputDecoration(
                                    labelText: 'Last Name',
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(15.00)),
                                    ),
                                    filled: true,
                                    fillColor: AppColors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          TextFormField(
                            controller: _phoneController,
                            decoration: const InputDecoration(
                              labelText: 'Phone Number',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(15.00)),
                              ),
                              filled: true,
                              fillColor: AppColors.white,
                            ),
                            keyboardType: TextInputType.phone,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter phone number';
                              }
                              if (!RegExp(r'^[0-9]{10}$').hasMatch(value)) {
                                return 'Enter a valid 10-digit phone number';
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 10),
                          TextFormField(
                            controller: _emailController,
                            decoration: const InputDecoration(
                              labelText: 'Email',
                              hintText: "panduranga@gmail.com",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(15.00)),
                              ),
                              filled: true,
                              fillColor: AppColors.white,
                            ),
                            keyboardType: TextInputType.emailAddress,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter an email';
                              }
                              if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                                return 'Enter a valid email';
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              Expanded(
                                child: TextFormField(
                                  controller: _usernameController,
                                  decoration: const InputDecoration(
                                    labelText: 'Username',
                                    hintText: '@username',
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(15.00)),
                                    ),
                                    filled: true,
                                    fillColor: AppColors.white,
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter a username';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              SizedBox(width: 10),
                              Expanded(
                                child: TextFormField(
                                  controller: _passwordController,
                                  decoration: const InputDecoration(
                                    labelText: 'Password',
                                    hintText: '**********',
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(15.00)),
                                    ),
                                    filled: true,
                                    fillColor: AppColors.white,
                                  ),
                                  obscureText: true,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter a password';
                                    }
                                    if (value.length < 6) {
                                      return 'Password must be at least 6 characters';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.secondary,
                        foregroundColor: Colors.white,
                        shadowColor: Colors.black,
                        elevation: 6,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        minimumSize: Size(double.infinity, 50.00),
                      ),
                      onPressed: _isLoading ? null : _signUp,
                      child: _isLoading
                          ? CircularProgressIndicator(color: Colors.white)
                          : Text('Sign Up',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Poppins',
                              fontSize: 16,
                            )
                          ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Already have an account?",style: TextStyle(fontFamily: 'Poppins'),),
                        TextButton(
                          onPressed: () => context.go(Routes.signIn),
                          child: Text("Sign In", style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Poppins',

                            color: Colors.black,
                          ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}