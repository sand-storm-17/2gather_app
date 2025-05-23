import 'package:flutter/material.dart';
import 'package:gather/constants/assets.dart';
import 'package:gather/theme/app_colors.dart';
import 'package:gather/theme/app_theme.dart';

class CreateActivity extends StatefulWidget {
  const CreateActivity({super.key});

  @override
  State<StatefulWidget> createState() => _CreateActivityState();
}

class _CreateActivityState extends State<CreateActivity> {
  final _formGlobalKey = GlobalKey<FormState>();
  late final List<String> _tags = ['Tag 1', 'Tag 2', 'Tag 3', 'Tag 4'];
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _timeController = TextEditingController();
  List<bool> get _isSelected => List.filled(_tags.length, false);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.primary,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Center(
              child: Text("Create Event", style: AppTheme.headLineLarge24),
            ),
            backgroundColor: AppColors.primary,
          ),
          backgroundColor: AppColors.primaryLight,
          body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Scrollbar(
              thickness: 5,
              radius: Radius.circular(40),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: SafeArea(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 20,
                      children: [
                        Form(
                          key: _formGlobalKey,
                          child: Column(
                            spacing: 20,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Event Name
                              Text(
                                "Event Details",
                                style: AppTheme.bodyLargeBold,
                              ),
                              Column(
                                spacing: 5,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Event Name",
                                    style: AppTheme.bodyMediumBold,
                                  ),
                                  TextFormField(
                                    decoration: InputDecoration(
                                      hintText: 'Enter event name',
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(10.00),
                                        ),
                                        borderSide: BorderSide.none,
                                      ),
                                      contentPadding: EdgeInsets.all(8),
                                      filled: true,
                                      fillColor: AppColors.white,
                                    ),
                                  ),
                                ],
                              ),
                              //Description
                              Column(
                                spacing: 5,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Description",
                                    style: AppTheme.bodyMediumBold,
                                  ),
                                  TextFormField(
                                    decoration: InputDecoration(
                                      hintText: 'Description',
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(10.00),
                                        ),
                                        borderSide: BorderSide.none,
                                      ),
                                      contentPadding: EdgeInsets.all(8),
                                      filled: true,
                                      fillColor: AppColors.white,
                                    ),
                                    minLines: 10,
                                    maxLines: 20,
                                    maxLength: 2000,
                                  ),
                                ],
                              ),
                              //Category
                              Column(
                                spacing: 5,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Category",
                                    style: AppTheme.bodyMediumBold,
                                  ),
                                  DropdownButtonFormField(
                                    decoration: const InputDecoration(
                                      hintText: 'Select a Category',
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(10.00),
                                        ),
                                        borderSide: BorderSide.none,
                                      ),
                                      contentPadding: EdgeInsets.all(8),
                                      filled: true,
                                      fillColor: AppColors.white,
                                    ),
                                    items: [
                                      DropdownMenuItem(
                                        value: 1,
                                        child: Text("Social"),
                                      ),
                                      DropdownMenuItem(
                                        value: 2,
                                        child: Text("Fitness and Wellness"),
                                      ),
                                      DropdownMenuItem(
                                        value: 3,
                                        child: Text("Community Discussion"),
                                      ),
                                    ],
                                    onChanged: (Object? value) {},
                                  ),
                                ],
                              ),
                              //Tags
                              Column(
                                spacing: 5,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Tags", style: AppTheme.bodyMediumBold),
                                  TextFormField(
                                    decoration: const InputDecoration(
                                      hintText: 'Add a Custom Tag',
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(10.00),
                                        ),
                                        borderSide: BorderSide.none,
                                      ),
                                      contentPadding: EdgeInsets.all(8),
                                      filled: true,
                                      fillColor: AppColors.white,
                                    ),
                                  ),
                                  ToggleButtons(
                                    isSelected: _isSelected,
                                    fillColor: Colors.blue[50],
                                    color: Colors.black,
                                    selectedColor: Colors.white,
                                    selectedBorderColor: Colors.blue,
                                    borderColor: Colors.grey,
                                    onPressed: (int index) {
                                      setState(() {
                                        _isSelected[index] =
                                            !_isSelected[index];
                                      });
                                    },
                                    children:
                                        _tags
                                            .map(
                                              (tag) => Chip(label: Text(tag)),
                                            )
                                            .toList(),
                                  ),
                                ],
                              ),

                              //Location & Time
                              Text(
                                "Location & Time",
                                style: AppTheme.bodyLargeBold,
                              ),
                              //Location
                              Column(
                                spacing: 5,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Location",
                                    style: AppTheme.bodyMediumBold,
                                  ),
                                  TextFormField(
                                    decoration: const InputDecoration(
                                      hintText: 'Select Location',
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(10.00),
                                        ),
                                        borderSide: BorderSide.none,
                                      ),
                                      contentPadding: EdgeInsets.all(8),
                                      filled: true,
                                      fillColor: AppColors.white,
                                    ),
                                  ),
                                  // Container(
                                  //   child: Image(image: AssetImage("assets/map.png")),
                                  // ),
                                ],
                              ),
                              //Current Location
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                spacing: 10,
                                children: [
                                  Expanded(
                                    child: Column(
                                      spacing: 5,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Start Date",
                                          style: AppTheme.bodyMediumBold,
                                        ),
                                        TextFormField(
                                          controller: _dateController,
                                          decoration: const InputDecoration(
                                            hintText: 'Start Date',
                                            border: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(10.00),
                                              ),
                                              borderSide: BorderSide.none,
                                            ),
                                            contentPadding: EdgeInsets.all(8),
                                            filled: true,
                                            fillColor: AppColors.white,
                                          ),
                                          readOnly: true,
                                          onTap: () {
                                            _selectDate();
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                  //Start Time
                                  Expanded(
                                    child: Column(
                                      spacing: 5,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Start Time",
                                          style: AppTheme.bodyMediumBold,
                                        ),
                                        TextFormField(
                                          controller: _timeController,
                                          decoration: const InputDecoration(
                                            hintText: 'Start Time',
                                            border: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(10.00),
                                              ),
                                              borderSide: BorderSide.none,
                                            ),
                                            contentPadding: EdgeInsets.all(8),
                                            filled: true,
                                            fillColor: AppColors.white,
                                          ),
                                          readOnly: true,
                                          onTap: () {
                                            _selectTime();
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              // Participation Settings
                              Text(
                                "Participation Settings",
                                style: AppTheme.bodyLargeBold,
                              ),
                              // Max Participants
                              Column(
                                spacing: 5,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Max Participants",
                                    style: AppTheme.bodyMediumBold,
                                  ),
                                  TextFormField(
                                    decoration: const InputDecoration(
                                      hintText: 'Enter Number',
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(10.00),
                                        ),
                                        borderSide: BorderSide.none,
                                      ),
                                      contentPadding: EdgeInsets.all(8),
                                      filled: true,
                                      fillColor: AppColors.white,
                                    ),
                                  ),
                                ],
                              ),
                              //Age Group
                              Column(
                                spacing: 5,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Age Group",
                                    style: AppTheme.bodyMediumBold,
                                  ),
                                  DropdownButtonFormField(
                                    decoration: const InputDecoration(
                                      hintText: 'Select Age Group',
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(10.00),
                                        ),
                                        borderSide: BorderSide.none,
                                      ),
                                      contentPadding: EdgeInsets.all(8),
                                      filled: true,
                                      fillColor: AppColors.white,
                                    ),
                                    items: [
                                      DropdownMenuItem(
                                        value: 1,
                                        child: Text("8-12"),
                                      ),
                                      DropdownMenuItem(
                                        value: 2,
                                        child: Text("12-18"),
                                      ),
                                      DropdownMenuItem(
                                        value: 3,
                                        child: Text("18-28"),
                                      ),
                                    ],
                                    onChanged: (Object? value) {},
                                  ),
                                ],
                              ),
                              // Privacy
                              Column(
                                spacing: 5,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Privacy",
                                    style: AppTheme.bodyMediumBold,
                                  ),
                                  Column(
                                    children: [
                                      RadioListTile(
                                        title: Text(
                                          'Public - Anyone can join',
                                          style: AppTheme.bodySmall,
                                        ),
                                        contentPadding: EdgeInsets.zero,
                                        radioScaleFactor: 0.8,
                                        groupValue: 1,
                                        value: false,
                                        onChanged: (value) {},
                                      ),
                                      RadioListTile(
                                        title: Text(
                                          'Private - Invite Only',
                                          style: AppTheme.bodySmall,
                                        ),
                                        contentPadding: EdgeInsets.zero,
                                        radioScaleFactor: 0.8,
                                        groupValue: 1,
                                        value: false,
                                        onChanged: (value) {},
                                      ),
                                      RadioListTile(
                                        title: Text(
                                          'Restricted - Approval Required',
                                          style: AppTheme.bodySmall,
                                        ),
                                        contentPadding: EdgeInsets.zero,
                                        radioScaleFactor: 0.8,
                                        groupValue: 1,
                                        value: false,
                                        onChanged: (value) {},
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              //Event Image
                              Column(
                                spacing: 5,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Event Image",
                                    style: AppTheme.bodyMediumBold,
                                  ),
                                  TextFormField(
                                    decoration: const InputDecoration(
                                      hintText: 'Select an Image',
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(10.00),
                                        ),
                                        borderSide: BorderSide.none,
                                      ),
                                      contentPadding: EdgeInsets.all(8),
                                      filled: true,
                                      fillColor: AppColors.white,
                                    ),
                                  ),
                                ],
                              ),
                              //Additional Settings
                              Column(
                                spacing: 5,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Additional Settings",
                                    style: AppTheme.bodyLargeBold,
                                  ),
                                  //Enable Chat Group
                                  CheckboxListTile(
                                    title: Text(
                                      "Enable Chat Group",
                                      style: AppTheme.bodyMedium,
                                    ),
                                    value: false,
                                    onChanged: (value) {},
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.min,

                                children: [
                                  // Expanded(
                                  //   child: OutlinedButton(
                                  //     onPressed: () {},
                                  //     style: ButtonStyle(
                                  //       backgroundColor: WidgetStatePropertyAll(
                                  //         AppColors.hinttextcolor,
                                  //       ),
                                  //       shape: WidgetStateProperty.all(
                                  //         RoundedRectangleBorder(
                                  //           borderRadius: BorderRadius.circular(
                                  //             10,
                                  //           ),
                                  //           side: BorderSide.none
                                  //         ),
                                  //       ),
                                  //     ),
                                  //     child: Text(
                                  //       "Cancel",
                                  //       style:  AppTheme.bodyMediumBold.copyWith(color: AppColors.black),
                                  //     ),
                                  //   ),
                                  // ),
                                  // Expanded(
                                  //   child: OutlinedButton(
                                  //     onPressed: () {},
                                  //     style: ButtonStyle(
                                  //       backgroundColor: WidgetStatePropertyAll(
                                  //         AppColors.white,
                                  //       ),
                                  //       shape: WidgetStateProperty.all(
                                  //         RoundedRectangleBorder(
                                  //           borderRadius: BorderRadius.circular(
                                  //             10,
                                  //           ),
                                  //         ),
                                  //       ),
                                  //     ),
                                  //     child: Text(
                                  //       "Preview",
                                  //       style: AppTheme.bodyMediumBold.copyWith(color: AppColors.secondary),
                                  //     ),
                                  //   ),
                                  // ),
                                  Center(
                                    child: OutlinedButton(
                                      onPressed: () {},
                                      style: ButtonStyle(
                                        backgroundColor: WidgetStatePropertyAll(
                                          AppColors.secondary,
                                        ),
                                        shape: WidgetStateProperty.all(
                                          RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                              10,
                                            ),
                                          ),
                                        ),
                                      ),
                                      child: Text(
                                        "Create Event",
                                        style: AppTheme.bodyMediumBold.copyWith(color: AppColors.white).copyWith(),
                                      ),
                                    ),
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
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _selectDate() async {
    DateTime? _picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (_picked != null) {
      setState(() {
        _dateController.text = _picked.toString().split(" ")[0];
      });
    }
  }

  Future<void> _selectTime() async {
    TimeOfDay? _picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      builder: (BuildContext context, Widget? child) {
        return Directionality(textDirection: TextDirection.rtl, child: child!);
      },
    );
    if (_picked != null) {
      setState(() {
        _timeController.text = _picked.format(context);
      });
    }
  }
}
