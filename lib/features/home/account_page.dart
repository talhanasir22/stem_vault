import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:stem_vault/Core/appColors.dart';
import 'package:stem_vault/Core/apptext.dart';
import 'package:stem_vault/features/home/Account%20Screens/Edit_profile_screen.dart';
import 'package:stem_vault/features/home/Account%20Screens/assignment_screen.dart';
import 'package:stem_vault/features/home/Account%20Screens/grade_screen.dart';
import 'package:stem_vault/features/home/Account%20Screens/notification_setting_screen.dart';
import 'package:stem_vault/features/home/Account%20Screens/submission%20_screen.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Account", style: AppText.mainHeadingTextStyle()),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              title: Text(
                "Hi, Fahad",
                style: AppText.mainHeadingTextStyle().copyWith(
                  color: AppColors.bgColor,
                ),
              ),
              subtitle: Text(
                "Student",
                style: AppText.mainSubHeadingTextStyle().copyWith(
                  color: AppColors.bgColor,
                ),
              ),
              trailing: Icon(
                Icons.person,
                size: 50,
                color: Colors.blue.shade900,
              ),
            ),
            SizedBox(height: 10,),
            Center(
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.89,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.bgColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "View Progress",
                        style: AppText.mainHeadingTextStyle().copyWith(
                          color: AppColors.theme,
                          fontSize: 20,
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: AppColors.theme,
                        size: 20,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
        
            /// User-friendly prioritized buttons
            _buildTextButton("Edit Profile",(){
              Navigator.push(
                context,
                PageTransition(
                  type: PageTransitionType.rightToLeft,
                  child: EditProfileScreen(),
                ),
              );
            }),
            _buildTextButton("Change Notification Settings",(){
              Navigator.push(
                context,
                PageTransition(
                  type: PageTransitionType.rightToLeft,
                  child: NotificationSettingScreen(),
                ),
              );
            }),
            _buildTextButton("Due Assignments",(){
              Navigator.push(
                context,
                PageTransition(
                  type: PageTransitionType.rightToLeft,
                  child: AssignmentScreen(),
                ),
              );
            }),
            _buildTextButton("Submissions",(){
              Navigator.push(
                context,
                PageTransition(
                  type: PageTransitionType.rightToLeft,
                  child: SubmissionScreen(),
                ),
              );
            }),
            _buildTextButton("Grades",(){
              Navigator.push(
                context,
                PageTransition(
                  type: PageTransitionType.rightToLeft,
                  child: GradeScreen(),
                ),
              );
            }),
            _buildTextButton("Help",(){}),
            _buildTextButton("Customer Support",(){}),_buildTextButton("Logout", () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text("Confirm Logout"),
                  content: Text("Are you sure you want to log out?"),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text("Cancel"),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                        Navigator.pop(context);
                      },
                      child: Text("Logout"),
                    ),
                  ],
                ),
              );
            }),

          ],
        ),
      ),
    );
  }

  Widget _buildTextButton(String text, VoidCallback onPressed) {
    return TextButton(
      onPressed: onPressed, // Now takes a custom function
      style: TextButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 20),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: AppText.mainSubHeadingTextStyle().copyWith(
              fontSize: 16,
            ),
          ),
          const Icon(
            Icons.arrow_forward_ios,
            size: 20,
            color: Colors.grey,
          ),
        ],
      ),
    );
  }

}
