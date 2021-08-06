import 'package:chat_app/models/message_model.dart';
import 'package:chat_app/widgets/category_select.dart';
import 'package:chat_app/widgets/favorite_contans.dart';
import 'package:chat_app/widgets/recent_chats.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.red,
        appBar: buildHomeAppBar(),
        body: Column(
          children: [
            CategorySelect(),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: Theme.of(context).accentColor,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(30),
                      topLeft: Radius.circular(30),
                    )),
                child: Column(
                  children: [
                    FavoriteContacts(),
                    RecentChat(),
                  ],
                ),
              ),
            )
          ],
        ));
  }

  AppBar buildHomeAppBar() {
    return AppBar(
      backgroundColor: Colors.red,
      leading: IconButton(
        onPressed: () {},
        icon: Icon(Icons.menu),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.search),
        )
      ],
      //backgroundColor: Colors.red,
      elevation: 0,
      centerTitle: true,
      title: Text(
        'Chats',
        style: GoogleFonts.pacifico(),
      ),
    );
  }
}
