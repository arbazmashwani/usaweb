part of 'services.dart';

List<String> basiclist = [
  "Receive all our premium signals",
  "receive signals to your phone using our app",
  "Weekly market forecast where Alec Markarian breaks down how and what is behind the markets moving the prior week and provides a forecast for the week upcoming with potential trade setups every Sunday, with visual charts"
];

List<bool> boolhoverlist = List.generate(3, (index) => false);

List<String> marketsavant = [
  "Alec Markarian help and Guide you in your Trading Journey, Chat Queries",
  "Receive all our premium signals",
  "receive signals to your phone using our app",
  "Full breakdowns and journal of each trade with pictures and descriptors taking you through the full phycology of the trader Alec Markarian, along with a Market Analysis every morning with potential trade setups to look out for",
  "access to all educational content that is updated regularly and made by Alec Markarian exclusively for TradeX",
  "1 on 1 mentorship and messaging with Alec Markarian ask questions about your trades at any time and 1 hour of on the phone time per week"
];

List<String> marketscholarlist = [
  "Receive all our premium signals",
  "receive signals to your phone using our app",
  "Full breakdowns and journal of each trade with pictures and descriptors taking you through the full phycology of the trader Alec Markarian, along with a Market Analysis every morning with potential trade setups to look out for",
  "Daily Market Forecasts by Alec Markarian going deep into the markets on a daily basis and looking at past price action and forecasting future daily moves and providing visual charts for potential trade setups to look out for",
  "Access to the 'Becoming Market Savant' Book by Alec Markarian which is the ultimate guide to becoming an elite top percentile trader. Alec Markarian shares it all in this book."
];

Widget _buildMembershipPlanCard(
  BuildContext context,
  String title,
  String subtitle,
  List description,
  bool isRecommended,
) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      decoration: BoxDecoration(
          color: Colors.black, borderRadius: BorderRadius.circular(12)),
      height: 600,
      child: Padding(
        padding: const EdgeInsets.all(0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ],
            ),
            AnimatedOpacity(
              opacity: 1,
              duration: Duration(microseconds: 499),
              child: Container(
                height: 100,
                color: const Color(0xff292A38).withOpacity(0.5),
                width: double.infinity,
                child: Center(
                  child: Text(
                    subtitle,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            Expanded(
                child: ListView.builder(
                    itemCount: description.length,
                    padding: const EdgeInsets.all(0),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.done,
                              color: Colors.green,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                                child: Text(
                              description[index],
                              style: TextStyle(color: Colors.white),
                            ))
                          ],
                        ),
                      );
                    })),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MaterialButton(
                    onPressed: () {},
                    child: Container(
                      height: 50,
                      width: 200,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.blue),
                      child: Center(
                        child: Text("Get Started"),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    ),
  );
}

class TradeinfoDesktop extends StatefulWidget {
  const TradeinfoDesktop({Key? key}) : super(key: key);

  @override
  TradeinfoDesktopState createState() => TradeinfoDesktopState();
}

class TradeinfoDesktopState extends State<TradeinfoDesktop> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Container(
      child: Column(
        children: [
          Space.y(4.w)!,
          const Padding(
            padding: EdgeInsets.only(left: 200, right: 200, top: 100),
            child: Text(
              "However you like to trade, we’ve got you covered",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 50),
            ),
          ),
          Space.y(4.w)!,
          Container(
            height: 1700,
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                        child: Container(
                      height: 400,
                      child: ListView.builder(
                          padding: EdgeInsets.all(0),
                          itemCount: 3,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {},
                              onHover: (hovering) {
                                if (mounted) {
                                  setState(() {
                                    boolhoverlist[index] = hovering;
                                  });
                                }
                              },
                              child: Container(
                                height: 400 / 3,
                                color: Colors.white,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 50, right: 50),
                                  child: ListTile(
                                    title: Text(
                                      "Web Portal",
                                      style: TextStyle(
                                          color: boolhoverlist[index] == true
                                              ? Colors.blue
                                              : Colors.black,
                                          fontSize: 22,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    subtitle: Text(
                                      "The platform is an ideal vehicle for international clients to trade CFDs in Forex, Indices, Commodities, Crypto and Shares.",
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }),
                    )),
                    Expanded(
                        child: Container(
                            child: Image.network(
                                "https://en.myfxchoice.com/wp-content/themes/fxnew/images/devices.png"))),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 100, right: 100),
                  child: Container(
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(20)),
                    height: 300,
                    child: Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: const Color(0xff081636),
                              borderRadius: BorderRadius.circular(20)),
                        ),
                        Image.network(
                          "https://en.myfxchoice.com/wp-content/themes/fxnew/images/home/home-banner.png",
                          fit: BoxFit.cover,
                        ),
                        Row(
                          children: [
                            Expanded(
                                child: Container(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Start Learning now",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 40,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Text(
                                    "Dive into the forex market with us",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w400),
                                  )
                                ],
                              ),
                            )),
                            Expanded(
                                child: Container(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  AnimatedContainer(
                                    duration: const Duration(milliseconds: 100),
                                    width: 160,
                                    height: 50,
                                    child: Center(
                                      child: Text(
                                        "Register",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    decoration: BoxDecoration(
                                        color: const Color(0xff3CA348),
                                        borderRadius: BorderRadius.circular(12),
                                        border: Border.all(
                                          color: const Color(0xff3CA348),
                                        )),
                                  ),
                                ],
                              ),
                            )),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 200, right: 200, top: 100),
                  child: Text(
                    "Elevate your trading to the next level with powerful trading tools",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 50),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [0, 1, 2]
                      .map((e) => Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: 250,
                              child: InkWell(
                                  hoverColor: Colors.transparent,
                                  splashColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () {},
                                  onHover: (isHovering) {
                                    if (isHovering) {
                                      if (mounted) {
                                        setState(
                                            () => hoverboollistof[e] = true);
                                      }
                                    } else {
                                      if (mounted) {
                                        setState(
                                            () => hoverboollistof[e] = false);
                                      }
                                    }
                                  },
                                  child: Card(
                                    elevation: 0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                          12.0), // Adjust the value as per your preference
                                    ),
                                    child: AnimatedContainer(
                                      duration: Duration(milliseconds: 500),
                                      width: 100,
                                      height: 300,
                                      decoration: BoxDecoration(
                                          color: hoverboollistof[e] == true
                                              ? const Color(0xff1C4BBA)
                                              : Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          border: Border.all(
                                              color: Color(0xffF4F6F9))),
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(20.0),
                                            child: Row(
                                              children: [
                                                Container(
                                                  height: 60,
                                                  width: 60,
                                                  child: Image.network(
                                                      "https://en.myfxchoice.com/wp-content/themes/fxnew/images/markets/indices.png"),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(
                                              children: [
                                                Text(
                                                  "Trading Signals",
                                                  style: TextStyle(
                                                      color:
                                                          hoverboollistof[e] ==
                                                                  true
                                                              ? Colors.white
                                                              : Colors.black,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize: 22),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Expanded(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Row(
                                                children: [
                                                  Expanded(
                                                    child: Text(
                                                      "Trading Signals are powered by the Signal Centre via LearnFX, a premium trading educator. ",
                                                      maxLines: 4,
                                                      style: TextStyle(
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          color: hoverboollistof[
                                                                      e] ==
                                                                  true
                                                              ? Colors.white
                                                              : Color(
                                                                  0xff8d99b5),
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontSize: 12),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                              child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(0),
                                                    child: Text(
                                                      "Fint out more",
                                                      style: TextStyle(
                                                          color: hoverboollistof[
                                                                      e] ==
                                                                  true
                                                              ? Colors.white
                                                              : Color(
                                                                  0xff8d99b5),
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontSize: 14),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 10,
                                                  ),
                                                  Icon(
                                                    Icons.arrow_forward,
                                                    size: 15,
                                                    color: hoverboollistof[e] ==
                                                            true
                                                        ? const Color(
                                                            0xff1C4BBA)
                                                        : Color(0xff8d99b5),
                                                  )
                                                ],
                                              ),
                                            ],
                                          )),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 20, right: 20),
                                            child: Container(
                                              height: 5,
                                              color: hoverboollistof[e] != true
                                                  ? const Color(0xff1C4BBA)
                                                  : Colors.white,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  )),
                            ),
                          ))
                      .toList(),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [3, 4, 5]
                      .map((e) => Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: 250,
                              child: InkWell(
                                  hoverColor: Colors.transparent,
                                  splashColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () {},
                                  onHover: (isHovering) {
                                    if (isHovering) {
                                      if (mounted) {
                                        setState(
                                            () => hoverboollistof[e] = true);
                                      }
                                    } else {
                                      if (mounted) {
                                        setState(
                                            () => hoverboollistof[e] = false);
                                      }
                                    }
                                  },
                                  child: Card(
                                    elevation: 0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                          12.0), // Adjust the value as per your preference
                                    ),
                                    child: AnimatedContainer(
                                      duration: Duration(milliseconds: 500),
                                      width: 100,
                                      height: 300,
                                      decoration: BoxDecoration(
                                          color: hoverboollistof[e] == true
                                              ? const Color(0xff1C4BBA)
                                              : Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          border: Border.all(
                                              color: Color(0xffF4F6F9))),
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(20.0),
                                            child: Row(
                                              children: [
                                                Container(
                                                  height: 60,
                                                  width: 60,
                                                  child: Image.network(
                                                      "https://en.myfxchoice.com/wp-content/themes/fxnew/images/markets/indices.png"),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(
                                              children: [
                                                Text(
                                                  "Trading Signals",
                                                  style: TextStyle(
                                                      color:
                                                          hoverboollistof[e] ==
                                                                  true
                                                              ? Colors.white
                                                              : Colors.black,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize: 22),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Expanded(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Row(
                                                children: [
                                                  Expanded(
                                                    child: Text(
                                                      "Trading Signals are powered by the Signal Centre via LearnFX, a premium trading educator. ",
                                                      maxLines: 4,
                                                      style: TextStyle(
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          color: hoverboollistof[
                                                                      e] ==
                                                                  true
                                                              ? Colors.white
                                                              : Color(
                                                                  0xff8d99b5),
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontSize: 12),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                              child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(0),
                                                    child: Text(
                                                      "Fint out more",
                                                      style: TextStyle(
                                                          color: hoverboollistof[
                                                                      e] ==
                                                                  true
                                                              ? Colors.white
                                                              : Color(
                                                                  0xff8d99b5),
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontSize: 14),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 10,
                                                  ),
                                                  Icon(
                                                    Icons.arrow_forward,
                                                    size: 15,
                                                    color: hoverboollistof[e] ==
                                                            true
                                                        ? const Color(
                                                            0xff1C4BBA)
                                                        : Color(0xff8d99b5),
                                                  )
                                                ],
                                              ),
                                            ],
                                          )),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 20, right: 20),
                                            child: Container(
                                              height: 5,
                                              color: hoverboollistof[e] != true
                                                  ? const Color(0xff1C4BBA)
                                                  : Colors.white,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  )),
                            ),
                          ))
                      .toList(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  List hoverboollistof = List.generate(6, (index) => false);
}
