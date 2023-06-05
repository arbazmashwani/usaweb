import 'package:flutter/material.dart';

class ChatDialogContent extends StatelessWidget {
  const ChatDialogContent({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController _controller = TextEditingController();
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          color: Colors.white,
          height: 400,
          width: 400,
          child: Column(
            children: [
              Container(
                height: 40,
                color: const Color(0xff1C4BBA),
                child: Text('live Chat'),
              ),
              Expanded(
                  child: Container(
                child: const Center(
                  child: Text(
                    "No Messages",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              )),
              SizedBox(
                height: 40,
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _controller,
                        decoration: InputDecoration(
                          labelText: 'Enter your text',
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                      child: Icon(Icons.send),
                    )
                  ],
                ),
              )
            ],
          ),
        )
        // Your chat dialog content
      ],
    );
  }
}
