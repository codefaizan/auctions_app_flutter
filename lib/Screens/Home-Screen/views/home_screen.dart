import 'package:bidding_app/Models/Auction.dart';
import 'package:bidding_app/Models/Product.dart';
import 'package:bidding_app/base/resizer/fetch_pixels.dart';
import 'package:bidding_app/base/widget_utils.dart';
import 'package:bidding_app/widgets/AuctionContainerWidget.dart';
import 'package:bidding_app/Screens/Home-Screen/widgets/search_bar.dart';
import 'package:bidding_app/resources/app_images.dart';
import 'package:bidding_app/Screens/Notifications-Screen/views/notifications_screen.dart';
import 'package:bidding_app/resources/app_texts.dart';
import 'package:bidding_app/widgets/text_widget.dart';
// import 'package:bidding_app/models/DemoItems.dart';
import 'package:flutter/material.dart';

import '../../../widgets/ProductContainerWidget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
                icon: const Icon(
                  Icons.notifications_none,
                  size: 30,
                ))
          ],
        ),
        body: ListView(
          children: [
            SearchBarWidget(),

           getVerSpace(FetchPixels.getPixelHeight(20),),

            // PROMO IMAGE
            Image.asset(AppImages.homepagePromoImage),
            SizedBox(height: FetchPixels.getPixelHeight(20)),

            // Auctions
            BoldTextWidget(
              text: AppTexts.auctions,
              fontSize: FetchPixels.getPixelHeight(25),
            ),
            SizedBox(
              height: FetchPixels.getPixelHeight(330),
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: demoProductsList.length,
                itemBuilder: (context, index) {
                  return AuctionContainerWidget(
                    auctionData: demoAuctionList[index],
                    itemIndex: index,
                    context: context,
                  );
                },
                separatorBuilder: (context, index) {
                  return Divider(
                    indent: FetchPixels.getPixelWidth(12),
                  );
                },
              ),
            ),

            // Products
            BoldTextWidget(
              text: AppTexts.products,
              fontSize: FetchPixels.getPixelHeight(25),
            ),
            // SizedBox(
            //   height: FetchPixels.getPixelHeight(320),
            //   child: ListView.separated(
            //     itemCount: demoItemsList.length,
            //     scrollDirection: Axis.horizontal,
            //
            //     itemBuilder: (context, index) {
            //       return CreateNewItem(
            //         item: demoItemsList[index],
            //         // itemsData: demoItems,
            //         itemIndex: index,
            //         itemCategory: ItemCategories.products,
            //         context: context,
            //       );
            //     },
            //
            //     separatorBuilder: (context, index) {
            //       return Divider(
            //         indent: FetchPixels.getPixelWidth(12),
            //       );
            //     },
            //   ),
            // ),



            // Expanded(
            //   child: GridView.builder(
            //
            //     itemCount: 5,
            //       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, mainAxisSpacing: 10, crossAxisSpacing: 10),
            //       itemBuilder: (context, index) {
            //         return
            //             Container(color: Colors.red, height: 100,width: 100,);
            //           // CreateNewItem(itemIndex: index, itemCategory: ItemCategories.products, context: context, item: demoItemsList[index]);
            //       },),
            // )


            Wrap(
              runSpacing: 0,
              spacing: 0,
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
}
