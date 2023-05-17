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
          Space.y(10.w)!,
          const CustomSectionHeading(text: 'Memberships Plans'),
          Space.y(1.w)!,
          CustomSectionSubHeading(text: servicesSubHeading),
          Space.y(2.w)!,
          Container(
            child: Row(
              children: [
                Expanded(
                    child: Container(
                  child: _buildMembershipPlanCard(
                    context,
                    'Signals',
                    '\$100/month',
                    basiclist,
                    false,
                  ),
                )),
                Expanded(
                    child: Container(
                  child: _buildMembershipPlanCard(
                    context,
                    'Market Scholar',
                    '\$200/month',
                    marketscholarlist,
                    false,
                  ),
                )),
                Expanded(
                    child: Container(
                  child: _buildMembershipPlanCard(
                    context,
                    'Market Savant',
                    '\$500/month',
                    marketsavant,
                    false,
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
