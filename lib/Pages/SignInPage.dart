import 'package:flutter/material.dart';
import '../UI_Components/CustomTextField.dart';
import '../UI_Components/PrimaryButton.dart';
import '../Const/assests.dart';
import 'SignUp.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _ShoeAppSignInPageState();
}

class _ShoeAppSignInPageState extends State<SignInPage> {
  bool isRemember = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _mailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _validateFirstName(String value) {
    // Additional validation logic for the first name if needed
    _formKey.currentState!.validate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const SizedBox(height: 56),
              const Center(
                child: Text(
                  'Sign In',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(height: 5),
              const Text(
                'Welcome back! Please enter your details',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w200,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 120),
              MyTextField(
                onChanged: _validateFirstName,
                iconColor: AppColors.kLavender,
                controller: _mailController,
                keyboardType: TextInputType.emailAddress,
                icon: AppAssets.kMail,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your email address';
                  } else if (!value.contains("@")) {
                    return 'Please enter a valid email address';
                  }

                  return null;
                },
                hintText: 'Email address',
              ),
              const SizedBox(height: 16),
              MyTextField(
                onChanged: _validateFirstName,
                iconColor: AppColors.kPeriwinkle,
                controller: _passwordController,
                keyboardType: TextInputType.visiblePassword,
                icon: AppAssets.kLock,
                hintText: 'Password',
              ),
              const SizedBox(height: 14),
              const SizedBox(height: 40),
              CustomTextButton(
                color: Colors.orange[800],
                onPressed: () {},
                text: 'Forgot Password',
              ),
              PrimaryButton(
                btnColor: Colors.orange[800],
                onTap: () {
                  if (_formKey.currentState!.validate()) {}
                },
                text: 'Sign In',
              ),
              const SizedBox(height: 24),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: const Text(
                      'Create account',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.orange),
                    ),
                  ),
                  const Spacer(),
                  PrimaryButton(
                    onTap: () {
                      // Navigate to the sign-up page
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignUp()),
                      );
                    },
                    text: 'Sign Up',
                    height: 30,
                    width: 70,
                    fontColor: Colors.orange[800],
                    btnColor: AppColors.kLightWhite2,
                    fontSize: 12,
                  ),
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Divider(
                        color: Colors.orange[800],
                        height: 10,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Text(
                        "  or with  ",
                        style:
                            TextStyle(color: Colors.orange[800], fontSize: 20),
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        color: Colors.orange[800],
                        height: 10,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 56),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SocialButton(onTap: () {}, icon: AppAssets.kGoogle),
                  const SizedBox(width: 31),
                  SocialButton(onTap: () {}, icon: AppAssets.kFacebook),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
