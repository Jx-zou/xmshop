import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../common/views/widgets/gradient_button.dart';
import '../common/icons/xmshop_icons.dart';
import '../common/views/widgets/close_bottom_sheet.dart';
import '../models/goods_details_model.dart';
import '../widgets/selected_product_bottom_sheet.dart';
import 'screen_adapter.dart';

class BottomSheetUtils {
  BottomSheetUtils._();

  static CloseBottomSheet _closeBottomSheet({Widget? child}) {
    return CloseBottomSheet(
        width: ScreenAdapter.width(1080),
        height: ScreenAdapter.height(1680),
        icon: Icon(XmshopIcons.close,
            size: ScreenAdapter.fontSize(20), color: Colors.black87),
        closed: () => Get.back(),
        child: child);
  }

  static void goodsSelectedBottomSheet(
      {VoidCallback? onPressed,
      Widget? bottom,
      bool? showNumWidget,
      GoodsDetailsModel? goodsDetailsModel,
      Function(String selectedAttr, int shopNum)? close}) {
    Get.bottomSheet(
        _closeBottomSheet(
          child: SelectedProductBottomSheet(
              goodsDetailsModel: goodsDetailsModel,
              showNumWidget: showNumWidget,
              close: close,
              bottom: bottom ??
                  Padding(
                    padding: EdgeInsets.all(
                      ScreenAdapter.width(40),
                    ),
                    child: GradientButton(
                      gradient: LinearGradient(colors: [
                        Colors.deepOrange.withOpacity(0.5),
                        Colors.redAccent
                      ]),
                      onPressed: onPressed ?? () {},
                      child: Text(
                        "确定",
                        style: TextStyle(
                          fontSize: ScreenAdapter.fontSize(32),
                        ),
                      ),
                    ),
                  )),
        ),
        isScrollControlled: true,
        elevation: 0);
  }

  static void closeBottomSheet({Widget? child}) {
    Get.bottomSheet(_closeBottomSheet(child: child),
        isScrollControlled: true, elevation: 0);
  }
}
