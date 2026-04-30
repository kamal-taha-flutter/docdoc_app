import 'package:docdoc_app/core/theme/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

class DocLogoAndText extends StatelessWidget {
  const DocLogoAndText({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset('assets/svgs/docdoc_logo.svg'),
        Gap(10.w),
        Text("Docdoc",style: TextStyles.font24Black700Weight,)
      ],
    );
  }
}