import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import '../../Core/appColors.dart';
import '../../Core/apptext.dart';
import '../../Shared/LoadingIndicator.dart';
import 'loginpage.dart';


class SignUpPage extends StatefulWidget{
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isVisible = true;
  bool _isConfirmVisible = true;
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.theme,
      appBar: AppBar(
          backgroundColor: AppColors.theme,
          leading: IconButton(onPressed: (){
            Navigator.pop(context);
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
                    "Create an account",
                    style: AppText.authHeadingStyle(),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 5,),
                Center(
                  child: Text(
                    "Enter your email to sign up for this app",
                    style: AppText.authHeadingStyle().copyWith(
                        fontSize: 12,
                        fontWeight: FontWeight.normal
                    ),
                  ),
                ),
                SizedBox(height: 20),
                SizedBox(
                  height: 40,
                  child: TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: AppColors.textFieldColor,
                      // prefixIcon: Icon(Icons.person, color: AppColors.authIconColor),
                      hintText: "email@domain.com",
                      hintStyle: AppText.authHintTextStyle(),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
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
                      hintStyle: AppText.authHintTextStyle(),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.red),
                      ),
                    ),
                    validator: (value) => (value == null || value.isEmpty) ?
                    'Please enter your password' : null,
                  ),
                ),
                SizedBox(height: 13),
                SizedBox(
                  height: 40,
                  child: TextFormField(
                    obscureText: _isConfirmVisible,
                    controller: _confirmPasswordController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: AppColors.textFieldColor,
                      // prefixIcon: Icon(Icons.lock, color: AppColors.authIconColor),
                      suffixIcon: IconButton(
                        icon: Icon(_isConfirmVisible ? Icons.visibility : Icons.visibility_off,size: 18,),
                        onPressed: () => setState(() => _isConfirmVisible = !_isConfirmVisible),
                      ),
                      hintText: "Confirm Password",
                      hintStyle: AppText.authHintTextStyle(),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.red),
                      ),
                    ),
                    validator: (value) => (value == null || value.isEmpty) ?
                    'Please enter your password' : null,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0,top: 10),
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "By proceeding, you agree to our ",
                          style: AppText.authHintTextStyle().copyWith(
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
                          style: AppText.authHintTextStyle().copyWith(
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
                SizedBox(height: 20),

                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.97,
                  height: 40,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        setState(() {
                          _isLoading = true;
                        });
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      backgroundColor: Colors.black,
                    ),
                    child: _isLoading ? LoadingIndicator() : Text("SignUp", style: AppText.buttonTextStyle()),
                  ),
                ),

                SizedBox(height: 40),

                // Or Continue With
                Center(child: Text("- or continue with -", style: AppText.authHintTextStyle())),
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
                          borderRadius: BorderRadius.circular(12),
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
                          borderRadius: BorderRadius.circular(12),
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
                    Navigator.pushAndRemoveUntil(context,   PageTransition(
                      type: PageTransitionType.leftToRight,
                      duration: Duration(milliseconds: 300),
                      child: LoginPage(),
                    ),(Route<dynamic> route) => false);
                  },
                  child: Center(
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "Existing User? ",
                            style: AppText.authHintTextStyle(),
                          ),
                          TextSpan(
                            text: "Login now",
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}