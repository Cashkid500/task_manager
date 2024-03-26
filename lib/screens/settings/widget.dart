import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Dividing extends StatelessWidget {
  const Dividing({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.sp,
      width: 310.sp,
      child: Divider(
        color: Colors.grey,
        thickness: 1.5.sp,
      ),
    );
  }
}