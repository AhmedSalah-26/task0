import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_onboarding_slider/background_final_button.dart';
import 'package:flutter_onboarding_slider/flutter_onboarding_slider.dart';
import 'package:provider/provider.dart';
import 'package:your_project_name/Pages/s1.dart';
import 'package:your_project_name/Pages/s2.dart';
import 'package:your_project_name/Pages/s3.dart';
import '../Providers/SignupData.dart';


class SignUp extends StatefulWidget {
  @override
  _OnBoardingState createState() => _OnBoardingState();
}

class _OnBoardingState extends State<SignUp> {
  final Color kDarkBlueColor = const Color(0xFF053149);
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final data1 = Provider.of<s1_data>(context);
    final data2 = Provider.of<s2_data>(context);
    final data3 = Provider.of<s3_data>(context);

    return OnBoardingSlider(
      hasFloatingButton: true,
      finishButtonText: '     Sign up    ',
      onFinish: () {
        if (data1.isFormValid && data2.isFormValid && data3.isFormValid) {
          Navigator.push(
            context,
            CupertinoPageRoute(
              builder: (context) => Container(),
            ),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("Please add valid inputs"),
              duration: Duration(seconds: 3),
            ),
          );
        }
      },

      finishButtonStyle: FinishButtonStyle(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        backgroundColor: Colors.orange.shade800,
      ),
      controllerColor: Colors.orangeAccent,
      totalPage: 3,
      headerBackgroundColor: Colors.white,
      background: [
        Container(),
        Container(),
        Container(),
      ],
      speed: 1.8,
      pageBodies: [
        Container(
          child: S1(),
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.symmetric(horizontal: 20),
        ),
        Container(
          child: S2(),
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.symmetric(horizontal: 20),
        ),
        Container(
          child: S3(),
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.symmetric(horizontal: 20),
        ),
      ],
    );
  }
}
