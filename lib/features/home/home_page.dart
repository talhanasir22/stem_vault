import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stem_vault/Core/appColors.dart';
import 'package:stem_vault/Core/apptext.dart';

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
          /// Background Container (Blue)
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
                CircleAvatar(
                  radius: 18,
                  backgroundColor: AppColors.theme,
                  backgroundImage: const AssetImage("assets/Images/Awards.png"),
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
                          text: "46min",
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
                          value: 0.6, // 60% progress
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
        ],
      ),
    );
  }
}
