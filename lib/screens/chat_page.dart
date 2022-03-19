// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:chatapp/widgets/custom_snack.dart';
import 'package:flutter/material.dart';

import '../models/chat_users_model.dart';
import '../widgets/conversation_list.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  List<ChatUser> chatUsers = [
    ChatUser(
        name: "Jane Russel",
        messageText: "Awesome Setup",
        imageUrl: "https://i.imgur.com/igF04sl.jpeg",
        time: "Now"),
    ChatUser(
        name: "Glady's Murphy",
        messageText: "That's Great",
        imageUrl: "https://i.imgur.com/igF04sl.jpeg",
        time: "Yesterday"),
    ChatUser(
        name: "Jorge Henry",
        messageText: "Hey where are you?",
        imageUrl: "https://i.imgur.com/igF04sl.jpeg",
        time: "31 Mar"),
    ChatUser(
        name: "Philip Fox",
        messageText: "Busy! Call me in 20 mins",
        imageUrl: "https://i.imgur.com/igF04sl.jpeg",
        time: "28 Mar"),
    ChatUser(
        name: "Debra Hawkins",
        messageText: "Thankyou, It's awesome",
        imageUrl: "https://i.imgur.com/igF04sl.jpeg",
        time: "23 Mar"),
    ChatUser(
        name: "Jacob Pena",
        messageText: "will update you in evening",
        imageUrl: "https://i.imgur.com/igF04sl.jpeg",
        time: "17 Mar"),
    ChatUser(
        name: "Andrey Jones",
        messageText: "Can you please share the file?",
        imageUrl: "https://i.imgur.com/igF04sl.jpeg",
        time: "24 Feb"),
    ChatUser(
        name: "John Wick",
        messageText: "How are you?",
        imageUrl: "https://i.imgur.com/igF04sl.jpeg",
        time: "18 Feb"),
    ChatUser(
        name: "John Wick",
        messageText: "How are you?",
        imageUrl: "https://i.imgur.com/igF04sl.jpeg",
        time: "18 Feb"),
    ChatUser(
        name: "John Wick",
        messageText: "How are you?",
        imageUrl: "https://i.imgur.com/igF04sl.jpeg",
        time: "18 Feb"),
    ChatUser(
        name: "John Wick",
        messageText: "How are you?",
        imageUrl: "https://i.imgur.com/igF04sl.jpeg",
        time: "18 Feb"),
    ChatUser(
        name: "John Wick",
        messageText: "How are you?",
        imageUrl: "https://i.imgur.com/igF04sl.jpeg",
        time: "18 Feb"),
    ChatUser(
        name: "John Wick",
        messageText: "How are you?",
        imageUrl: "https://i.imgur.com/igF04sl.jpeg",
        time: "18 Feb"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () => {
                          ScaffoldMessenger.of(context).showSnackBar(customSnack(text: 'Lmao', ctx: context))
                        },
                        child: const CircleAvatar(
                          radius: 20,
                          backgroundImage: NetworkImage("https://i.imgur.com/igF04sl.jpeg"),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        "Conversations",
                        style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Container(
                    height: 35,
                    width: 35,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        color: Colors.grey.shade200),
                    child: Icon(Icons.add, color: Colors.grey.shade500, size: 30),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: RefreshIndicator(
              onRefresh: () {
                return Future.delayed(const Duration(seconds: 2));
              },
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
                      child: TextField(
                        decoration: InputDecoration(
                            hintText: 'Search...',
                            hintStyle: TextStyle(color: Colors.grey[600]),
                            prefixIcon: Icon(
                              Icons.search,
                              color: Colors.grey[600],
                              size: 20,
                            ),
                            filled: true,
                            fillColor: Colors.grey[100],
                            contentPadding: const EdgeInsets.all(8),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide:
                                    BorderSide(color: Colors.grey.shade100))),
                      ),
                    ),
                    ListView.builder(
                      itemCount: chatUsers.length,
                      shrinkWrap: true,
                      padding: const EdgeInsets.only(top: 16),
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return ConversationList(
                          name: chatUsers[index].name,
                          messageText: chatUsers[index].messageText,
                          imageUrl: chatUsers[index].imageUrl,
                          time: chatUsers[index].time,
                          isMessageRead:
                              (index == 0 || index == 3) ? true : false,
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  // ignore: override_on_non_overriding_member
  Widget build1(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        // Expanded(
        //     child: SingleChildScrollView(
        //       physics: BouncingScrollPhysics(),
        //       child: Column(
        //         crossAxisAlignment: CrossAxisAlignment.start,
        //         children: [
        //           for(var item in chatUsers) ConversationList(name: item.name, messageText: item.messageText, imageUrl: item.imageUrl, time: item.time, isMessageRead:  true)
        //         ],
        //       ),
        //     ),
        //   ),
        Expanded(
          // child: SingleChildScrollView(
          // physics: const BouncingScrollPhysics(),
          child: ListView.builder(
              itemCount: chatUsers.length,
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              addAutomaticKeepAlives: true,
              itemBuilder: (context, index) {
                return ConversationList(
                  name: chatUsers[index].name,
                  messageText: chatUsers[index].messageText,
                  imageUrl: chatUsers[index].imageUrl,
                  time: chatUsers[index].time,
                  isMessageRead: (index == 0 || index == 3) ? true : false,
                );
              }),
          // ),
        )
      ]),
    );
  }
}
