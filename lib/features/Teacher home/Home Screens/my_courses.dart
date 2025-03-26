import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shimmer/shimmer.dart';
import 'package:stem_vault/Core/apptext.dart';
import 'package:stem_vault/Shared/course_annoucement_banner.dart';
import 'package:stem_vault/features/Teacher%20home/Home%20Screens/set_assignment.dart';
import '../../../Core/appColors.dart';
class MyCourse extends StatefulWidget {
  const MyCourse({super.key});

  @override
  State<MyCourse> createState() => _MyCourseState();
}

class _MyCourseState extends State<MyCourse> {
  bool isLoading = true; // Control shimmer loading state

  List<String> courseTitles = [
    "Game Development",
    "Flutter Basics",
    "Web Development",
    "Machine Learning",
    "Data Science"
  ];

  List<Color> cardColors = [
    Colors.blue.shade400,
    Colors.green.shade400,
    Colors.purple.shade400,
    Colors.orange.shade400,
    Colors.red.shade400,
  ];

  List<double> progressValues = [0.6, 1.0, 0.4, 0.7, 0.5];
  List<String> progressText = ["14/60", "48/60", "10/60", "60/60", "30/60"];

  @override
  void initState() {
    super.initState();
    // Simulate a network delay for shimmer effect
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        title: Text(
          "My Courses",
          style: AppText.mainHeadingTextStyle(),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 20),

          /// First Container (Shimmer Effect Applied)
          Center(
            child: isLoading
                ? _buildShimmerFirstContainer() // Show shimmer effect
                : CourseAnnouncementBanner(bannerText: "Manage courses, & assign assignments\nAll in one place.",),
          ),

          const SizedBox(height: 20),

          /// GridView (Shimmer Applied)
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 2,
                ),
                itemCount: 5,
                itemBuilder: (context, index) {
                  return isLoading
                      ? _buildShimmerGridItem()
                      : _buildGridItem(index);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// **Shimmer Effect for First Container**
  Widget _buildShimmerFirstContainer() {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        height: 100,
        width: MediaQuery.of(context).size.width * 0.85,
        decoration: BoxDecoration(
          color: AppColors.theme,
          borderRadius: BorderRadius.circular(15),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 10,
              spreadRadius: 2,
              offset: Offset(0, 3),
            )
          ],
        ),
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(height: 15, width: 100, color: Colors.white),
            const SizedBox(height: 5),
            Container(height: 20, width: 80, color: Colors.white),
            const SizedBox(height: 5),
            Container(height: 8, width: double.infinity, color: Colors.white),
          ],
        ),
      ),
    );
  }

  /// **Shimmer Effect for Grid Items**
  Widget _buildShimmerGridItem() {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Card(
        elevation: 10,
        shadowColor: Colors.black,
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(height: 20, width: 120, color: Colors.white),
              Container(height: 8, width: double.infinity, color: Colors.white),
              Container(height: 15, width: 80, color: Colors.white),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(height: 20, width: 50, color: Colors.white),
                  Icon(Icons.play_circle, size: 40, color: Colors.white),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// **Actual Grid Items**
  Widget _buildGridItem(int index) {
    return Card(
      elevation: 10,
      shadowColor: Colors.black,
      color: cardColors[index],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                courseTitles[index],
                style: AppText.mainHeadingTextStyle().copyWith(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
            ),
           Row(
             mainAxisAlignment: MainAxisAlignment.spaceAround,
             children: [
               SizedBox(
                 height: 75,
                 width: 95,
                 child: Card(
                   elevation: 10,
                   color: AppColors.bgColor,
                   child: Column(
                     mainAxisAlignment: MainAxisAlignment.spaceAround,
                     children: [
                       Padding(
                         padding: const EdgeInsets.only(left: 8.0),
                         child: Text("Student Enrolled",style: AppText.mainSubHeadingTextStyle().copyWith(
                           fontWeight: FontWeight.bold,
                             color: AppColors.theme),),
                       ),
                       Center(child: Text("3",style: AppText.mainSubHeadingTextStyle().copyWith(
                           fontWeight: FontWeight.bold,
                           color: AppColors.theme),))
                     ],
                   ),

                 ),
               ),
               SizedBox(
                 height: 75,
                 width: 95,
                 child: Card(
                   elevation: 10,
                   color: AppColors.bgColor,
                   child: Column(
                     mainAxisAlignment: MainAxisAlignment.spaceAround,
                     children: [
                       Padding(
                         padding: const EdgeInsets.only(left: 8.0),
                         child: Text("Edit your course",style: AppText.mainSubHeadingTextStyle().copyWith(
                             fontWeight: FontWeight.bold,
                             color: AppColors.theme),),
                       ),
                       Center(child:Icon(Icons.settings,color: AppColors.theme,)),
                     ],
                   ),

                 ),
               ),
               GestureDetector(
                 onTap: (){
                   Navigator.push(context,
                   PageTransition(
                     child: SetAssignment(),
                     type: PageTransitionType.rightToLeft
                   )
                   );
                 },
                 child: SizedBox(
                   height: 75,
                   width: 95,
                   child: Card(
                     elevation: 10,
                     color: AppColors.bgColor,
                     child: Column(
                       mainAxisAlignment: MainAxisAlignment.spaceAround,
                       children: [
                         Padding(
                           padding: const EdgeInsets.only(left: 2.0,right: 2),
                           child: Text("       Set\nAssignment",style: AppText.mainSubHeadingTextStyle().copyWith(
                             fontSize: 12,
                               fontWeight: FontWeight.bold,
                               color: AppColors.theme),),
                         ),
                         Center(child: Icon(Icons.menu_book,color: AppColors.theme,))
                       ],
                     ),

                   ),
                 ),
               ),
             ],
           ),
          ],
        ),
      ),
    );

  }
}
