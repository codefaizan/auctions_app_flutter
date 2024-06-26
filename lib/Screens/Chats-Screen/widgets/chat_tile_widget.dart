import 'package:bidding_app/Screens/Chats-Screen/demoItems.dart';
import 'package:bidding_app/Screens/Messages-Screen/views/messages_screen.dart';
import 'package:bidding_app/base/resizer/fetch_pixels.dart';
import 'package:bidding_app/widgets/text_widget.dart';
import 'package:flutter/material.dart';

import '../../../base/resources/resources.dart';

class ChatTileWidget extends StatelessWidget {
  final ChatOverview chat;

  const ChatTileWidget(
      {required this.chat});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: R.colors.greyColor),
        borderRadius: BorderRadius.circular(15)
      ),
      child: ListTile(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=>const MessagesScreen()));
        },
        title: BoldTextWidget(text: chat.title, fontSize: FetchPixels.getPixelHeight(15)),
        subtitle: RegularTextWidget(text: chat.subTitle, fontSize: FetchPixels.getPixelHeight(15), maxLines: 2, overFlow: TextOverflow.clip,),
        leading: CircleAvatar(
            radius: FetchPixels.getPixelHeight(37),
            foregroundImage: AssetImage(chat.avatar)),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            (chat.hasNewMessage)?
            Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: R.colors.blackColor),
                child: Padding(
                    padding: EdgeInsets.all(8),
                    child: RegularTextWidget(text: '1', color: R.colors.whiteColor,)
                    )
                    ) : const Spacer(),
             RegularTextWidget(
              text: '02:00pm',
              color: R.colors.greyColor,
            )
          ],
        ),
      ),
    );
  }
}