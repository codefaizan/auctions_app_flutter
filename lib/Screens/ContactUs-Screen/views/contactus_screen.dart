import 'package:bidding_app/widgets/Success%20Dialog%20Popup/success_dialog_popup.dart';
import 'package:bidding_app/resources/app_texts.dart';
import 'package:bidding_app/resources/theme.dart';
import 'package:bidding_app/widgets/text_widget.dart';
import 'package:flutter/material.dart';

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
            child: Column(
          children: [
            TextFormField(
              controller: controller..text = 'Hauptsache-Platz@help.com',
              textAlign: TextAlign.center,
              style: const TextStyle(
                  color: defaultThemeColor,
                  decoration: TextDecoration.underline,
                  decorationColor: defaultThemeColor),
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
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: defaultThemeColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
              ),
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
