import 'package:bidding_app/widgets/Success%20Dialog%20Popup/success_dialog_popup.dart';
import 'package:bidding_app/base/resources/app_texts.dart';
import 'package:bidding_app/widgets/text_widget.dart';
import 'package:flutter/material.dart';

import '../../../base/resources/resources.dart';

class ContactUsScreen extends StatelessWidget {
  TextEditingController controller = TextEditingController();

  ContactUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: BoldTextWidget(
          text: AppTexts.contactUs,
          fontSize: 19
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
        child: Form(
            child: ListView(
          children: [
            TextFormField(
              controller: controller..text = 'Hauptsache-Platz@help.com',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: R.colors.theme,
                  decoration: TextDecoration.underline,
                  decorationColor: R.colors.theme),
              readOnly: true,
              decoration: const InputDecoration(
                hintText: AppTexts.emailTo,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              decoration: const InputDecoration(
                  hintText: AppTexts.subject, hintStyle: TextStyle(fontSize: 17)),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              maxLines: 3,
              decoration: const InputDecoration(
                  hintText: AppTexts.message, hintStyle: TextStyle(fontSize: 17)),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    Future.delayed(const Duration(seconds: 5), () {
                      Navigator.of(context).pop();
                    });
                    return SuccessPopup(
                      title: AppTexts.congratulations,
                      subTitle:
                          AppTexts.messageSentToHelpCenter,
                    );
                  },
                );
              },
              child: BoldTextWidget(text: AppTexts.send),
            ),
          ],
        )),
      ),
    );
  }
}
