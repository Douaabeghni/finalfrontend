import 'package:flutter/material.dart';
import 'package:my_ap/screen/message2.dart';

class Message extends StatefulWidget {
  const Message({super.key});

  @override
  State<Message> createState() => _MessageState();
}

class _MessageState extends State<Message> {
  List<Message2> messages = [
    Message2(
      text: 'Yes sure!',
      date: DateTime.now().subtract(Duration(minutes: 1)),
      isSentByMe: false,
    ),
  ];

  TextEditingController messageController = TextEditingController();

  void sendMessage() {
    if (messageController.text.isNotEmpty) {
      setState(() {
        messages.add(
          Message2(
            text: messageController.text,
            date: DateTime.now(),
            isSentByMe: true,
          ),
        );
        messageController.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.grey,
        elevation: 5,
        backgroundColor: const Color.fromARGB(252, 239, 235, 240),
        leadingWidth: 200,
        leading: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            CircleAvatar(
              radius: 26,
              backgroundImage: AssetImage("assets/pic2.jpeg"),
            ),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'name',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                Text(
                  'online',
                  style: TextStyle(fontSize: 10, color: Colors.black),
                ),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.call, color: Colors.black),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.videocam, color: Colors.black),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.settings, color: Colors.black),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: messages.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Align(
                    alignment:
                        messages[index].isSentByMe
                            ? Alignment.centerRight
                            : Alignment.centerLeft,
                    child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color:
                            messages[index].isSentByMe
                                ? Colors.blueAccent
                                : Colors.grey[300],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        messages[index].text,
                        style: TextStyle(
                          color:
                              messages[index].isSentByMe
                                  ? Colors.white
                                  : Colors.black,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            padding: EdgeInsets.symmetric(horizontal: 10),
            height: 50,
            decoration: BoxDecoration(
              color: const Color.fromARGB(252, 239, 235, 240),
              borderRadius: BorderRadius.circular(25),
              border: Border.all(color: Colors.grey),
            ),
            child: Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.camera_alt, color: Colors.blue),
                ),
                Expanded(
                  child: TextField(
                    controller: messageController,
                    decoration: InputDecoration(
                      hintText: "Écrivez ici",
                      border: InputBorder.none,
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.mic, color: Colors.blue),
                ),
                IconButton(
                  onPressed: sendMessage,
                  icon: Icon(Icons.send, color: Colors.blue),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
