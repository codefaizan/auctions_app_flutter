import 'package:bidding_app/Screens/Chats-Screen/demoItems.dart';
import 'package:flutter/material.dart';

Widget dismiss_widget(BuildContext context, Widget child, int tileIndex){
  return Dismissible(
      key: UniqueKey(),
    confirmDismiss: (direction) {
      return showDialog(context: context, builder: (context)=>
          AlertDialog(
            title: const Text('Are you sure you want to delete?'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context, false),
                child: const Text('No'),
              ),
              TextButton(
                onPressed: () => Navigator.pop(context, true),
                child: const Text('Yes'),
              )
            ],
          ));
    },
      onDismissed: (direction) {
        demoChatList.removeAt(tileIndex);
      },
    direction: DismissDirection.endToStart,
    background: ColoredBox(color: Colors.redAccent,
        child: Align(alignment: Alignment.centerRight,
            child: Padding(padding: EdgeInsets.only(right: 20),
                child: Icon(Icons.delete, color: Colors.white,)))),
    child: child
  );
}
