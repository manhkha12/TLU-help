import 'package:flutter/material.dart';
import 'package:tlu_students/features/home_page/home_page_footer.dart';
import 'package:tlu_students/features/home_page/home_page_header.dart';
import 'package:tlu_students/shared/extensions/extensions.dart';
import 'package:tlu_students/shared/widgets/app_layout.dart';

class HomePageScreen extends StatelessWidget {
  const HomePageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppLayout(
        child: SafeArea(
            child: SingleChildScrollView(
      child: Column(
        children: [
          const HomePageHeader(),
          Divider(
            color: context.colors.divider,
            height: 1,
          ),
          HomePageFooter(),
        ],
      ),
    )));
  }
}
