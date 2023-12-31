
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:your_project_name/Providers/SignupData.dart';
import 'package:your_project_name/UI_Components/CustomTextField.dart';
import '../Const/assests.dart';

import '../UI_Components/PrimaryButton.dart';
import 'SignInPage.dart';

class S1 extends StatefulWidget {
  @override
  State<S1> createState() => _ShoeAppSignInPageState();
}

class _ShoeAppSignInPageState extends State<S1> {
  void initState() {
    super.initState();
    // Use WidgetsBinding to add a post-frame callback
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      // Call your validation function when the widget is initialized
      validateForm();
    });
  }

// Validation function
  void validateForm() {
    final data = Provider.of<s1_data>(context, listen: false);

    if(!data.emailController.text.isEmpty||!data.firstNameController.text.isEmpty||!data.lastNameController.text.isEmpty){

      data.validFirstname(data.firstNameController.text);
      data.validLastname(data.lastNameController.text);
      data.validEmail(data.emailController.text);

      // Set the initial form validity
      data.isFormValid = data.formKey.currentState!.validate() ;
    }

  }

  @override
  Widget build(BuildContext context) {

    final data = Provider.of<s1_data>(context);
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: data.formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            children: [
              const SizedBox(height: 156),
              const Center(
                child: Text(
                  'Sign up',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(height: 5),
              const Text(
                'Welcome  Please enter your details',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w200,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 30),
              MyTextField(
                iconColor: AppColors.kLavender,
                controller: data.firstNameController,
                keyboardType: TextInputType.text,
                icon: AppAssets.kUser,
                onChanged: (p0) {

                    data.isFormValid = data.formKey.currentState!.validate();

                },
                validator: (p0) => data.validFirstname(p0),
                hintText: 'First Name',
              ),
              const SizedBox(height: 25),
              MyTextField(
                iconColor: AppColors.kLavender,
                controller: data.lastNameController,
                keyboardType: TextInputType.text,
                icon: AppAssets.kUser,
                onChanged: (p0) {

                    data.isFormValid = data.formKey.currentState!.validate();

                },
                validator: (p0) => data.validLastname(p0),
                hintText: 'Last Name',
              ),
              const SizedBox(height: 16),
              MyTextField(
                iconColor: AppColors.kLavender,
                controller: data.emailController,
                keyboardType: TextInputType.emailAddress,
                icon: AppAssets.kMail,
                onChanged: (p0) {

                    data.isFormValid = data.formKey.currentState!.validate();

                },
                validator:(p0) => data.validEmail(p0),
                hintText: 'Email address',
              ),
              const SizedBox(height: 150),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: const Text(
                      'Already have an account:',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.orange,
                      ),
                    ),
                  ),
                  const Spacer(),
                  PrimaryButton(
                    onTap: () {
                        // Do something when the form is valid
                        // For example, navigate to the sign-in page
                        Navigator.pop(context);

                    },
                    text: 'Sign in',
                    height: 30,
                    width: 70,
                    fontColor: Colors.orange[800],
                    btnColor: AppColors.kLightWhite2,
                    fontSize: 12,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
