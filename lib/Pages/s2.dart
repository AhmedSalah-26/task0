import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Providers/SignupData.dart';
import '../UI_Components/CustomTextField.dart';
import '../UI_Components/DateTextField.dart';
import '../Const/assests.dart';

class S2 extends StatefulWidget {
  @override
  State<S2> createState() => _ShoeAppSignInPageState();
}

class _ShoeAppSignInPageState extends State<S2> {
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
    final data = Provider.of<s2_data>(context, listen: false);
     if(!data.phoneNumberController.text.isEmpty||!data.dateController.text.isEmpty||!data.addressController.text.isEmpty){
      data.validateAddress(data.addressController.text);
      data.validatePhoneNumber(data.phoneNumberController.text);


      data.isFormValid = data.formKey.currentState!.validate() ;
    }

  }
  @override
  Widget build(BuildContext context) {
    final data = Provider.of<s2_data>(context);

    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: data.formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 240),
              MyTextField(
                onChanged: (value) {
                  data.isFormValid = data.formKey.currentState!.validate();
                },
                iconColor: AppColors.kLavender,
                controller: data.phoneNumberController,
                keyboardType: TextInputType.number,
                icon: AppAssets.kUser,
                hintText: 'Phone number',
                validator: data.validatePhoneNumber,
              ),
              const SizedBox(height: 25),
              MyDateField(
                onChanged: (value) {
                  // Assuming 'data' is an instance of the class where this widget is used.
                  data.validate(value);
                  data.isFormValid = data.formKey.currentState!.validate();
                },
                validator: (value) {
                  // Assuming 'data' is an instance of the class where this widget is used.
                  return data.validate(value);
                },
                iconColor: AppColors.kLavender,
                controller: data.dateController,
                keyboardType: TextInputType.datetime,
                icon: AppAssets.Date,
                hintText: 'Date Time',
              ),


              const SizedBox(height: 25),
              MyTextField(
                onChanged: (value) {
                  data.isFormValid = data.formKey.currentState!.validate();
                },
                iconColor: AppColors.kLavender,
                controller: data.addressController,
                keyboardType: TextInputType.text,
                icon: AppAssets.PhoneNumber,
                hintText: 'Address',
                validator: data.validateAddress,
              ),
              const SizedBox(height: 25),
              // Add a button or any other UI element that needs to be enabled
              // only when the form is valid
            ],
          ),
        ),
      ),
    );
  }
}
