import 'package:flutter/material.dart';
import 'package:xmshop/app/views/select_wrap.dart';

import '../models/goods_details_model.dart';
import '../utils/https_client.dart';
import '../utils/screen_adapter.dart';
import 'button/shape_button.dart';
import 'counter.dart';

class ProductAttrBottomSheet extends StatefulWidget {
  final List<GoodsDetailsAttrModel> attrs;
  final int? shopNum;
  final String? id;
  final String? title;
  final String? pic;
  final double? price;
  final double? oldPrice;
  final Widget? bottom;
  final bool showCounter;

  const ProductAttrBottomSheet({
    required this.attrs,
    this.shopNum,
    this.id,
    this.pic,
    this.price,
    this.oldPrice,
    this.title,
    this.showCounter = true,
    this.bottom,
    super.key,
  });

  @override
  State<ProductAttrBottomSheet> createState() => _ProductAttrBottomSheetState();
}

class _ProductAttrBottomSheetState extends State<ProductAttrBottomSheet> {
  final Map<String, List<String?>> _selectedAttr = {
    'cate': <String>[],
    'selected': <String>[]
  };
  late int _shopNum;

  void _changeAttrSelected(cate, title) {
    setState(() {
      for (int i = 0; i < _selectedAttr['cate']!.length; i++) {
        if (_selectedAttr['cate']?[i] == cate) {
          _selectedAttr['selected']?[i] = title;
        }
      }
    });
  }

  void _initAttrSelected() {
    List<GoodsDetailsAttrModel>? attrs = widget.attrs;
    for (int i = 0; i < attrs.length; i++) {
      _selectedAttr['cate']?.add(attrs[i].cate);
      _selectedAttr['selected']?.add(attrs[i].list?[0]);
    }
  }

  @override
  void initState() {
    super.initState();
    _initAttrSelected();
    _shopNum = widget.shopNum ?? 1;
  }

  Widget _shopNumView() {
    return widget.showCounter
        ? Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(
              "购买数量",
              style: TextStyle(
                fontSize: ScreenAdapter.fontSize(35),
              ),
            ),
            Counter(onChange: (count) {
              _shopNum = count;
            }),
          ])
        : const SizedBox();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      Row(children: [
        Container(
          width: ScreenAdapter.width(256),
          height: ScreenAdapter.width(256),
          margin: EdgeInsets.only(right: ScreenAdapter.width(40)),
          padding: EdgeInsets.all(ScreenAdapter.width(25)),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(ScreenAdapter.fontSize(12)),
            color: Colors.black.withOpacity(0.05),
          ),
          child: Image.network(
            HttpsClient.picReplaceUrl("${widget.pic}"),
            fit: BoxFit.cover,
          ),
        ),
        Expanded(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(children: [
              Text(
                "￥${widget.price}",
                style: TextStyle(
                  color: Colors.red,
                  fontSize: ScreenAdapter.fontSize(56),
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(width: ScreenAdapter.width(20)),
              Text(
                "￥${widget.oldPrice}",
                style: TextStyle(
                  color: Colors.black26,
                  fontSize: ScreenAdapter.fontSize(32),
                  decoration: TextDecoration.lineThrough,
                ),
              ),
            ]),
            SizedBox(height: ScreenAdapter.width(40)),
            Text(
              "${widget.title}  ${_selectedAttr['selected']!.join('  ')}",
              style: TextStyle(
                fontSize: ScreenAdapter.fontSize(32),
                color: Colors.black87,
              ),
            ),
          ]),
        ),
      ]),
      SizedBox(height: ScreenAdapter.height(80)),
      Column(
          children: widget.attrs
              .map(
                (attr) => SelectWrap(
                  title: "${attr.cate}",
                  titleStyle: TextStyle(fontSize: ScreenAdapter.fontSize(35)),
                  itemCount: attr.list!.length,
                  itemBuilder: (context, index) => ShapeButton(
                      padding: EdgeInsets.symmetric(
                        horizontal: ScreenAdapter.width(40),
                        vertical: ScreenAdapter.height(16),
                      ),
                      color:
                          _selectedAttr['selected']!.contains(attr.list?[index])
                              ? Colors.redAccent.withOpacity(0.1)
                              : Colors.black.withOpacity(0.05),
                      shape: StadiumBorder(
                          side: _selectedAttr['selected']!
                                  .contains(attr.list?[index])
                              ? const BorderSide(
                                  color: Colors.redAccent,
                                  strokeAlign: BorderSide.strokeAlignOutside)
                              : BorderSide.none),
                      child: Text(
                        attr.list![index],
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: ScreenAdapter.fontSize(32),
                        ),
                      ),
                      onPressed: () {
                        _changeAttrSelected(attr.cate, attr.list?[index]);
                      }),
                ),
              )
              .toList()),
      _shopNumView(),
    ]);
  }
}
