import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:stem_vault/Core/appColors.dart';
import 'package:stem_vault/Core/apptext.dart';

import 'achievement_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            width: double.infinity,
            height: 180,
            color: AppColors.bgColor,
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Hi, Fahad",
                  style: AppText.mainHeadingTextStyle().copyWith(
                    color: AppColors.theme,
                  ),
                ),
                const SizedBox(height: 3),
                Padding(
                  padding: const EdgeInsets.only(left: 3.0),
                  child: Text(
                    "Student",
                    style: AppText.mainSubHeadingTextStyle().copyWith(
                      color: AppColors.theme,
                    ),
                  ),
                ),
              ],
            ),
          ),

          /// Avatars at Top Right
          Positioned(
            top: 50,
            right: 10,
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(context, PageTransition(
                      child: AchievementScreen(),
                      type: PageTransitionType.rightToLeft
                    ));
                  },
                  child: CircleAvatar(
                    radius: 18,
                    backgroundColor: AppColors.theme,
                    backgroundImage: const AssetImage("assets/Images/Awards.png"),
                  ),
                ),

                const SizedBox(width: 15),
                CircleAvatar(
                  radius: 18,
                  backgroundColor: AppColors.theme,
                  backgroundImage: const AssetImage("assets/Images/User.png"),
                ),
              ],
            ),
          ),

          /// Learning Progress Card with Button
          Positioned(
            top: 130,
            left: MediaQuery.of(context).size.width * 0.075,
            child: Container(
              width: MediaQuery.of(context).size.width * 0.85,
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppColors.theme,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10,
                    spreadRadius: 2,
                    offset: Offset(0, 3),
                  )
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Learned Today", style: AppText.hintTextStyle()),

                      const SizedBox(height: 5),

                      RichText(
                        text: TextSpan(
                          text: "0",
                          style: AppText.mainHeadingTextStyle(),
                          children: [
                            TextSpan(
                              text: "/60min",
                              style: AppText.hintTextStyle(),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 5),

                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: LinearProgressIndicator(
                          value: 0.0, // 60% progress
                          backgroundColor: Colors.grey[300],
                          valueColor: AlwaysStoppedAnimation<Color>(Colors.orange),
                        ),
                      ),
                    ],
                  ),

                  /// Right Side (Button)
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.bgColor,
                      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text("My Courses",style: AppText.buttonTextStyle().copyWith(
                      color: AppColors.theme
                    ),),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 250,
            left: MediaQuery.of(context).size.width * 0.075,
            child: SizedBox(
              height: 155,
              width: MediaQuery.of(context).size.width * 0.85,
              child: Card(
                elevation: 1,
                color: Color(0xffCEECFE),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text("What do you want to learn today ?",style: AppText.mainSubHeadingTextStyle().copyWith(
                        fontWeight: FontWeight.bold
                      ),),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 50.0,left: 10),
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.bgColor,
                              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: Text("Get Started",style: AppText.buttonTextStyle().copyWith(
                                color: AppColors.theme
                            ),),
                          ),
                        ),
                        CircleAvatar(
                          backgroundImage: AssetImage("assets/Images/Page3.png"),
                          radius: 50,
                        ),
                      ],
                    ),

                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 420,
              left: MediaQuery.of(context).size.width * 0.085,
              child: Text("Learning Plan"
                ,style: AppText.mainHeadingTextStyle().copyWith(
                  fontSize: 18
                ),)
          ),
          Positioned(
            top: 450,
            left: MediaQuery.of(context).size.width * 0.075,
            child: SizedBox(
              height: 120,
              width: MediaQuery.of(context).size.width * 0.85,
              child: Card(
                elevation: 1,
                color: Color(0xffCEECFE),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Center(
                        child: SizedBox(
                          height: 80,
                          width: MediaQuery.of(context).size.width * 0.75,
                          child: Text("Explore STEM courses, track progress, and master skills. Start innovating today!"
                            ,style: AppText.mainSubHeadingTextStyle().copyWith(
                              fontWeight: FontWeight.w600
                          ),),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 590,
            left: MediaQuery.of(context).size.width * 0.075,
            child: SizedBox(
              height: 130,
              width: MediaQuery.of(context).size.width * 0.85,
              child: Card(
                elevation: 1,
                color: AppColors.bgColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(" The STEM Vault"
                      ,style: AppText.mainHeadingTextStyle().copyWith(
                          fontSize: 23,
                          fontWeight: FontWeight.w600,
                          color: AppColors.theme
                      ),),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: SizedBox(
                            height: 70,
                            width: 200,
                            child: Text("Unlocking Knowledge, Powering Innovation!"
                              ,style: AppText.mainSubHeadingTextStyle().copyWith(
                                  fontSize: 12
                              ),),
                          ),
                        ),
                        Spacer(),
                        Padding(
                          padding: const EdgeInsets.only(right:8.0,bottom: 10),
                          child: Container(
                            height: 75,
                            width: 75,
                            decoration: BoxDecoration(
                                color: AppColors.theme.withOpacity(0.56),
                                shape: BoxShape.circle
                            ),
                            child: Center(
                              child:  Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                    color: AppColors.theme.withOpacity(0.8),
                                    shape: BoxShape.circle
                                ),
                                child:   Center(
                                  child: Container(
                                    height: 25,
                                    width: 25,
                                    decoration: BoxDecoration(
                                        color: AppColors.theme.withOpacity(1),
                                        shape: BoxShape.circle
                                    ),
                                    child: Center(
                                        child: CircleAvatar(
                                          radius: 30,
                                          backgroundColor: AppColors.theme,
                                          backgroundImage: AssetImage("assets/Images/Page2.png"),
                                        )),
                                  ),
                                ),
                              ),
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
}
