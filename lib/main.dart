import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_manager/constants/asset_path.dart';
import 'package:task_manager/constants/color_constants.dart';
import 'package:task_manager/constants/text_constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return const MaterialApp(
            debugShowCheckedModeBanner: false,
            home: SplashScreen(),
          );
        });
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 5), () {
      // Navigator.pushReplacement(
      //     context, MaterialPageRoute(builder: (context) =>const OnboardingScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(color: whiteText),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 100.sp,
              width: 100.sp,
              decoration: BoxDecoration(
                color: deathVictorious,
                borderRadius: BorderRadius.circular(100.sp),
              ),
              child: Icon(
                Icons.done_sharp,
                size: 50.sp,
                color: greenTeal,
              ),
            ),
            SizedBox(
              height: 10.sp,
            ),
            Text(
              TaskManagerText.taskmanager,
                style: TextStyle(
                  fontSize: 25.sp,
                  fontWeight: FontWeight.w800,
                  color: blackOut,
                  fontFamily: DoctorHuntAssetsPath.doctorHuntFont,
                ),
                textAlign: TextAlign.center),
           ],
        ),
      ),
    );
  }
}
