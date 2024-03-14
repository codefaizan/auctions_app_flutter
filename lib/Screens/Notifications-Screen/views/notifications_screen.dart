import 'package:bidding_app/Models/Notification.dart';
import 'package:bidding_app/base/resizer/fetch_pixels.dart';
import 'package:bidding_app/constants/app_texts.dart';
import 'package:bidding_app/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: BoldTextWidget(
          text: AppTexts.notifications,
          fontSize: FetchPixels.getPixelHeight(22)
        ),
        centerTitle: true,
      ),
      body: Padding(
          padding: EdgeInsets.all(FetchPixels.getPixelHeight(20)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                  child: ListView(
                children: [
                  BoldTextWidget(
                    text: AppTexts.today,
                    fontSize: FetchPixels.getPixelHeight(20)
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: const Color(0xFFECECEC),
                        borderRadius: BorderRadius.circular(15)),
                    child: ListTile(
                      title: RegularTextWidget(
                        text: '30% Special Discount!',
                        fontSize: FetchPixels.getPixelHeight(22), fontWeight: FontWeight.w900
                      ),
                      subtitle: RegularTextWidget(text: 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered'),
                    ),
                  ),
                  SizedBox(height: FetchPixels.getPixelHeight(17)),
                  Container(
                    decoration: BoxDecoration(
                        color: const Color(0xFFECECEC),
                        borderRadius: BorderRadius.circular(15)),
                    child: ListTile(
                      title: RegularTextWidget(
                        text: '30% Special Discount!',
                        fontSize: FetchPixels.getPixelHeight(22), fontWeight: FontWeight.w900
                      ),
                      subtitle: RegularTextWidget(text: 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered'),
                    ),
                  ),
                  BoldTextWidget(
                    text: AppTexts.yesterday,
                    fontSize: FetchPixels.getPixelHeight(20)
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: const Color(0xFFECECEC),
                        borderRadius: BorderRadius.circular(15)),
                    child: ListTile(
                      title: RegularTextWidget(
                        text: '30% Special Discount!',
                        fontSize: FetchPixels.getPixelHeight(22), fontWeight: FontWeight.w900
                      ),
                      subtitle: RegularTextWidget(text: 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered'),
                    ),
                  ),
                  SizedBox(height: FetchPixels.getPixelHeight(17)),
                  Container(
                    decoration: BoxDecoration(
                        color: const Color(0xFFECECEC),
                        borderRadius: BorderRadius.circular(15)),
                    child: ListTile(
                      title: RegularTextWidget(
                        text: '30% Special Discount!',
                        fontSize: FetchPixels.getPixelHeight(22), fontWeight: FontWeight.w900
                      ),
                      subtitle: RegularTextWidget(text: 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered'),
                    ),
                  ),
                ],
              )),
            ],
          )),
    );
  }
}

class NotificationTileWidget extends StatelessWidget {
  final NotificationModel notification;

  const NotificationTileWidget({
    super.key,
    required this.notification,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          color: const Color(0xFFECECEC),
          borderRadius: BorderRadius.circular(15)),
      child: ListTile(
        title: RegularTextWidget(
          text: notification.notificationTitle,
          fontSize: 20, fontWeight: FontWeight.w700
        ),
        subtitle: RegularTextWidget(text: notification.notificationDescription),
      ),
    );
  }
}
