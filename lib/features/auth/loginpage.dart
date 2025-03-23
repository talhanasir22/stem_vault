import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:stem_vault/features/auth/signuppage.dart';

import '../../Core/appColors.dart';
import '../../Core/apptext.dart';
import '../../Shared/LoadingIndicator.dart';
import '../home/bottomnavbar.dart';
import '../home/role_selection_page.dart';
import 'forgotpasswordpage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isVisible = true;
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.theme,
      appBar: AppBar(
        backgroundColor: AppColors.theme,
        leading: IconButton(onPressed: (){
          Navigator.pushAndRemoveUntil(
            context,
            PageTransition(
              type: PageTransitionType.leftToRight,
              duration: Duration(milliseconds: 300),
              child: RoleSelectionPage(),
            ),
                (Route<dynamic> route) => false,
          );
        }, icon: Icon(Icons.arrow_back_ios,color: AppColors.bgColor,))
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.189,
                      child: Image.asset("assets/Images/Logo.png"),
                  ),
                ),
                Center(
                  child: Text(
                    "Sign in",
                    style: AppText.authHeadingStyle(),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 5,),
                Center(
                  child: Text(
                    "Enter your email & password to sign in",
                    style: AppText.authHeadingStyle().copyWith(
                      fontSize: 12,
                      fontWeight: FontWeight.normal
                    ),
                  ),
                ),
                SizedBox(height: 20),
                // Email Field
                SizedBox(
                  height: 40,
                  child: TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: AppColors.textFieldColor,
                      // prefixIcon: Icon(Icons.person, color: AppColors.authIconColor),
                      hintText: "email@domain.com",
                      hintStyle: AppText.hintTextStyle(),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.red),
                      ),
                    ),
                    validator: (value) => (value == null || value.isEmpty) ? 'Please enter your email' : null,
                  ),
                ),
                SizedBox(height: 13),
                SizedBox(
                  height: 40,
                  child: TextFormField(
                    obscureText: _isVisible,
                    controller: _passwordController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: AppColors.textFieldColor,
                      // prefixIcon: Icon(Icons.lock, color: AppColors.authIconColor),
                      suffixIcon: IconButton(
                        icon: Icon(_isVisible ? Icons.visibility : Icons.visibility_off,size: 18,),
                        onPressed: () => setState(() => _isVisible = !_isVisible),
                      ),
                      hintText: "Password",
                      hintStyle: AppText.hintTextStyle(),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                    ),
                    validator: (value) => (value == null || value.isEmpty) ?
                    'Please enter your password' : null,
                  ),
                ),
                SizedBox(
                  height: 32,
                  width: MediaQuery.of(context).size.width * 0.97,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: (){
                          Navigator.push(context,   PageTransition(
                            type: PageTransitionType.rightToLeft,
                            duration: Duration(milliseconds: 300),
                            child: ForgotPassword(),
                          ));
                        },
                        child: Text("Forgot Password?",
                          style: TextStyle(
                              color: Color(0xff858597),
                              fontSize: 12),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0,top: 20),
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "By proceeding, you agree to our ",
                          style: AppText.hintTextStyle().copyWith(
                              fontSize: 9
                          ),
                        ),
                        TextSpan(
                          text: "Terms of Service",
                          style: TextStyle(
                            fontSize: 9,
                            color: Colors.black,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                        TextSpan(
                          text: " and ",
                          style: AppText.hintTextStyle().copyWith(
                              fontSize: 9
                          ),
                        ),
                        TextSpan(
                          text: "Privacy Policy",
                          style: TextStyle(
                            fontSize: 9,
                            color: Colors.black,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10,),
                // Login Button
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.97,
                  height: 40,
                  child: ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        setState(() {
                          _isLoading = true;
                        });
                        await Future.delayed(Duration(seconds: 1));
                        if (mounted) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => BottomNavBar()),
                          );
                        }
                        setState(() {
                          _isLoading = false;
                        });
                      }
                    },

                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      backgroundColor: Colors.black,
                    ),
                    child: _isLoading ? LoadingIndicator() :Text("Login", style: AppText.buttonTextStyle()),
                  ),
                ),

                SizedBox(height: 40),

                // Or Continue With
                Center(child: Text("- or continue with -", style: AppText.hintTextStyle())),
                SizedBox(height: 15),
                // Social Login Icons
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        // Handle Google sign-in
                      },
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        elevation: 1,
                        shadowColor: Colors.grey,
                        child: Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Image.asset(
                            'assets/Images/google.png',
                            width: 30,
                            height: 30,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 20),
                    GestureDetector(
                      onTap: () {
                        // Handle Apple sign-in
                      },
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        elevation: 1,
                        shadowColor: Colors.grey,
                        child: Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Image.asset(
                            'assets/Images/apple.png',
                            width: 30,
                            height: 30,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 20),

                // Create Account Text
                GestureDetector(
                  onTap: (){
                    Navigator.push(
                      context,
                      PageTransition(
                        type: PageTransitionType.rightToLeft,
                        duration: const Duration(milliseconds: 300),
                        child: const SignUpPage()
                      ),
                    );
                  },
                  child: Center(
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "I don\'t have an account ",
                            style: AppText.hintTextStyle(),
                          ),
                          TextSpan(
                            text: "Sign Up",
                            style: TextStyle(
                              color: Colors.black,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
