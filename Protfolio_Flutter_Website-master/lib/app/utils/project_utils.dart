class ProjectUtils {
  final String banners;
  final String icons;
  final String titles;
  final String description;
  final String links;
  ProjectUtils({
    required this.banners,
    required this.icons,
    required this.titles,
    required this.description,
    required this.links,
  });
}

List<ProjectUtils> projectUtils = [
  ProjectUtils(
    banners: 'assets/imgs/02.png',
    icons: 'assets/imgs/flutter.png',
    titles: 'Forex',
    description:
        "Take part in the world's largest financial market where more than 5\$ trillon worth of currencies are bought and sold each day",
    links: '',
  ),
  ProjectUtils(
    banners: 'assets/imgs/04.png',
    icons: 'assets/imgs/flutter.png',
    titles: 'Commodities',
    description:
        'Trade the price movements of natural resources that are central to the world economy and make the most of the market action',
    links: '',
  ),
  ProjectUtils(
    banners: 'assets/imgs/03.png',
    icons: 'assets/imgs/flutter.png',
    titles: 'Bitcoin',
    description:
        'Trade shares price movements of big brands and predict broader market trends with indices that measure the overall performance of a market',
    links: '',
  ),
];
