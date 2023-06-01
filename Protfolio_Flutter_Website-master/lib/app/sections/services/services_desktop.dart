part of 'services.dart';

class ServiceDesktop extends StatefulWidget {
  const ServiceDesktop({Key? key}) : super(key: key);

  @override
  ServiceDesktopState createState() => ServiceDesktopState();
}

class ServiceDesktopState extends State<ServiceDesktop> {
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
              "Memberships Plans",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 50),
            ),
          ),
          Space.y(1.w)!,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                servicesSubHeading,
                style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w600,
                    fontSize: 20),
              ),
            ],
          ),
          Space.y(2.w)!,
          Container(
            child: Row(
              children: [
                Expanded(
                    child: Container(
                  child: _buildMembershipPlanCard(
                    description: basiclist,
                    title: "Signals",
                    subtitle: "\$100/month",
                  ),
                )),
                Expanded(
                    child: Container(
                  child: _buildMembershipPlanCard(
                    description: marketscholarlist,
                    title: "Market Scholar",
                    subtitle: "\$200/month",
                  ),
                )),
                Expanded(
                    child: Container(
                  child: _buildMembershipPlanCard(
                    description: marketsavant,
                    title: "Market Savant",
                    subtitle: "\$500/month",
                  ),
                )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _buildMembershipPlanCard extends StatefulWidget {
  _buildMembershipPlanCard(
      {super.key,
      this.title,
      this.subtitle,
      this.isRecommended,
      required this.description});
  String? title;
  String? subtitle;
  List? description;
  bool? isRecommended;

  @override
  State<_buildMembershipPlanCard> createState() =>
      __buildMembershipPlanCardState();
}

class __buildMembershipPlanCardState extends State<_buildMembershipPlanCard> {
  bool ishover = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {},
        onHover: (ishovering) {
          if (mounted) {
            setState(() => ishover = ishovering);
          }
        },
        child: Card(
          elevation: ishover == true ? 10 : 1,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
                12.0), // Adjust the value as per your preference
          ),
          child: Container(
            decoration: BoxDecoration(
                border: Border.all(color: Color(0xffF4F6F9)),
                color: Colors.white,
                borderRadius: BorderRadius.circular(12)),
            height: 700,
            child: Padding(
              padding: const EdgeInsets.all(0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        widget.title.toString(),
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 22,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  AnimatedOpacity(
                    opacity: 1,
                    duration: Duration(microseconds: 499),
                    child: Container(
                      height: 100,
                      color: ishover == true
                          ? const Color(0xff1C4BBA)
                          : Colors.grey[200],
                      width: double.infinity,
                      child: Center(
                        child: Text(
                          widget.subtitle.toString(),
                          style: TextStyle(
                              color: ishover != true
                                  ? const Color(0xff1C4BBA)
                                  : Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                      child: ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: widget.description!.length,
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
                                    widget.description![index],
                                    style: TextStyle(color: Colors.black),
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
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 100),
                          height: 50,
                          width: 200,
                          child: Center(
                            child: Text(
                              "Sign In",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: ishover != true
                                    ? const Color(0xff1C4BBA)
                                    : Colors.white,
                              ),
                            ),
                          ),
                          decoration: BoxDecoration(
                              color: ishover == true
                                  ? const Color(0xff1C4BBA)
                                  : Colors.white,
                              borderRadius: BorderRadius.circular(12),
                              border:
                                  Border.all(color: const Color(0xff1C4BBA))),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

List<String> basiclist = [
  "Receive all our premium signals",
  "receive signals to your phone using our app",
  "Weekly market forecast where Alec Markarian breaks down how and what is behind the markets moving the prior week and provides a forecast for the week upcoming with potential trade setups every Sunday, with visual charts"
];

List<String> marketscholarlist = [
  "Receive all our premium signals",
  "receive signals to your phone using our app",
  "Full breakdowns and journal of each trade with pictures and descriptors taking you through the full phycology of the trader Alec Markarian, along with a Market Analysis every morning with potential trade setups to look out for",
  "Daily Market Forecasts by Alec Markarian going deep into the markets on a daily basis and looking at past price action and forecasting future daily moves and providing visual charts for potential trade setups to look out for",
  "Access to the 'Becoming Market Savant' Book by Alec Markarian which is the ultimate guide to becoming an elite top percentile trader. Alec Markarian shares it all in this book."
];

List<String> marketsavant = [
  "Alec Markarian help and Guide you in your Trading Journey, Chat Queries",
  "Receive all our premium signals",
  "receive signals to your phone using our app",
  "Full breakdowns and journal of each trade with pictures and descriptors taking you through the full phycology of the trader Alec Markarian, along with a Market Analysis every morning with potential trade setups to look out for",
  "access to all educational content that is updated regularly and made by Alec Markarian exclusively for TradeX",
  "1 on 1 mentorship and messaging with Alec Markarian ask questions about your trades at any time and 1 hour of on the phone time per week"
];
