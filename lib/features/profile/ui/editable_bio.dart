import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class EditableBio extends StatefulWidget {
  final String initialBio;
  final String userId;

  const EditableBio({
    Key? key,
    required this.initialBio,
    required this.userId,
  }) : super(key: key);

  @override
  _EditableBioState createState() => _EditableBioState();
}

class _EditableBioState extends State<EditableBio> {
  late TextEditingController _bioController;
  late String _currentBio;

  @override
  void initState() {
    super.initState();
    _currentBio = widget.initialBio;
    _bioController = TextEditingController(text: widget.initialBio);
  }

  @override
  void dispose() {
    _bioController.dispose();
    super.dispose();
  }

  Future<void> _editBio() async {
    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Edit Bio",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 22,
              fontFamily: 'Poppins',
            ),
          ),
          content: TextField(
            controller: _bioController,
            maxLines: 3,
            decoration: const InputDecoration(
              hintText: "Tell us about yourself",
              border: OutlineInputBorder(),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Cancel",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  fontFamily: 'Poppins',
                  color: Colors.black
                ),
              ),
            ),
            TextButton(
              onPressed: () async {
                if (_bioController.text.trim().isNotEmpty) {
                  await FirebaseFirestore.instance
                      .collection('users')
                      .doc(widget.userId)
                      .update({'bio': _bioController.text});
                  setState(() {
                    _currentBio = _bioController.text;
                  });
                }
                Navigator.pop(context);
              },
              child: const Text("Save",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  fontFamily: 'Poppins',
                  color: Colors.black
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "About Me",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 19,
                fontFamily: 'Poppins',
              ),
            ),
            IconButton(
              icon: const Icon(Icons.edit),
              onPressed: _editBio,
            ),
          ],
        ),
        Text(
          _currentBio,
          style: const TextStyle(
            fontFamily: 'Poppins',
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}