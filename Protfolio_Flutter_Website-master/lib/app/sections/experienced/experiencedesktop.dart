import 'package:flutter/material.dart';

class ExperienceDesktop extends StatelessWidget {
  const ExperienceDesktop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Container(
          height: 0,
          color: Colors.white,
          child: Row(
            children: [
              Expanded(
                  child: Container(
                child: Image.asset("assets/imgs/btc2.png"),
              )),
              Expanded(
                  child: Container(
                child: Image.asset("assets/imgs/cryp.png"),
              )),
              Expanded(
                  child: Container(
                child: Image.asset("assets/imgs/chain.png"),
              )),
              Expanded(
                  child: Container(
                child: Image.asset("assets/imgs/forex2.png"),
              )),
            ],
          )),
    );
  }
}
