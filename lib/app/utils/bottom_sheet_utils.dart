import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../common/icons/xmshop_icons.dart';
import '../common/views/widgets/close_bottom_sheet.dart';
import '../models/goods_details_model.dart';
import '../widgets/bottom_button.dart';
import '../widgets/selected_bottom_sheet.dart';
import 'screen_adapter.dart';

class BottomSheetUtils {
  BottomSheetUtils._();

  static CloseBottomSheet _closeBottomSheet({Widget? child}) {
    return CloseBottomSheet(
        width: ScreenAdapter.width(1080),
        height: ScreenAdapter.height(1680),
        icon: Icon(XmshopIcons.close, size: ScreenAdapter.fontSize(20), color: Colors.black87),
        closed: () => Get.back(),
        child: child);
  }

  static void goodsSelectedBottomSheet({VoidCallback? onPressed, Widget? bottom, bool? showNumWidget, GoodsDetailsModel? goodsDetailsModel, Function(String selectedAttr, int shopNum)? close}) {
    Get.bottomSheet(_closeBottomSheet(child: SelectedBottomSheet(
          goodsDetailsModel: goodsDetailsModel,
          showNumWidget: showNumWidget,
          close: close,
          bottom: bottom ??
              Padding(
                  padding: EdgeInsets.all(ScreenAdapter.width(40)),
                  child: BottomButton(
                      title: "确定",
                      colors: [Colors.deepOrange.withOpacity(0.5), Colors.redAccent],
                      onPressed: onPressed ?? () {}))
        )),
        isScrollControlled: true,
        elevation: 0);
  }

  static void closeBottomSheet({Widget? child}) {
    Get.bottomSheet(_closeBottomSheet(child: child), isScrollControlled: true, elevation: 0);
  }
}
