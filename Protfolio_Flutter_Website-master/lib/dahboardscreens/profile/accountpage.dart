import 'package:flutter/material.dart';
import 'package:mysite/app/sections/Authentication/dashboard.dart';

class AccountMainPage extends StatefulWidget {
  const AccountMainPage({super.key});

  @override
  State<AccountMainPage> createState() => _AccountMainPageState();
}

class _AccountMainPageState extends State<AccountMainPage> {
  List<bool> boollist = List.generate(6, (index) => false).toList();
  List<bool> hoverboollist = List.generate(6, (index) => false).toList();
  @override
  void initState() {
    boollist[0] = true;
    setState(() {});
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: heaveytheme,
      body: Column(
        children: [
          const SizedBox(
            child: Padding(
              padding:
                  EdgeInsets.only(left: 50, right: 20, top: 10, bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Account Setting",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 50),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.only(bottom: 12, left: 50),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: const Color(0xff22202D),
              ),
              child: Row(
                children: [
                  Expanded(
                      flex: 3,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Container(
                              height: MediaQuery.of(context).size.height - 212,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                width: 3,
                                color: heaveytheme,
                              )),
                              child: ListView.builder(
                                  itemCount: 6,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: EdgeInsets.only(
                                          top: index == 0 ? 12 : 8,
                                          left: 8,
                                          right: 8),
                                      child: InkWell(
                                        onHover: (ishovering) {
                                          setState(() {
                                            hoverboollist[index] = ishovering;
                                          });
                                        },
                                        onTap: () {
                                          setState(() {
                                            boollist[0] = false;
                                            boollist[1] = false;
                                            boollist[2] = false;
                                            boollist[3] = false;
                                            boollist[4] = false;
                                            boollist[5] = false;
                                            boollist[index] = true;
                                          });
                                        },
                                        child: Container(
                                            height: 50,
                                            decoration: BoxDecoration(
                                                color: boollist[index] == true
                                                    ? heaveytheme
                                                    : hoverboollist[index] ==
                                                            true
                                                        ? heaveytheme
                                                        : null,
                                                borderRadius:
                                                    BorderRadius.circular(30)),
                                            child: Row(
                                              children: [
                                                const SizedBox(
                                                  width: 20,
                                                ),
                                                Text(
                                                  accounttilelist[index],
                                                  style: TextStyle(
                                                      fontWeight: index == 5
                                                          ? FontWeight.bold
                                                          : FontWeight.w400,
                                                      color: index == 5
                                                          ? Colors.red
                                                          : Colors.white),
                                                )
                                              ],
                                            )),
                                      ),
                                    );
                                  }),
                            ),
                          ],
                        ),
                      )),
                  Expanded(
                      flex: 8,
                      child: Container(
                        child: Column(
                          children: [
                            const SizedBox(
                              child: Padding(
                                padding: EdgeInsets.only(
                                    left: 10, right: 20, top: 10, bottom: 20),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "My Profile",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 20),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              height: 100,
                              color: heaveytheme,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    const CircleAvatar(
                                      radius: 50,
                                      backgroundImage: NetworkImage(
                                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQf5M2j5aP_QleSz2Sb2Qgf-J5UgjP3po54hg&usqp=CAU"),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Column(
                                      children: [
                                        const Text(
                                          "Rafiqul Rehman",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 20),
                                        ),
                                        const SizedBox(
                                          height: 7,
                                        ),
                                        Text(
                                          "Membership A",
                                          style: TextStyle(
                                              color: themecolor,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 15),
                                        ),
                                        Text(
                                          "Pakistan",
                                          style: TextStyle(
                                              color: themecolor,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 15),
                                        ),
                                      ],
                                    ),
                                    Expanded(
                                        child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Container(
                                          height: 40,
                                          width: 100,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              border: Border.all(
                                                color: Colors.white,
                                              )),
                                          child: const Center(
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text("Edit"),
                                                Icon(Icons.edit)
                                              ],
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 15,
                                        ),
                                      ],
                                    ))
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      const SizedBox(
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                              left: 0,
                                              right: 20,
                                              top: 10,
                                              bottom: 5),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "Personal Information",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 20),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 0, right: 100),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Expanded(
                                              child: ListTile(
                                                title: Text("First Name",
                                                    style: TextStyle(
                                                        color: themecolor)),
                                                subtitle: const Text("Rafique",
                                                    style: TextStyle(
                                                        color: Colors.white)),
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 20,
                                            ),
                                            Expanded(
                                              child: ListTile(
                                                title: Text("Last Name",
                                                    style: TextStyle(
                                                        color: themecolor)),
                                                subtitle: const Text("Raheem",
                                                    style: TextStyle(
                                                        color: Colors.white)),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 0, right: 100),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Expanded(
                                              child: ListTile(
                                                title: Text("Email",
                                                    style: TextStyle(
                                                        color: themecolor)),
                                                subtitle: const Text(
                                                    "Hammad168@gmail.com",
                                                    style: TextStyle(
                                                        color: Colors.white)),
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 20,
                                            ),
                                            Expanded(
                                              child: ListTile(
                                                title: Text("Phone",
                                                    style: TextStyle(
                                                        color: themecolor)),
                                                subtitle: const Text(
                                                    "+923094771893",
                                                    style: TextStyle(
                                                        color: Colors.white)),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      ListTile(
                                        title: Text("Bio",
                                            style:
                                                TextStyle(color: themecolor)),
                                        subtitle: const Text("Team Manager",
                                            style:
                                                TextStyle(color: Colors.white)),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ))
                ],
              ),
            ),
          ))
        ],
      ),
    );
  }
}

List<String> accounttilelist = [
  "My Profile",
  "Security",
  "Teams",
  "Notifications",
  "Billing",
  "Log Out"
];
