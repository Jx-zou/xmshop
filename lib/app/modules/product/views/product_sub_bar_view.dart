import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/screen_adapter.dart';
import '../controllers/product_controller.dart';

class ProductSubBarView extends GetView<ProductController> {
  const ProductSubBarView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenAdapter.height(120),
      width: ScreenAdapter.width(1080),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(
            width: ScreenAdapter.height(2),
            color: const Color.fromRGBO(244, 244, 244, 1),
          ),
        ),
      ),
      child: Row(
        children: controller.subHeaderList
            .map(
              (value) => Obx(
                () => Expanded(
                  flex: 1,
                  child: InkWell(
                    onTap: () {
                      controller.onSubBannerTap(value['id']);
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: ScreenAdapter.height(16),
                      ),
                      child: Text(
                        "${value['title']}",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: controller.selectId.value == value['id']
                              ? Colors.orange
                              : Colors.black45,
                          fontSize: ScreenAdapter.fontSize(38),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
