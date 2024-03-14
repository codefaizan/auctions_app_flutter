import 'package:bidding_app/Screens/Messages-Screen/views/messages_screen.dart';
import 'package:bidding_app/base/resizer/fetch_pixels.dart';
import 'package:bidding_app/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class ChatTileWidget extends StatelessWidget {
  final String title;
  final String subTitle;
  final bool hasNewMessage;

  const ChatTileWidget(
      {super.key, required this.title, required this.subTitle, required this.hasNewMessage});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(15)
      ),
      child: ListTile(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=>const MessagesScreen()));
        },
        title: BoldTextWidget(text: title, fontSize: FetchPixels.getPixelHeight(18)),
        subtitle: RegularTextWidget(text: subTitle, fontSize: FetchPixels.getPixelHeight(17), maxLines: 2, overFlow: TextOverflow.clip,),
        leading: CircleAvatar(
            radius: FetchPixels.getPixelHeight(37),
            foregroundImage: AssetImage('assets/images/profile_img.png')),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            (hasNewMessage)?
            Container(
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: Colors.black),
                child: Padding(
                    padding: EdgeInsets.all(8),
                    child: RegularTextWidget(text: '1', color: Colors.white,)
                    )
                    ) : const Spacer(),
             RegularTextWidget(
              text: '02:00pm',
              color: Colors.grey,
            )
          ],
        ),
      ),
    );
  }
}