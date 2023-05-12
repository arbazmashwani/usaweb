import 'package:flutter/material.dart';
import 'package:mysite/app/sections/experienced/experiencedesktop.dart';
import 'package:mysite/app/sections/reviews/reviewsdesktop.dart';

import 'package:mysite/core/res/responsive.dart';

class ReviewsPage extends StatelessWidget {
  const ReviewsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Responsive(
      mobile: Container(),
      tablet: Container(),
      desktop: const ReviewsDesktop(),
    );
  }
}
