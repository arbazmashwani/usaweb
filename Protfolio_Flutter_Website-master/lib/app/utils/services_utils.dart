class ServicesUtils {
  final String name;
  final String icon;
  final List<String> tool;
  final String description;

  ServicesUtils(
      {required this.name,
      required this.icon,
      required this.description,
      required this.tool});
}

List<ServicesUtils> servicesUtils = [
  ServicesUtils(
    name: 'CFDS',
    icon: 'assets/icons/android.svg',
    description:
        "Trade with leverage and low spreads for better returns on Successful trades",
    tool: ["More on CFDS"],
  ),
  ServicesUtils(
    name: 'Multipliers',
    icon: 'assets/icons/apple.svg',
    description:
        "Multply Potential profit without risking more than your initial stake",
    tool: ["More on Multipliers"],
  ),
  ServicesUtils(
    name: 'Options',
    icon: 'assets/icons/graphic.svg',
    description:
        "Earn a range of payouts by correctly predicting markets movements",
    tool: ["More on Options"],
  ),
];
