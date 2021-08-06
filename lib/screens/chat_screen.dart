import 'package:chat_app/models/message_model.dart';
import 'package:chat_app/models/user_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  final User user;

  const ChatScreen({required this.user});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text(
          widget.user.name,
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.more_horiz),
            onPressed: () {},
          ),
        ],
      ),
      body: GestureDetector(
        onTap: (){
          FocusScope.of(context).unfocus();
        },
        child: Column(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30),
                    topLeft: Radius.circular(30),
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30),
                    topLeft: Radius.circular(30),
                  ),
                  child: ListView.builder(
                    reverse: true,
                    itemCount: messages.length,
                    itemBuilder: (context, index) {
                      final Message message = messages[index];
                      final bool is_me = (message.sender.id == currentUser.id);
                      return _buildMessage(message, is_me);
                    },
                  ),
                ),
              ),
            ),
            _buildSender(),
          ],
        ),
      ),
    );
  }

  Widget _buildMessage(Message message, bool is_me) {
    return Row(
      children: [
        Container(
          margin: is_me
              ? EdgeInsets.only(top: 8, bottom: 8, left: 70)
              : EdgeInsets.only(
                  top: 8,
                  bottom: 8,
                ),
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          width: MediaQuery.of(context).size.width * .75,
          decoration: BoxDecoration(
            color: is_me ? Theme.of(context).accentColor : Color(0xffffefee),
            borderRadius: is_me
                ? BorderRadius.only(
                    topLeft: Radius.circular(30),
                    bottomLeft: Radius.circular(30),
                  )
                : BorderRadius.only(
                    topRight: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                message.time,
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                    color: Colors.grey),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                message.text,
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.blueGrey,
                    fontSize: 16),
              ),
            ],
          ),
        ),
        !is_me
            ? IconButton(
                onPressed: () {},
                icon: message.isLiked
                    ? Icon(
                        Icons.favorite,
                        color: Colors.red,
                      )
                    : Icon(
                        Icons.favorite_border,
                        color: Colors.blueGrey,
                      ))
            : SizedBox.shrink(),
      ],
    );
  }

  Container _buildSender() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      color: Colors.white,
      child: Row(
        children: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.photo,
              size: 25,
              color: Theme.of(context).primaryColor,
            ),
          ),
          Expanded(
            child: TextField(
              cursorHeight: 30,
              textCapitalization: TextCapitalization.sentences,
              decoration: InputDecoration.collapsed(
                hintText: 'type your message...',

              ),
            ),
          ),
          IconButton(onPressed: (){}, icon:Icon(Icons.send,color: Theme.of(context).primaryColor,))
        ],
      ),
    );
  }
}
