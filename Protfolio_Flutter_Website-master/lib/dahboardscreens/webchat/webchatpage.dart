import 'package:flutter/material.dart';
import 'package:mysite/app/sections/Authentication/dashboard.dart';

class WebChatPage extends StatefulWidget {
  const WebChatPage({super.key});

  @override
  State<WebChatPage> createState() => _WebChatPageState();
}

class _WebChatPageState extends State<WebChatPage> {
  final ScrollController _scrollController = ScrollController();

  TextEditingController messagecontroller = TextEditingController();

  void scrollToLastMessage() {
    if (_scrollController.hasClients) {
      _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      scrollToLastMessage();
    });
  }

  final List<ChatItem> chatItems = [
    ChatItem(
      sender: 'John',
      message: 'Hello!',
      pictureurl:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ6-IHWT0V4fY6b3TSYa1fj4WnVGuiLPpO38A&usqp=CAU",
      type: MessageType.text,
    ),
    ChatItem(
      sender: 'Alice',
      message: 'Hi, how are you?',
      pictureurl:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSq738h3idp6VG2V8_p5PRyTv46lqh6zsvmEw&usqp=CAU",
      type: MessageType.text,
    ),
    ChatItem(
      sender: 'John',
      message: 'I\'m good, thanks!',
      type: MessageType.text,
      pictureurl:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ6-IHWT0V4fY6b3TSYa1fj4WnVGuiLPpO38A&usqp=CAU",
    ),
    ChatItem(
      sender: 'Alice',
      message: 'Great!',
      pictureurl:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSq738h3idp6VG2V8_p5PRyTv46lqh6zsvmEw&usqp=CAU",
      type: MessageType.text,
    ),
    ChatItem(
      sender: 'Alice',
      message: 'Check out this image.',
      type: MessageType.image,
      pictureurl:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSq738h3idp6VG2V8_p5PRyTv46lqh6zsvmEw&usqp=CAU",
      image: const NetworkImage(
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRri237FDDaoN1GTOoOymG3zqIK0uj8WDuufSTYxub2YcrYPTxL_g1qXzM3-ZRX-uw92lA&usqp=CAU'),
    ),
    ChatItem(
      sender: 'John',
      message: 'Wow, it looks amazing!',
      type: MessageType.text,
      pictureurl:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ6-IHWT0V4fY6b3TSYa1fj4WnVGuiLPpO38A&usqp=CAU",
    ),
    ChatItem(
      sender: 'Alice',
      message: 'Thank You Bro , So much',
      type: MessageType.text,
      pictureurl:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSq738h3idp6VG2V8_p5PRyTv46lqh6zsvmEw&usqp=CAU",
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: heaveytheme,
      body: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: const Color(0xff22202D),
        ),
        child: Row(
          children: [
            Expanded(
                flex: 3,
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: heaveytheme, width: 3)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        TextField(
                          decoration: InputDecoration(
                              hintText: "Search",
                              hintStyle: TextStyle(
                                  color: Colors.grey[100]!.withOpacity(0.50),
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600),
                              prefixIcon: const Icon(Icons.search),
                              filled: true,
                              fillColor: const Color(0xff444652),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: const BorderSide(
                                    color: Color(0xff444652),
                                  )),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: const BorderSide(
                                    color: Color(0xff444652),
                                  ))),
                        ),
                        SizedBox(
                          height: 400,
                          child: ListView.builder(
                              itemCount: 3,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.only(top: 8),
                                  child: Container(
                                    height: 100,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: index == 0 ? heaveytheme : null,
                                    ),
                                    child: Center(
                                      child: ListTile(
                                        title: Row(
                                          children: [
                                            SizedBox(
                                              height: 40,
                                              child: ClipRRect(
                                                borderRadius: BorderRadius.circular(
                                                    10), // Adjust the border radius as desired
                                                child: Image.network(
                                                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT9WPcdIBl0kFQVdm4qTWpUsDSdH09s47Ifwg&usqp=CAU"), // Replace with your image path
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 8,
                                            ),
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                const Row(
                                                  children: [
                                                    Text(
                                                        "Office Chat Alec chat"),
                                                  ],
                                                ),
                                                index != 0
                                                    ? Text(
                                                        index != 0
                                                            ? "I want to ask you pick..."
                                                            : "I want to ask",
                                                        maxLines: 1,
                                                        style: TextStyle(
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            color: Colors.grey
                                                                .withOpacity(
                                                                    0.30),
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 16),
                                                      )
                                                    : Row(
                                                        children: [
                                                          Text(
                                                            "I want to ask...",
                                                            maxLines: 1,
                                                            style: TextStyle(
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                color: Colors
                                                                    .grey
                                                                    .withOpacity(
                                                                        0.30),
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontSize: 16),
                                                          ),
                                                          const SizedBox(
                                                            width: 5,
                                                          ),
                                                          Container(
                                                            height: 25,
                                                            width: 25,
                                                            decoration:
                                                                BoxDecoration(
                                                                    color: Colors
                                                                        .deepPurple,
                                                                    shape: BoxShape
                                                                        .circle,
                                                                    border:
                                                                        Border
                                                                            .all(
                                                                      color: Colors
                                                                          .deepPurple,
                                                                    )),
                                                            child: const Center(
                                                              child: Text(
                                                                "5",
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold),
                                                              ),
                                                            ),
                                                          ),
                                                          const SizedBox(
                                                            width: 10,
                                                          ),
                                                          const Icon(
                                                            Icons.pin_invoke,
                                                            color: Colors.white,
                                                          )
                                                        ],
                                                      )
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              }),
                        )
                      ],
                    ),
                  ),
                )),
            Expanded(
                flex: 7,
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: heaveytheme, width: 3)),
                  child: Column(
                    children: [
                      SizedBox(
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  const Text(
                                    "Office Chat Alec chat",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "2 Members , 1 online",
                                    style: TextStyle(
                                        color: Colors.grey.withOpacity(0.80)),
                                  ),
                                ],
                              ),
                              const Row(
                                children: [
                                  Icon(Icons.search),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Icon(Icons.call),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Icon(Icons.menu),
                                  SizedBox(
                                    width: 20,
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                          child: SizedBox(
                        child: ListView.builder(
                          controller: _scrollController,
                          itemCount: chatItems.length,
                          itemBuilder: (context, index) {
                            final item = chatItems[index];

                            final previousItem =
                                index > 0 ? chatItems[index - 1] : null;
                            final isFirstMessage =
                                previousItem?.sender != item.sender;
                            return buildMessageWidget(item, isFirstMessage);
                          },
                        ),
                      )),
                      SizedBox(
                        height: 100,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 12, right: 12),
                          child: Row(
                            children: [
                              Expanded(
                                child: TextField(
                                  controller: messagecontroller,
                                  decoration: InputDecoration(
                                      hintText: "Type Message",
                                      hintStyle: TextStyle(
                                          color: Colors.grey[100]!
                                              .withOpacity(0.50),
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600),
                                      filled: true,
                                      fillColor: const Color(0xff444652),
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          borderSide: const BorderSide(
                                            color: Color(0xff444652),
                                          )),
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          borderSide: const BorderSide(
                                            color: Color(0xff444652),
                                          ))),
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              IconButton(
                                  onPressed: () {
                                    setState(() {
                                      chatItems.add(
                                        ChatItem(
                                          sender: 'John',
                                          message: messagecontroller.text,
                                          type: MessageType.text,
                                          pictureurl:
                                              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ6-IHWT0V4fY6b3TSYa1fj4WnVGuiLPpO38A&usqp=CAU",
                                        ),
                                      );
                                      scrollToLastMessage();
                                    });
                                  },
                                  icon: const Icon(Icons.send))
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}

Widget buildMessageWidget(ChatItem item, bool isFirstMessage) {
  final isSenderJohn = item.sender == 'John';
  final alignment = isSenderJohn ? Alignment.topRight : Alignment.topLeft;

  giz() {
    if (item.type == MessageType.text) {
      return Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Row(
          children: [
            isSenderJohn == false
                ? Expanded(
                    flex: 1,
                    child: Container(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.amber,
                            image: DecorationImage(
                                image: NetworkImage(item.pictureurl.toString()),
                                fit: BoxFit.cover),
                          ),
                        ),
                      ),
                    ))
                : Container(),
            Expanded(
                flex: 9,
                child: Align(
                  alignment: alignment,
                  child: Container(
                    margin:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: heaveytheme,
                      borderRadius: BorderRadius.only(
                        topLeft: const Radius.circular(16),
                        topRight: const Radius.circular(16),
                        bottomLeft: Radius.circular(
                            isSenderJohn && isFirstMessage ? 25 : 4),
                        bottomRight: Radius.circular(
                            !isSenderJohn && isFirstMessage ? 25 : 4),
                      ),
                    ),
                    child: Text(
                      item.message,
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
                )),
            isSenderJohn != false
                ? Expanded(
                    flex: 1,
                    child: Container(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.amber,
                            image: DecorationImage(
                                image: NetworkImage(item.pictureurl.toString()),
                                fit: BoxFit.cover),
                          ),
                        ),
                      ),
                    ))
                : Container(),
          ],
        ),
      );
    }
  }

  switch (item.type) {
    case MessageType.text:
      return giz()!;
    case MessageType.image:
      return SizedBox(
        height: 200,
        child: Padding(
          padding: const EdgeInsets.only(left: 12),
          child: Row(
            children: [
              Expanded(
                  flex: 1,
                  child: Container(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.amber,
                          image: DecorationImage(
                              image: NetworkImage(item.pictureurl.toString()),
                              fit: BoxFit.cover),
                        ),
                      ),
                    ),
                  )),
              Expanded(
                  flex: 9,
                  child: Container(
                    child: Row(
                      children: [
                        Expanded(
                            flex: 5,
                            child: Container(
                              alignment: Alignment.bottomCenter,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: item.image!, fit: BoxFit.fill),
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.amber,
                                  ),
                                ),
                              ),
                            )),
                        Expanded(flex: 5, child: Container()),
                      ],
                    ),
                  )),
            ],
          ),
        ),
      );
    case MessageType.sound:
      return GestureDetector(
        onTap: () {
          // Play sound logic
        },
        child: const Row(
          children: [
            Icon(Icons.volume_up),
            SizedBox(width: 8.0),
            Text('Sound Clip'),
          ],
        ),
      );
  }
}

class ChatItem {
  final String sender;
  final String message;
  final String pictureurl;
  final MessageType type;
  final ImageProvider? image;
  final String? sound;

  ChatItem({
    required this.pictureurl,
    required this.sender,
    required this.message,
    required this.type,
    this.image,
    this.sound,
  });
}

enum MessageType {
  text,
  image,
  sound,
}
