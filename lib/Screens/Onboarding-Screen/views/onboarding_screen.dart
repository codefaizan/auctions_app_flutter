import 'package:bidding_app/Screens/Auth/Signup-Screen/views/signup_screen.dart';
import 'package:bidding_app/base/resizer/fetch_pixels.dart';
import 'package:bidding_app/resources/app_images.dart';
import 'package:bidding_app/constants/app_texts.dart';
import 'package:bidding_app/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});
  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();

}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  void dispose() {
    super.dispose();
  }
  final PageController _controller = PageController();

  bool isLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: FetchPixels.getPixelHeight(20), horizontal: FetchPixels.getPixelWidth(20)),
        child: Column(children: [
          Align(
            alignment: Alignment.topRight,
            child: TextButton(
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => const SignupScreen(), settings: RouteSettings(name: '/signup')));
                },
                child: RegularTextWidget(
                  text: isLastPage ? '' : AppTexts.skip,
                  fontSize: FetchPixels.getPixelHeight(19), color: Colors.black,
                )),
          ),
          Expanded(
            child: PageView(
              // physics: NeverScrollableScrollPhysics(),
              padEnds: false,
              controller: _controller,
              scrollDirection: Axis.horizontal,
              onPageChanged: (index) {
                setState(() {
                  isLastPage = index == 2;
                });
              },
              children: [
                BuildIntroPage(
                  title: AppTexts.slide1Title,
                  description:
                      AppTexts.slide1Detail,
                  img: AppImages.slide1Image, imgHeight: FetchPixels.getPixelHeight(400),
                ),
                BuildIntroPage(
                    title: AppTexts.slide2Title,
                    description:
                        AppTexts.slide2Detail,
                    img: AppImages.slide2Image, imgHeight: FetchPixels.getPixelHeight(300),
                    ),
                BuildIntroPage(
                    title: AppTexts.slide3Title,
                    description:
                        AppTexts.slide3Detail,
                    img: AppImages.slide3Image, imgHeight: FetchPixels.getPixelHeight(350),
                    )
              ],
            ),
          ),
          ElevatedButton(
              onPressed: isLastPage
                  ? () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignupScreen(), settings: RouteSettings(name: '/signup')));
                    }
                  : () {
                      _controller.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeIn);
                    },
              
              child: BoldTextWidget(
                text: isLastPage ? AppTexts.signup : AppTexts.next,
                
              )),
          SizedBox(
            height: 20,
          ),
          Center(
              child: SmoothPageIndicator(
                  controller: _controller,
                  count: 3,
                  effect: WormEffect(
                      activeDotColor: Theme.of(context).primaryColor,
                      dotHeight: 10,
                      dotWidth: 10,
                      dotColor: const Color.fromARGB(255, 217, 217, 217)
                      //dotColor: Color.fromARGB(255, 226, 133, 2),

                      ))),
        ]),
      ),
    );
  }
}

class BuildIntroPage extends StatelessWidget {
  final String title;
  final String description;
  final String img;
  final double? imgHeight;
  const BuildIntroPage(
      {super.key,
      required this.title,
      required this.description,
      required this.img,
      this.imgHeight
      });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(img, height: imgHeight,),
        SizedBox(height: FetchPixels.getPixelHeight(55)),
        Align(
          alignment: Alignment.centerLeft,
          child: BoldTextWidget(
            text: title,
            fontSize: FetchPixels.getPixelHeight(30),
            // fontWeight: FontWeight.w900
          ),
        ),
        SizedBox(height: FetchPixels.getPixelHeight(23)),
        RegularTextWidget(
          text: description,
          fontSize: FetchPixels.getPixelHeight(19),                 
        ),
      ],
    );
  }
}
