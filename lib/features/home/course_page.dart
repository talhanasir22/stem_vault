import 'package:flutter/material.dart';
import 'package:stem_vault/Core/appColors.dart';
import 'package:stem_vault/Core/apptext.dart';

class CoursePage extends StatefulWidget {
  const CoursePage({super.key});

  @override
  State<CoursePage> createState() => _CoursePageState();
}

class _CoursePageState extends State<CoursePage> {
  String? selectedCategory;
  String? selectedDuration;

  final List<String> categories = [
    "SCIENCE",
    "TECHNOLOGY",
    "ENGINEERING",
    "MATHEMATICS"
  ];

  final List<String> durations = [
    "3-8 Hours",
    "8-14 Hours",
    "14-20 Hours",
    "20-24 Hours",
    "24-30 Hours"
  ];

  void _showFilterBottomSheet() {
    showModalBottomSheet(
      context: context,
      backgroundColor: AppColors.bgColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) {
        return StatefulBuilder( // Maintains state when reopened
          builder: (context, setModalState) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                  spacing: 5,
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Text(
                        "Search Filter",
                        style: AppText.mainHeadingTextStyle().copyWith(
                          fontWeight: FontWeight.w400,
                          fontSize: 22
                        )
                            .copyWith(color: AppColors.theme),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      "Categories",
                      style: AppText.mainHeadingTextStyle().copyWith(
                        color: AppColors.theme,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Wrap(
                      spacing: 12,
                      runSpacing: 8,
                      children: categories.map((category) {
                        bool isSelected = category == selectedCategory;
                        return GestureDetector(
                          onTap: () {
                            setModalState(() {
                              selectedCategory =
                              isSelected ? null : category; // Toggle selection
                            });
                          },
                          child: Container(
                            padding:
                            EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                            decoration: BoxDecoration(
                              color: isSelected ? Colors.black : Colors.white,
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: AppColors.bgColor),
                            ),
                            child: Text(
                              category,
                              style: TextStyle(
                                color:
                                isSelected ? AppColors.bgColor : Colors.black,
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      "Duration",
                      style: AppText.mainHeadingTextStyle().copyWith(
                        color: AppColors.theme,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Wrap(
                      spacing: 12,
                      runSpacing: 8,
                      children: durations.map((duration) {
                        bool isSelected = duration == selectedDuration;
                        return GestureDetector(
                          onTap: () {
                            setModalState(() {
                              selectedDuration =
                              isSelected ? null : duration; // Toggle selection
                            });
                          },
                          child: Container(
                            padding:
                            EdgeInsets.symmetric(vertical: 6, horizontal: 12),
                            decoration: BoxDecoration(
                              color: isSelected ? Colors.black : Colors.white,
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: AppColors.bgColor),
                            ),
                            child: Text(
                              duration,
                              style: TextStyle(
                                color:
                                isSelected ? AppColors.bgColor : Colors.black,
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                    const SizedBox(height: 50),
                    Row(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.24,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context); // Close the modal
                            },
                            style: ElevatedButton.styleFrom(
                              side: BorderSide(
                                width: 1
                              ),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                              backgroundColor: AppColors.bgColor,
                            ),
                            child: Text("Clear",
                            style: TextStyle(color: Colors.black),),
                          ),
                        ),
                        SizedBox(width: 20,),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.50,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context); // Close the modal
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.black,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                            ),
                            child: Text("Apply Filter",
                            style: TextStyle(color: AppColors.bgColor),),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "Choose Your Course",
          style: AppText.mainHeadingTextStyle(),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.90,
                height: 40,
                child: TextField(
                  style: TextStyle(fontSize: 14),
                  textAlignVertical: TextAlignVertical.center,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 10),
                    hintText: "Find Course",
                    hintStyle: AppText.hintTextStyle(),
                    prefixIcon: Icon(Icons.search, color: AppColors.hintIconColor),
                    suffixIcon: IconButton(
                      onPressed: _showFilterBottomSheet,
                      icon: Icon(Icons.tune_rounded, color: AppColors.hintIconColor),
                    ),
                    filled: true,
                    fillColor: AppColors.textFieldColor,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
