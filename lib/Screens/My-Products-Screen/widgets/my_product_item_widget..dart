import 'package:bidding_app/base/resizer/fetch_pixels.dart';
import 'package:bidding_app/resources/app_images.dart';
import 'package:bidding_app/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class MyProductItemWidget extends StatelessWidget {
  const MyProductItemWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(FetchPixels.getPixelHeight(8)),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                image: const DecorationImage(
                    image: AssetImage(
                        'assets/images/auction-products/item_img_3.png'),
                    fit: BoxFit.cover),
              ),
              child: Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                    icon: Image.asset(AppImages.editBtnIcon),
                    onPressed: () {},
                  )),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: BoldTextWidget(
                  text: 'Kawasaki Bike',
                  fontSize: FetchPixels.getPixelHeight(12),
                ),
              ),
              BoldTextWidget(
                text: '€720',
                fontSize: FetchPixels.getPixelHeight(12),
              ),
            ],
          ),
          RegularTextWidget(
            text:
                'Lorem ipsum dolor sit amet. Eum doloremque cumque aut ullam aperiam aut quisquam debitis.',
            overFlow: TextOverflow.clip,
            maxLines: 2,
          )
        ],
      ),
    );
  }
}
