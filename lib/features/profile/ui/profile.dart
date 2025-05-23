import 'dart:io';
import 'package:gather/constants/assets.dart';
import 'package:flutter/material.dart';
import 'package:gather/routing/models/routes.dart';
import 'package:gather/theme/app_colors.dart';
import 'package:gather/theme/app_theme.dart';
import 'package:go_router/go_router.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'editable_bio.dart';
import 'editable_interests.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<StatefulWidget> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String username = "Loading...";
  String firstName = "";
  String lastName = "";
  String bio = "Tell us about yourself!";
  String profileImageUrl = "";
  List<String> interests = [];
  List<String> _previousInterests = [];
  bool isLoading = true;
  File? _selectedImage;
  final TextEditingController _bioController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _fetchUserData();
    _previousInterests = List.from(interests);
  }

  Future<void> _fetchUserData() async {
    try {
      // Get current user ID
      final userId = FirebaseAuth.instance.currentUser?.uid;
      if (userId == null) return;

      // Fetch user document from Firestore
      final userDoc =
          await FirebaseFirestore.instance
              .collection('users')
              .doc(userId)
              .get();

      if (userDoc.exists) {
        setState(() {
          username = userDoc.data()?['username'] ?? "No username";

          firstName = userDoc.data()?['firstName'] ?? "";
          lastName = userDoc.data()?['lastName'] ?? "";
          bio = userDoc.data()?['bio'] ?? "No bio";
          profileImageUrl = userDoc.data()?['profileImageUrl'] ?? "";
          interests = List<String>.from(userDoc.data()?['interests'] ?? []);
          _bioController.text = bio;
          isLoading = false;
        });
      }
    } catch (e) {
      print("Error fetching user data: $e");
      setState(() {
        isLoading = false;
      });
    }
  }

  Future<void> _uploadImage() async {
    // Early exit if widget is disposed
    if (!mounted) return;

    // 1. Initialize loading dialog
    late BuildContext dialogContext;
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        dialogContext = context; // Capture dialog context
        return const Center(child: CircularProgressIndicator());
      },
    );

    try {
      // 2. Check authentication
      final user = FirebaseAuth.instance.currentUser;
      if (user == null) {
        if (!mounted) return;
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('Please sign in first')));
        return;
      }

      // 3. Pick image
      final picker = ImagePicker();
      final pickedFile = await picker.pickImage(source: ImageSource.gallery);
      if (pickedFile == null || !mounted) return;

      // 4. Upload to Firebase
      final storageRef = FirebaseStorage.instance.ref().child(
        'profile_images/${user.uid}/profile.jpg',
      );

      // Monitor upload progress
      final uploadTask = storageRef.putFile(File(pickedFile.path));
      uploadTask.snapshotEvents.listen((taskSnapshot) {
        final progress =
            taskSnapshot.bytesTransferred / taskSnapshot.totalBytes;
        print('Upload progress: ${(progress * 100).toStringAsFixed(2)}%');
      });

      // Wait for upload completion
      final snapshot = await uploadTask;
      final downloadUrl = await snapshot.ref.getDownloadURL();

      // 5. Update Firestore
      await FirebaseFirestore.instance.collection('users').doc(user.uid).update(
        {'profileImageUrl': downloadUrl},
      );

      // 6. Update UI
      if (!mounted) return;
      setState(() => profileImageUrl = downloadUrl);
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Upload failed: ${e.toString()}')));
    } finally {
      // 7. Always dismiss dialog
      if (mounted && Navigator.of(dialogContext).canPop()) {
        Navigator.of(dialogContext).pop();
      }
    }
  }

  Future<void> _updateInterests(List<String> updatedInterests) async {
    try {
      setState(() {
        _previousInterests = List.from(interests);
        interests = updatedInterests;
      });

      final userId = FirebaseAuth.instance.currentUser?.uid;
      if (userId != null) {
        await FirebaseFirestore.instance.collection('users').doc(userId).update(
          {'interests': updatedInterests},
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to update interests: ${e.toString()}')),
      );
      // Revert to previous state if update fails
      setState(() {
        interests = List.from(_previousInterests);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    if (isLoading) {
      return Center(child: CircularProgressIndicator());
    }
    return SingleChildScrollView(
      child: ConstrainedBox(
        constraints: BoxConstraints(minHeight: screenHeight),
        child: Container(
          color: Theme.of(context).primaryColor,
          child: Stack(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: Image.asset(Assets.blob5),
              ),
              Positioned(
                left: 0,
                top: 400,
                child: Image.asset(
                  Assets.profileBlobRed,
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  spacing: 20,
                  children: [
                    SafeArea(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "@$username",
                            style: TextStyle(
                              fontSize: 28,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          IconButton(
                            onPressed:
                                () => context.push(Routes.nestedSettingsPage),
                            icon: Image.asset(
                              Assets.settingpro,
                              width: 28, // Adjust size
                              height: 28,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: _uploadImage,
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(width: 8, color: Colors.white),
                          borderRadius: BorderRadius.circular(200),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black54,
                              blurRadius: 10,
                              spreadRadius: 2,
                            ),
                          ],
                        ),
                        child: CircleAvatar(
                          radius: 100,
                          backgroundColor: Colors.grey[200],
                          backgroundImage:
                              _selectedImage != null
                                  ? FileImage(_selectedImage!)
                                  : profileImageUrl.isNotEmpty
                                  ? NetworkImage(profileImageUrl)
                                  : AssetImage("assets/avatar.png")
                                      as ImageProvider,
                          child:
                              _selectedImage == null && profileImageUrl.isEmpty
                                  ? Icon(
                                    Icons.camera_alt,
                                    size: 60,
                                    color: Colors.white,
                                  )
                                  : null,
                        ),
                      ),
                    ),
                    Text(
                      "$firstName $lastName".trim(),
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Poppins',
                      ),
                    ),
                    Text(
                      "Adventure Enthusiast | Foodie",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Poppins',
                        fontSize: 14,
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: const [
                          BoxShadow(
                            blurRadius: 1,
                            color: Colors.black26,
                            offset: Offset(0, 4),
                          ),
                        ],
                        color: Colors.white,
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 15,
                      ),
                      child: Column(
                        children: [
                          EditableBio(
                            initialBio: bio,
                            userId: FirebaseAuth.instance.currentUser!.uid,
                          ),
                          const SizedBox(height: 20),
                          EditableInterests(
                            interests: interests,
                            allInterests: const [
                              'Hiking',
                              'Swimming',
                              'Reading',
                              'Cooking',
                              'Photography',
                              'Travel',
                              'Music',
                              'Sports',
                              'Dancing',
                              'Gaming',
                              'Art',
                              'Technology',
                            ],
                            onInterestsUpdated: _updateInterests,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 1,
                            color: Colors.black26,
                            offset: Offset(0, 4),
                            spreadRadius: 0,
                          ),
                        ],
                        color: Colors.white,
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: 10,
                        children: [
                          Text(
                            "Support",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                              fontFamily: 'Poppins',
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(10),
                            child: Column(
                              spacing: 5,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Help Center",
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontFamily: 'Poppins',
                                      ),
                                    ),
                                    Icon(Icons.arrow_forward_ios_outlined),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "FAQ",
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontFamily: 'Poppins',
                                      ),
                                    ),
                                    Icon(Icons.arrow_forward_ios_outlined),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Contact Support",
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontFamily: 'Poppins',
                                      ),
                                    ),
                                    Icon(Icons.arrow_forward_ios_outlined),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.logout),
                        TextButton(
                          child: Text(
                            "Sign Out",
                            style: TextStyle(
                              fontSize: 18,
                              fontFamily: 'Poppins',
                              color: Colors.black,
                            ),
                          ),
                          onPressed: () => context.go(Routes.signIn),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
