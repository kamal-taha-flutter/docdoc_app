import 'package:docdoc_app/core/di/dependancy_injection.dart';
import 'package:docdoc_app/core/routing/app_router.dart';
import 'package:docdoc_app/doc_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


void main() async{
 await setupGetIt();
 await ScreenUtil.ensureScreenSize();
  runApp(
     DocApp(appRouter: AppRouter(),));
}
