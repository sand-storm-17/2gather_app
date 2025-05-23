import 'package:flutter/material.dart';
import 'package:gather/theme/app_colors.dart';

class EditableInterests extends StatefulWidget {
  final List<String> interests;
  final List<String> allInterests;
  final Function(List<String>) onInterestsUpdated;

  const EditableInterests({
    Key? key,
    required this.interests,
    required this.allInterests,
    required this.onInterestsUpdated,
  }) : super(key: key);

  @override
  _EditableInterestsState createState() => _EditableInterestsState();
}

class _EditableInterestsState extends State<EditableInterests> {
  late List<String> _currentInterests;
  bool _isEditing = false;

  @override
  void initState() {
    super.initState();
    _currentInterests = List.from(widget.interests);
  }

  Future<void> _editInterests() async {
    final updatedInterests = await showDialog<List<String>>(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: const Text("Select Interests"),
              content: SizedBox(
                width: double.maxFinite,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text("Select up to 6 interests"),
                    const SizedBox(height: 10),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: widget.allInterests.map((interest) {
                        final isSelected = _currentInterests.contains(interest);
                        return FilterChip(
                          label: Text(interest),
                          selected: isSelected,
                          onSelected: (selected) {
                            setState(() {
                              if (selected) {
                                if (_currentInterests.length < 6) {
                                  _currentInterests.add(interest);
                                }
                              } else {
                                _currentInterests.remove(interest);
                              }
                            });
                          },
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context, null),
                  child: const Text("Cancel"),
                ),
                TextButton(
                  onPressed: () => Navigator.pop(context, _currentInterests),
                  child: const Text("Save"),
                ),
              ],
            );
          },
        );
      },
    );

    if (updatedInterests != null) {
      setState(() {
        _currentInterests = updatedInterests;
        _isEditing = false;
      });
      widget.onInterestsUpdated(_currentInterests);
    }
  }

 Future<List<String>?> _showInterestsDialog() async {
  // Create a local copy for the dialog
  final dialogInterests = List<String>.from(_currentInterests);

  final result = await showDialog<List<String>>(
    context: context,
    builder: (context) {
      return StatefulBuilder(
        builder: (context, setState) {
          return AlertDialog(
            title: const Text("Select Interests",
              style:TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 19,
                fontFamily: 'Poppins',
              ),
            ),
            content: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text("Select up to 6 interests"),
                  const SizedBox(height: 10),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: widget.allInterests.map((interest) {
                      final isSelected = dialogInterests.contains(interest);
                      return FilterChip(
                        label: Text(interest),
                        selected: isSelected,
                        onSelected: (selected) {
                          setState(() {
                            if (selected) {
                              if (dialogInterests.length < 6) {
                                dialogInterests.add(interest);
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('Maximum 6 interests allowed'),
                                  ),
                                );
                              }
                            } else {
                              dialogInterests.remove(interest);
                            }
                          });
                        },
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context, null),
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
                onPressed: () => Navigator.pop(context, dialogInterests),
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
    },
  );

  // Ensure we return a properly typed List<String>
  return result != null ? List<String>.from(result) : null;
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
              "Interests",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 20,
                fontFamily: 'Poppins',
              ),
            ),
            IconButton(
              icon: _isEditing ? const Icon(Icons.check) : const Icon(Icons.edit),
              onPressed: () async {
                if (_isEditing) {
                  // Save changes when checkmark is pressed
                  widget.onInterestsUpdated(List<String>.from(_currentInterests));
                  setState(() => _isEditing = false);
                } else {
                  // Show selection dialog when pencil is pressed
                  final updatedInterests = await _showInterestsDialog();
                  if (updatedInterests != null) {
                    setState(() {
                      _currentInterests = List<String>.from(updatedInterests);
                      _isEditing = true; // Enter edit mode after selection
                    });
                    widget.onInterestsUpdated(List<String>.from(updatedInterests));
                  }
                }
              },
            ),
          ],
        ),
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: _currentInterests.map((interest) {
            return Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 23,
                vertical: 6,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: AppColors.primary,
                border: Border.all(
                  color: Colors.black,
                  width: 1,         
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    interest,
                    style: const TextStyle(
                      fontSize: 14,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                  if (_isEditing) ...[
                    const SizedBox(width: 4),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _currentInterests.remove(interest);
                        });
                        widget.onInterestsUpdated(List<String>.from(_currentInterests));
                      },
                      child: const Icon(
                        Icons.close,
                        size: 16,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ],
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}