import 'package:bidding_app/Models/Auction.dart';
import 'package:bidding_app/Models/Product.dart';
import 'package:bidding_app/base/resizer/fetch_pixels.dart';
import 'package:bidding_app/base/widget_utils.dart';
import 'package:bidding_app/widgets/AuctionContainerWidget.dart';
import 'package:bidding_app/Screens/Home-Screen/widgets/search_bar.dart';
import 'package:bidding_app/base/resources/app_images.dart';
import 'package:bidding_app/Screens/Notifications-Screen/views/notifications_screen.dart';
import 'package:bidding_app/base/resources/app_texts.dart';
import 'package:bidding_app/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import '../../../widgets/ProductContainerWidget.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  late PageController auctionsListPageController;
  int currentPage = 0;

@override
  void initState() {
  super.initState();
  auctionsListPageController = PageController(
    initialPage: currentPage,
    keepPage: false,
    viewportFraction: 0.68,
  );
  }
  @override
  void dispose() {
    auctionsListPageController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: BoldTextWidget(
            text: AppTexts.appName,
            fontSize: FetchPixels.getPixelHeight(22),
          ),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const NotificationsScreen()));
                },
                icon: Icon(
                  Icons.notifications_none,
                  size: FetchPixels.getPixelHeight(33),
                ))
          ],
        ),
        body: ListView(
          children: [
            SearchBarWidget(),

           getVerSpace(FetchPixels.getPixelHeight(20),),

            // PROMO IMAGE
            getAssetImage(AppImages.homepagePromoImage),
            SizedBox(height: FetchPixels.getPixelHeight(20)),

            // Auctions
            BoldTextWidget(
              text: AppTexts.auctions,
              fontSize: FetchPixels.getPixelHeight(25),
            ),
            SizedBox(
              height: FetchPixels.getPixelHeight(330),
              child: PageView.builder(

                itemCount: demoProductsList.length,
                padEnds: false,
                  controller: auctionsListPageController,
                  itemBuilder: (context, index)=> builder(index)
              ),
            ),

            // Products
            BoldTextWidget(
              text: AppTexts.products,
              fontSize: FetchPixels.getPixelHeight(25),
            ),

            Wrap(
              runSpacing: FetchPixels.getPixelHeight(5),
              alignment: WrapAlignment.spaceBetween,

              children: List.generate(demoProductsList.length, (index) {
              return SizedBox(
                width: FetchPixels.getWidthPercentSize(45),
                height: FetchPixels.getPixelHeight(300),
                child: ProductContainerWidget(
                  productData: demoProductsList[index],
                  itemIndex: index,
                  context: context,
                ),
              );
            } ) ,),
          ],
        ));
  }

  builder(int index) {
    return AnimatedBuilder(
      animation: auctionsListPageController,
      builder: (context, child) {
        double value = 1.0;
        if (auctionsListPageController.position.haveDimensions) {
          value = auctionsListPageController.page! - index;
          value = (1 - (value.abs() * 0.43)).clamp(0.0, 1.0);
        }

        return Center(
          child: SizedBox(
            height: Curves.easeOut.transform(value) * 300,
            width: Curves.easeOut.transform(value) * 250,
            child: child,
          ),
        );
      },
          child: AuctionContainerWidget(
            auctionData: demoAuctionList[index],
            itemIndex: index,
            context: context,
          )
    );
  }
}
