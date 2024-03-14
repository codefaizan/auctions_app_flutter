import 'package:bidding_app/Screens/About-Screen/views/about_screen.dart';
import 'package:bidding_app/Screens/Auctions-Screen/views/auctions_screen.dart';
import 'package:bidding_app/Screens/Bids-Screen/views/bids_screen.dart';
import 'package:bidding_app/base/resizer/fetch_pixels.dart';
import 'package:bidding_app/resources/app_images.dart';
import 'package:bidding_app/constants/tConstants.dart';
import 'package:bidding_app/Screens/ContactUs-Screen/views/contactus_screen.dart';
import 'package:bidding_app/Screens/Chats-Screen/views/chats_screen.dart';
import 'package:bidding_app/Screens/Privacy-Policy-Screen/views/privacy_policy_screen.dart';
import 'package:bidding_app/Screens/Products-Screen/views/products_screen.dart';
import 'package:bidding_app/constants/app_texts.dart';
import 'package:bidding_app/widgets/theme-constants/theme.dart';
import 'package:bidding_app/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: BoldTextWidget(
          text: AppTexts.profile,
          fontSize: FetchPixels.getPixelHeight(22),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              heightFactor: FetchPixels.getPixelHeight(1.5),
              child: Stack(children: [
                CircleAvatar(
                  radius: FetchPixels.getPixelHeight(85),
                  foregroundImage:
                      AssetImage('assets/images/intro_slider_img1.png'),
                ),
                Positioned(
                  bottom: 1,
                  right: 1,
                  child: Container(
                    height: FetchPixels.getPixelHeight(50),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                        border: Border.all(
                            color: const Color.fromARGB(255, 208, 201, 201)
                            )),
                    child: IconButton(
                        padding: EdgeInsets.zero,
                        onPressed: () {},
                        icon: const Icon(Icons.mode_edit_outlined)),
                  ),
                )
              ]),
            ),
            SizedBox(height: FetchPixels.getPixelHeight(20),),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>const AuctionsScreen()));
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      //width: 50,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        children: [
                          Image.asset(
                            AppImages.logo,
                            height: FetchPixels.getPixelHeight(30),
                            color: Colors.black,
                          ),
                          RegularTextWidget(text: AppTexts.auctions, fontSize: FetchPixels.getPixelHeight(19))
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: FetchPixels.getPixelWidth(10),
                ),
                Expanded(
                  child: InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>const BidsScreen()));
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        children: [
                          Image.asset(
                            AppImages.logo,
                            height: FetchPixels.getPixelHeight(30),
                            color: Colors.black,
                          ),
                          RegularTextWidget(text: AppTexts.bids, fontSize: FetchPixels.getPixelHeight(19))
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: FetchPixels.getPixelWidth(10),
                ),
                Expanded(
                  child: InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>const ProductsScreen()));
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        children: [
                          Image.asset(AppImages.productsIcon, height: FetchPixels.getPixelHeight(30)),
                          RegularTextWidget(text: AppTexts.products, fontSize: FetchPixels.getPixelHeight(19))
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: FetchPixels.getPixelHeight(10),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: FetchPixels.getPixelHeight(4)),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(10)),
                    child: TextButton.icon(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>const ChatsScreen()));
                        },
                        icon: Container(
                          padding: EdgeInsets.all(FetchPixels.getPixelHeight(5)),
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle, color: defaultThemeColor),
                          child: Icon(
                            Icons.mail_rounded,
                            color: Colors.white,
                            size: FetchPixels.getPixelHeight(17),
                          ),
                        ),
                        label: RegularTextWidget(
                          text: AppTexts.chats, fontSize: FetchPixels.getPixelHeight(19)
                        )),
                  ),
                ),
                SizedBox(
                  width: FetchPixels.getPixelHeight(15),
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: FetchPixels.getPixelHeight(4)),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(10)),
                    child: TextButton.icon(
                        onPressed: () {},
                        icon: Container(
                          padding: EdgeInsets.all(FetchPixels.getPixelHeight(1)),
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle, color: defaultThemeColor),
                          child: Icon(
                            Icons.add,
                            color: Colors.white,
                            size: FetchPixels.getPixelHeight(24),
                          ),
                        ),
                        label: RegularTextWidget(
                          text: AppTexts.addProducts, fontSize: FetchPixels.getPixelHeight(19)
                        )),
                  ),
                )
              ],
            ),
            SizedBox(height: FetchPixels.getPixelHeight(10)),
            BoldTextWidget(text: AppTexts.profile.toUpperCase(),
                fontSize: FetchPixels.getPixelHeight(22)),
            SizedBox(height: FetchPixels.getPixelHeight(10)),
            Container(
              padding: EdgeInsets.all(FetchPixels.getPixelHeight(11)),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RegularTextWidget(
                    text: AppTexts.name,
                    fontSize: FetchPixels.getPixelHeight(19)
                  ),
                  RegularTextWidget(
                    text: 'Faizan Ahmad',
                    fontSize: FetchPixels.getPixelHeight(19)
                  )
                ],
              ),
            ),
            SizedBox(height: FetchPixels.getPixelHeight(10)),
            Container(
              padding: EdgeInsets.all(FetchPixels.getPixelHeight(11)),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RegularTextWidget(
                    text: AppTexts.email,
                    fontSize: FetchPixels.getPixelHeight(19)
                  ),
                  RegularTextWidget(
                    text: 'faizan2002a@gmail.com',
                    fontSize: FetchPixels.getPixelHeight(19)
                  )
                ],
              ),
            ),
            SizedBox(height: FetchPixels.getPixelHeight(10)),
            Container(
              padding: EdgeInsets.all(FetchPixels.getPixelHeight(11)),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RegularTextWidget(
                    text: AppTexts.phNumberHash,
                    fontSize: FetchPixels.getPixelHeight(19)
                  ),
                  RegularTextWidget(
                    text: '+92 303 0752535',
                    fontSize: FetchPixels.getPixelHeight(17)
                  )
                ],
              ),
            ),
            SizedBox(
              height: FetchPixels.getPixelHeight(10),
            ),
            BoldTextWidget(text: AppTexts.settings,
                fontSize: FetchPixels.getPixelHeight(22)),
            TextButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const AboutUsScreen()));
                },
                child:  RegularTextWidget(
                  text: AppTexts.aboutUs,
                  fontSize: FetchPixels.getPixelHeight(19)
                )),
            TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ContactUsScreen()));
                },
                child:  RegularTextWidget(
                  text: AppTexts.contactUs,
                  fontSize: FetchPixels.getPixelHeight(19)
                )),
            TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const PrivacyPolicyScreen()));
                },
                child:  RegularTextWidget(
                  text: AppTexts.termsPrivacy,
                  fontSize: FetchPixels.getPixelHeight(19)
                )),
            TextButton(
                onPressed: () {
                  ShowBottomSheets(AppTexts.deleteAccount,
                      AppTexts.deleteConfirmation, context);
                },
                child:  RegularTextWidget(
                  text: AppTexts.deleteAccount,
                  fontSize: FetchPixels.getPixelHeight(19)
                )),
            TextButton(
                onPressed: () {
                  ShowBottomSheets(
                      AppTexts.logOut, AppTexts.logoutConfirmation, context);
                },
                child:  RegularTextWidget(
                  text: AppTexts.logOut,
                  fontSize: FetchPixels.getPixelHeight(19),
                  color: Color(0xFFED0006),
                ))
          ],
        ),
      ),
    );
  }

  void ShowBottomSheets(String title, String subTitle, BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext) => Container(
              padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
              
                children: [
                  BoldTextWidget(text: title, fontSize: 21),
                  SizedBox(height: 10,),
                  RegularTextWidget(text: subTitle, fontSize: 15),
                  SizedBox(height: 10,),
                  ElevatedButton(
                    onPressed: () {},
                    child: BoldTextWidget(
                      text: AppTexts.no,
                    ),
                  ),
                  SizedBox(height: 10,),
                  OutlinedButton(
                    onPressed: () {},
                    child: BoldTextWidget(
                      text: AppTexts.yes,
                    ),
                  )
                ],
              ),
            ));
  }
}
