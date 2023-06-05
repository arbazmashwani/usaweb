part of '../main_section.dart';

class _NavbarDesktop extends StatefulWidget {
  const _NavbarDesktop({Key? key}) : super(key: key);

  @override
  State<_NavbarDesktop> createState() => _NavbarDesktopState();
}

class _NavbarDesktopState extends State<_NavbarDesktop> {
  bool signinhover = false;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(builder: (context, state) {
      return Container(
        color: Colors.white,
        child: Column(
          children: [
            Container(
              height: 50,
              color: const Color(0xffF2F5FC),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.chat,
                        color: Color(0xff8D99B5),
                      ),
                      GestureDetector(
                        onTap: () {
                          showGeneralDialog(
                            context: context,
                            barrierColor: Colors.black54,
                            barrierDismissible: true,
                            barrierLabel: 'Label',
                            pageBuilder: (_, __, ___) {
                              return Align(
                                  alignment: Alignment.bottomRight,
                                  child: ChatDialogContent());
                            },
                          );
                        },
                        child: Text(
                          "Live Chat",
                          style: TextStyle(
                              color: Color(0xff8D99B5),
                              fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                  Container(
                    width: 30,
                  )
                ],
              ),
            ),
            Container(
              height: 100,
              width: double.infinity,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.only(left: 50, right: 50),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const NavBarLogo(),
                    Row(
                      children: [
                        InkWell(
                          onTap: () {},
                          onHover: (isHovering) {
                            if (isHovering) {
                              setState(() => signinhover = true);
                            } else {
                              setState(() => signinhover = false);
                            }
                          },
                          child: MaterialButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomePagelogin()),
                              );
                            },
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 100),
                              width: 130,
                              height: 50,
                              decoration: BoxDecoration(
                                  color: signinhover == true
                                      ? const Color(0xff1C4BBA)
                                      : Colors.white,
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(
                                      color: const Color(0xff1C4BBA))),
                              child: Center(
                                child: Text(
                                  "Sign In",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: signinhover != true
                                        ? const Color(0xff1C4BBA)
                                        : Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 100),
                          width: 130,
                          height: 50,
                          decoration: BoxDecoration(
                              color: const Color(0xff3CA348),
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: const Color(0xff3CA348),
                              )),
                          child: Center(
                            child: Text(
                              "Register",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const Divider(
              color: Colors.black38,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 70, right: 10, top: 10),
              child: Row(
                children: [
                  ...NavBarUtils.names.asMap().entries.map(
                        (e) => NavBarActionButton(
                          label: e.value,
                          index: e.key,
                        ),
                      ),
                  // Space.x!,

                  // Space.x!,
                ],
              ),
            ),
            Container(
              height: 50,
              decoration: const BoxDecoration(
                color: Color(0xff1C4BBA),
              ),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Enrich your trade with  "),
                    Text(
                      "Alec Markarian!",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
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
          const NavBarLogo(),
          // Space.x1!,
        ],
      ),
    );
  }
}
