import 'package:bidding_app/Models/ChatMessage.dart';
import 'package:bidding_app/Screens/Messages-Screen/widgets/message_widget.dart';
import 'package:bidding_app/base/resizer/fetch_pixels.dart';
import 'package:bidding_app/base/resources/app_images.dart';
import 'package:bidding_app/widgets/text_widget.dart';
import 'package:flutter/material.dart';

import '../../../base/resources/resources.dart';

class MessagesScreen extends StatefulWidget {
  const MessagesScreen({super.key});

  @override
  State<MessagesScreen> createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesScreen> {
  late TextEditingController _inputFieldController;
  late ScrollController _scrollController;

  @override
  void initState() {
    _inputFieldController = TextEditingController();
    _scrollController = ScrollController();
    super.initState();
  }

  @override
  void dispose() {
    _inputFieldController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Row(
          children: [
            CircleAvatar(
                radius: FetchPixels.getPixelHeight(25),
                foregroundImage: AssetImage('assets/images/profile_img.png')),
            SizedBox(
              width: FetchPixels.getPixelHeight(10),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BoldTextWidget(
                    text: 'Shop Name',
                    fontSize: FetchPixels.getPixelHeight(17)),
                RegularTextWidget(
                  text: 'Online',
                  fontSize: FetchPixels.getPixelHeight(15),
                ),
              ],
            )
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(FetchPixels.getPixelHeight(20)),
        child: Column(
          children: [
            Expanded(
              child: ListView.separated(
                controller: _scrollController,
                itemCount: demoMessages.length,
                itemBuilder: (context, index) {
                  return MessageWidget(message: demoMessages[index]);
                },
                separatorBuilder: (context, index) {
                  return SizedBox(height: FetchPixels.getPixelHeight(20));
                },
              ),
            ),
            MessageInputBar()
          ],
        ),
      ),
    );
  }

  Widget MessageInputBar() {
    return Container(
      margin: EdgeInsets.all(FetchPixels.getPixelHeight(8)),
      decoration: BoxDecoration(
          border: Border.all(color: R.colors.greyColor),
          borderRadius: BorderRadius.circular(15)),
      height: FetchPixels.getHeightPercentSize(7),
      child: SafeArea(
          child: Row(
        children: [
          IconButton(
              onPressed: () {},
              icon: Image.asset(
                AppImages.attachmentIcon,
                height: FetchPixels.getPixelHeight(26),
              )),
          Expanded(
              child: TextField(
            controller: _inputFieldController,
            decoration: InputDecoration(
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
            ),
          )),
          IconButton(
              onPressed: () {
                if (_inputFieldController.text.isNotEmpty) {
                  demoMessages.add(ChatMessage(
                      text: _inputFieldController.text,
                      messageType: ChatMessageType.text,
                      isSender: true));
                }

                _inputFieldController.text = '';

                setState(() {});
                _scrollController.animateTo(
                    _scrollController.position.maxScrollExtent,
                    curve: Curves.easeOut,
                    duration: const Duration(milliseconds: 300));
              },
              icon: Image.asset(AppImages.sendIcon))
        ],
      )),
    );
  }
}
