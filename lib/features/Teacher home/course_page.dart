import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shimmer/shimmer.dart';
import 'package:stem_vault/Core/appColors.dart';
import 'package:stem_vault/Core/apptext.dart';
import 'package:stem_vault/Shared/course_annoucement_banner.dart';

class CoursePage extends StatefulWidget {
  const CoursePage({super.key});

  @override
  State<CoursePage> createState() => _CoursePageState();
}

class _CoursePageState extends State<CoursePage> with SingleTickerProviderStateMixin {
  String? selectedCategory;
  String? selectedDuration;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "Tell us what do you \nwant to teach",
          style: AppText.mainHeadingTextStyle(),
        ),
      ),
      body:SingleChildScrollView(
        padding: EdgeInsets.only(left: 6.0),
        child: Column(
          spacing: 2,
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            Center(child: CourseAnnouncementBanner(bannerText: "Explore a diverse selection of STEM courses for a comprehensive learning experience.",)),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _buildLabel("Course title:"),
            ),
            _buildTextField(),
            _buildLabel("Course description"),
            _buildTextField(maxLines: 3,maxlenght: 50),

            _buildLabel("Course thumbnail:"),
            IconButton(
              icon: Icon(Icons.camera_alt, size: 30),
              onPressed: () {},
            ),

            _buildLabel("Lecture title:"),
            _buildTextField(),

            _buildLabel("Lecture number:"),
            _buildTextField(),

            _buildLabel("Add Multimedia:"),
            Row(
              children: [
                IconButton(
                  icon: Icon(Icons.videocam, size: 30),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(Icons.picture_as_pdf, size: 30),
                  onPressed: () {},
                ),
              ],
            ),
            SizedBox(height: 10,),
            Center(
              child: ElevatedButton(
                onPressed: () {

                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.bgColor,
                  padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text("Create Course",style: AppText.buttonTextStyle().copyWith(
                    color: AppColors.theme
                ),),
              ),
            ),
            SizedBox(height: 40,),
          ],
        ),
      ),
    );
  }

  Widget _buildLabel(String text) {
    return Text(
      text,
      style: AppText.mainSubHeadingTextStyle().copyWith(fontWeight: FontWeight.bold),
    );
  }

  Widget _buildTextField({int maxLines = 1,  int maxlenght = 20}) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.95,
      child: Column(
        children: [
          TextFormField(
            maxLength: maxlenght,
            maxLines: maxLines,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12)
              ),
              contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              hintText: "Enter here",
              hintStyle: AppText.hintTextStyle()
            ),
          ),
        ],
      ),
    );
  }
}
