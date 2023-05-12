import 'package:flutter/material.dart';
import 'package:mysite/app/sections/callrequest/callrequest_desktop.dart';

import 'package:mysite/core/res/responsive.dart';

class CallRequest extends StatelessWidget {
  const CallRequest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Responsive(
      mobile: Container(),
      tablet: Container(),
      desktop: const CallrequestDesktop(),
    );
  }
}
