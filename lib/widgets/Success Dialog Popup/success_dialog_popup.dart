import 'package:bidding_app/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class SuccessPopup extends StatelessWidget {
  String title;
  String subTitle;
  SuccessPopup({super.key, required this.title, required this.subTitle});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          CardDialog(
            title: title,
            subtitle: subTitle,
          ),
          Positioned(child: Image.asset('assets/icons/success_dialog_img.png'))
        ],
      ),
    );
  }
}

class CardDialog extends StatelessWidget {
  String title;
  String subtitle;
  CardDialog({super.key, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 90, bottom: 30, left: 25, right: 25),
      margin: const EdgeInsets.only(top: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          BoldTextWidget(
            text: title,
            fontSize: 20
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            subtitle,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 16),
          )
        ],
      ),
    );
  }
}
