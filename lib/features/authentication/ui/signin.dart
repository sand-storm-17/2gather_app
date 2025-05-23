import 'package:flutter/material.dart';
import 'package:gather/constants/assets.dart';
import 'package:gather/routing/models/routes.dart';
import 'package:gather/theme/app_colors.dart';
import 'package:gather/theme/app_theme.dart';
import 'package:go_router/go_router.dart';
import 'package:gather/features/authentication/repository/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});
  @override
  State<StatefulWidget> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;

  final AuthRepository _authRepository = AuthRepository();

  Future<void> _signIn() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);

    try {
      final userCredential = await _authRepository.signInWithEmail(
        _emailController.text.trim(),
        _passwordController.text.trim(),
      );

      if (userCredential != null) {
        context.go(Routes.homePage);
      }
    } on FirebaseAuthException catch (e) {
      String errorMessage = "Sign-in failed. Please try again.";
      if (e.code == 'user-not-found') {
        errorMessage = "No user found with this email.";
      } else if (e.code == 'wrong-password') {
        errorMessage = "Incorrect password.";
      }
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(errorMessage)),
      );
    } finally {
      setState(() => _isLoading = false);
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Column(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: Image.asset(Assets.blob1),
          ),
          Image.asset(Assets.logo),
          Image.asset(Assets.smileEmoji),
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: screenWidth,
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
                    Text("Welcome Back!", style: AppTheme.headLineLarge24),
                    Text("We knew you would come back", style: AppTheme.bodyMedium14),
                    Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: TextFormField(
                              controller: _emailController,
                              decoration: const InputDecoration(
                                hintText: 'Email',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(15.0)),
                                ),
                                filled: true,
                                fillColor: AppColors.white,
                              ),
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
                          ),
                          const SizedBox(height: 10),
                          TextFormField(
                            controller: _passwordController,
                            obscureText: true,
                            decoration: const InputDecoration(
                              hintText: 'Password',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(15.0)),
                              ),
                              filled: true,
                              fillColor: AppColors.white,
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter password';
                              }
                              if (value.length < 6) {
                                return 'Password must be at least 6 characters';
                              }
                              return null;
                            },
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.secondary,
                          foregroundColor: Colors.white,
                          shadowColor: Colors.black,
                          elevation: 6,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8), // Less rounded corners
                          ),
                          minimumSize: Size(double.infinity, 50.0),
                        ),
                        onPressed: _isLoading ? null : _signIn,
                        child: _isLoading
                            ? CircularProgressIndicator(color: Colors.white)
                            : const Text(
                              'Sign In',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Poppins',
                                fontSize: 16,
                              ),
                              ),
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(child: Divider(thickness: 1.0, color: Colors.black)),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text("OR"),
                        ),
                        Expanded(child: Divider(thickness: 1.0, color: Colors.black)),
                      ],
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8), // Less rounded corners
                          ),
                        minimumSize: Size(double.infinity, 50.0),
                        shadowColor: Colors.black,
                        elevation: 6,
                        backgroundColor: AppColors.black,
                        foregroundColor: Colors.white
                      ),
                      onPressed: () async {
                        try {
                          final userCredential = await _authRepository.signInWithGoogle();
                          if (userCredential != null) {
                            context.go(Routes.homePage);
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text("Google Sign-In failed.")),
                            );
                          }
                        } catch (e) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("An error occurred during Google Sign-In.")),
                          );
                        }
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(Assets.googleLogo, height: 24), // Add a Google logo asset
                          const SizedBox(width: 10),
                          const Text(
                            'Continue with Google',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Poppins',
                              fontSize: 16,
                            ),
                            ),
                        ],
                      ),
                    ),
                    TextButton(
                      onPressed: () => context.go(Routes.signUp),
                      child: Text(
                        "Create a new account? Sign up", style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 13,
                          fontFamily: 'Poppins',
                          color: Colors.black,
                        )
                        ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
