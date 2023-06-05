part of '../aboutpage.dart';

class _NavbarDesktop extends StatefulWidget {
  const _NavbarDesktop({Key? key}) : super(key: key);

  @override
  State<_NavbarDesktop> createState() => _NavbarDesktopState();
}

class _NavbarDesktopState extends State<_NavbarDesktop> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // theme
    var theme = Theme.of(context);
    return BlocBuilder<ThemeCubit, ThemeState>(builder: (context, state) {
      return Container(
        padding:
            EdgeInsets.symmetric(horizontal: size.width / 10, vertical: 12),
        color: theme.navBarColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const NavBarLogo(),

            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  height: 40,
                  width: 80,
                  child: ColorChageButton(
                    text: 'Login',
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HomePagelogin()));
                    },
                  ),
                ),
              ],
            ),

            // Space.x!,
          ],
        ),
      );
    });
  }
}

class _NavBarTablet extends StatelessWidget {
  const _NavBarTablet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final drawerProvider = Provider.of<DrawerProvider>(context);
    var theme = Theme.of(context);
    return Container(
      color: theme.navBarColor,
      padding: EdgeInsets.symmetric(
          horizontal: Responsive.isTablet(context) ? 10.w : 10, vertical: 10),
      child: Row(
        children: [
          IconButton(
            highlightColor: Colors.white54,
            onPressed: () {
              drawerProvider.key.currentState!.openDrawer();
            },
            icon: const Icon(Icons.menu),
          ),
          Space.xm!,

          // Space.x1!,
        ],
      ),
    );
  }
}
