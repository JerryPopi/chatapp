// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:chatapp/widgets/swiping_navbar.dart';
import 'package:flutter/material.dart';

import 'chat_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChatPage(),
      // bottomNavigationBar: BottomNavigationBar(
      //   selectedItemColor: Colors.red,
      //   unselectedItemColor: Colors.grey.shade600,
      //   selectedLabelStyle: TextStyle(fontWeight: FontWeight.w600),
      //   unselectedLabelStyle: TextStyle(fontWeight: FontWeight.w600),
      //   type: BottomNavigationBarType.fixed,
      //   items: [
      //     BottomNavigationBarItem(icon: Icon(Icons.message), label: 'Chats'),
      //     BottomNavigationBarItem(icon: Icon(Icons.group_work), label: 'Channels'),
      //     BottomNavigationBarItem(icon: Icon(Icons.account_box), label: 'Profile')
      //   ],
      //   elevation: 0,
      // ),

      bottomNavigationBar: SwipingNavbar(
        // items: [
        //   BottomNavigationBarItem(
        //     icon: Icon(Icons.message),
        //     label: 'Chats',
        //   ),
        //   BottomNavigationBarItem(
        //     icon: Icon(Icons.group_work),
        //     label: 'Channels',
        //   ),
        //   BottomNavigationBarItem(
        //     icon: Icon(Icons.account_box),
        //     label: 'Profile',
        //   ),
        // ],
        items: [
          Icon(Icons.add),
          Icon(Icons.heart_broken),
          Icon(Icons.abc)
        ],
      ),
    );
  }
}
