import 'package:bidding_app/Models/ProfileData.dart';
import 'package:bidding_app/Screens/About-Screen/views/about_screen.dart';
import 'package:bidding_app/Screens/Auctions-Screen/views/auctions_screen.dart';
import 'package:bidding_app/Screens/Auth/Login-Screen/views/login_screen.dart';
import 'package:bidding_app/Screens/Auth/Signup-Screen/views/signup_screen.dart';
import 'package:bidding_app/Screens/Bids-Screen/views/bids_screen.dart';
import 'package:bidding_app/Screens/Edit-Profile-Screen/views/edit_profile_screen.dart';
import 'package:bidding_app/Screens/New-Product-Screen/views/new_product_screen.dart';
import 'package:bidding_app/base/resizer/fetch_pixels.dart';
import 'package:bidding_app/base/resources/app_images.dart';
import 'package:bidding_app/Screens/ContactUs-Screen/views/contactus_screen.dart';
import 'package:bidding_app/Screens/Chats-Screen/views/chats_screen.dart';
import 'package:bidding_app/Screens/Privacy-Policy-Screen/views/privacy_policy_screen.dart';
import 'package:bidding_app/base/resources/app_texts.dart';
import 'package:bidding_app/base/widget_utils.dart';
import 'package:bidding_app/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import '../../../base/resources/resources.dart';
import '../widgets/border_button_widget.dart';
import '../widgets/profile_bottom_sheet.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
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
                  radius: FetchPixels.getPixelHeight(80),
                  foregroundImage:
                      AssetImage(demoProfileData.image),
                ),
                Positioned(
                  bottom: 1,
                  right: 1,
                  child: Container(
                    height: FetchPixels.getPixelHeight(40),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: R.colors.whiteColor,
                        border: Border.all(
                            color: const Color.fromARGB(255, 208, 201, 201)
                            )),
                    child: IconButton(
                        padding: EdgeInsets.zero,
                        onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => EditProfileScreen(),)).then((_) => setState((){})),
                        icon: const Icon(Icons.mode_edit_outlined)),
                  ),
                )
              ]),
            ),
            SizedBox(height: FetchPixels.getPixelHeight(20),),
            Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=>const AuctionsScreen())),
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: FetchPixels.getPixelHeight(4)),
                      decoration: BoxDecoration(
                        color: R.colors.bgColor,
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(10)
                      ),
                      child: Column(children: [
                        getAssetImage(AppImages.logo, height: FetchPixels.getPixelHeight(27), color: R.colors.blackColor),
                        RegularTextWidget(text: AppTexts.auction, fontSize: FetchPixels.getPixelHeight(17))
                      ],),
                    ),
                  ),
                ),
                getHorSpace(FetchPixels.getPixelWidth(10)),
                Expanded(
                  child: InkWell(
                    onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=>const BidsScreen())),
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: FetchPixels.getPixelHeight(4)),
                      decoration: BoxDecoration(
                          color: R.colors.bgColor,
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(10)
                      ),
                      child: Column(children: [
                        getAssetImage(AppImages.logo, height: FetchPixels.getPixelHeight(27), color: R.colors.blackColor),
                        RegularTextWidget(text: AppTexts.bids, fontSize: FetchPixels.getPixelHeight(17))
                      ],),
                    ),
                  ),
                ),
              ],
            ),
            getVerSpace(FetchPixels.getPixelWidth(10)),
            Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=>const ChatsScreen())),
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: FetchPixels.getPixelHeight(4)),
                      decoration: BoxDecoration(
                          color: R.colors.bgColor,
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(10)
                      ),
                      child: Column(children: [
                        getAssetImage(AppImages.chatsIcon, height: FetchPixels.getPixelHeight(28)),
                        RegularTextWidget(text: AppTexts.chats, fontSize: FetchPixels.getPixelHeight(17))
                      ],),
                    ),
                  ),
                ),
                getHorSpace(FetchPixels.getPixelWidth(10)),
                Expanded(
                  child: InkWell(
                    onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=> NewProductScreen())),
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: FetchPixels.getPixelHeight(4)),
                      decoration: BoxDecoration(
                          color: R.colors.bgColor,
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(10)
                      ),
                      child: Column(children: [
                        getAssetImage(AppImages.addIcon, height: FetchPixels.getPixelHeight(28)),
                        RegularTextWidget(text: AppTexts.addProducts, fontSize: FetchPixels.getPixelHeight(17))
                      ],),
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(
              height: FetchPixels.getPixelHeight(10),
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
                    text: demoProfileData.name,
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
                    text: demoProfileData.email,
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
                    text: demoProfileData.phoneNumber,
                    fontSize: FetchPixels.getPixelHeight(19)
                  )
                ],
              ),
            ),
            SizedBox(
              height: FetchPixels.getPixelHeight(10),
            ),
            BoldTextWidget(text: AppTexts.settings,
                fontSize: FetchPixels.getPixelHeight(22)),
            getVerSpace(FetchPixels.getPixelHeight(10)),
            expandedButtonWidget(AppTexts.aboutUs, ()=>Navigator.push(context,
                MaterialPageRoute(builder: (context) => const AboutUsScreen()))),
            getVerSpace(FetchPixels.getPixelHeight(10)),

            expandedButtonWidget(AppTexts.contactUs, () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ContactUsScreen()))),
        getVerSpace(FetchPixels.getPixelHeight(10)),

            expandedButtonWidget(AppTexts.termsPrivacy, () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const PrivacyPolicyScreen()))),
            getVerSpace(FetchPixels.getPixelHeight(10)),
            expandedButtonWidget(AppTexts.deleteAccount, () => profileBottomSheet(AppTexts.deleteAccount,
                AppTexts.deleteConfirmation, context,
                    ()=> Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>SignupScreen()), (route) => false),
                    ()=>Navigator.of(context).pop()
            )),
            getVerSpace(FetchPixels.getPixelHeight(10)),
            expandedButtonWidget(AppTexts.logOut, () => profileBottomSheet(
                AppTexts.logOut, AppTexts.logoutConfirmation, context,
                    ()=> Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>LoginScreen()), (route) => false),
                    ()=>Navigator.of(context).pop(),
            ),
                R.colors.redColor
            )
          ],
        ),
      ),
    );
  }




}
