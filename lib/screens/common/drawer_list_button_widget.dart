/*External dependencies */
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class DrawerListButtonWidget extends StatelessWidget {
  final String btnText;
  final VoidCallback? onPressed;

  const DrawerListButtonWidget({
    super.key,
    required this.btnText,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text(btnText,
            style: GoogleFonts.inter(
              textStyle: TextStyle(
                color: Colors.white,
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
              ),
            )),
        // SizedBox(width: 50.w),
        const Icon(
          Icons.arrow_forward,
          size: 20,
          color: Colors.white70,
        )
      ]),
    );
  }
}
