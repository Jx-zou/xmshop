import 'package:flutter/material.dart';

import '../common/views/widgets/shape_button.dart';
import '../common/icons/xmshop_icons.dart';
import '../models/goods_details_model.dart';
import '../utils/https_client.dart';
import '../utils/screen_adapter.dart';

class SelectedProductBottomSheet extends StatefulWidget {
  final GoodsDetailsModel? goodsDetailsModel;
  final Widget? bottom;
  final bool? showNumWidget;
  final Function(String selectedAttr, int shopNum)? close;

  const SelectedProductBottomSheet(
      {super.key,
      this.bottom,
      this.showNumWidget,
      this.close,
      this.goodsDetailsModel});

  @override
  State<StatefulWidget> createState() => _SelectedProductBottomSheetState();
}

class _SelectedProductBottomSheetState
    extends State<SelectedProductBottomSheet> {
  final Map<String, List<String?>> _selectedAttr = {
    'cate': <String>[],
    'selected': <String>[]
  };
  int _shopNum = 1;

  void _changeAttrSelected(cate, title) {
    setState(() {
      for (int i = 0; i < _selectedAttr['cate']!.length; i++) {
        if (_selectedAttr['cate']?[i] == cate) {
          _selectedAttr['selected']?[i] = title;
        }
      }
    });
  }

  void _shopNumAdd() {
    setState(() {
      _shopNum++;
    });
  }

  void _shopNumMinus() {
    setState(() {
      if (_shopNum > 1) {
        _shopNum--;
      }
    });
  }

  void _initAttrSelected() {
    if (widget.goodsDetailsModel != null) {
      List<GoodsDetailsAttrModel>? attrs = widget.goodsDetailsModel?.attr;
      if (attrs != null) {
        for (int i = 0; i < attrs.length; i++) {
          _selectedAttr['cate']?.add(attrs[i].cate);
          _selectedAttr['selected']?.add(attrs[i].list?[0]);
        }
      }
    }
  }

  @override
  void initState() {
    super.initState();
    _initAttrSelected();
  }

  @override
  void dispose() {
    if (widget.close != null) {
      widget.close!(_selectedAttr['selected']!.join("  "), _shopNum);
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget bottom = widget.bottom ?? Container();
    bool showNumWidget = widget.showNumWidget ?? true;
    return Stack(children: [
      widget.goodsDetailsModel != null
          ? ListView(children: [
              Row(children: [
                Container(
                  width: ScreenAdapter.width(256),
                  height: ScreenAdapter.width(256),
                  margin: EdgeInsets.only(
                    right: ScreenAdapter.width(40),
                  ),
                  padding: EdgeInsets.all(
                    ScreenAdapter.width(25),
                  ),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      ScreenAdapter.fontSize(12),
                    ),
                    color: Colors.black.withOpacity(0.05),
                  ),
                  child: Image.network(
                    HttpsClient.picReplaceUrl(
                        "${widget.goodsDetailsModel?.pic}"),
                    fit: BoxFit.cover,
                  ),
                ),
                Expanded(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(children: [
                          Text(
                            "￥${widget.goodsDetailsModel?.price}",
                            style: TextStyle(
                                color: Colors.red,
                                fontSize: ScreenAdapter.fontSize(56),
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            width: ScreenAdapter.width(20),
                          ),
                          Text(
                            "￥${widget.goodsDetailsModel?.oldPrice}",
                            style: TextStyle(
                                color: Colors.black26,
                                fontSize: ScreenAdapter.fontSize(32),
                                decoration: TextDecoration.lineThrough),
                          )
                        ]),
                        SizedBox(
                          height: ScreenAdapter.width(40),
                        ),
                        Text(
                          "${widget.goodsDetailsModel?.title}  ${_selectedAttr['selected']!.join('  ')}",
                          style: TextStyle(
                              fontSize: ScreenAdapter.fontSize(32),
                              color: Colors.black87),
                        )
                      ]),
                )
              ]),
              SizedBox(
                height: ScreenAdapter.height(80),
              ),
              ...?widget.goodsDetailsModel?.attr?.map(
                (attr) => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${attr.cate}",
                        style: TextStyle(
                          fontSize: ScreenAdapter.fontSize(35),
                        ),
                      ),
                      SizedBox(
                        height: ScreenAdapter.height(30),
                      ),
                      Wrap(
                        spacing: ScreenAdapter.width(30),
                        children: attr.list!
                            .map(
                              (item) => Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    ShapeButton(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: ScreenAdapter.width(40),
                                          vertical: ScreenAdapter.height(16),
                                        ),
                                        color: _selectedAttr['selected']!
                                                .contains(item)
                                            ? Colors.redAccent.withOpacity(0.1)
                                            : Colors.black.withOpacity(0.05),
                                        shape: StadiumBorder(
                                            side: _selectedAttr['selected']!
                                                    .contains(item)
                                                ? const BorderSide(
                                                    color: Colors.redAccent,
                                                    strokeAlign: BorderSide
                                                        .strokeAlignOutside)
                                                : BorderSide.none),
                                        child: Text(
                                          item,
                                          style: TextStyle(
                                            color: Colors.black87,
                                            fontSize:
                                                ScreenAdapter.fontSize(32),
                                          ),
                                        ),
                                        onPressed: () {
                                          _changeAttrSelected(attr.cate, item);
                                        })
                                  ]),
                            )
                            .toList(),
                      ),
                      SizedBox(
                        height: ScreenAdapter.height(40),
                      )
                    ]),
              ),
              showNumWidget
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                          Text(
                            "购买数量",
                            style: TextStyle(
                              fontSize: ScreenAdapter.fontSize(35),
                            ),
                          ),
                          Row(children: [
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: ScreenAdapter.width(30),
                              ),
                              child: InkWell(
                                onTap: () {
                                  _shopNumMinus();
                                },
                                child: Icon(
                                  XmshopIcons.minus,
                                  color: Colors.black45,
                                  size: ScreenAdapter.fontSize(32),
                                ),
                              ),
                            ),
                            Container(
                              width: ScreenAdapter.width(150),
                              height: ScreenAdapter.height(70),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(3),
                                  color: Colors.black12),
                              child: Text(
                                "$_shopNum",
                                style: TextStyle(
                                    fontSize: ScreenAdapter.fontSize(42),
                                    color: Colors.white),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: ScreenAdapter.width(30),
                              ),
                              child: InkWell(
                                onTap: () {
                                  _shopNumAdd();
                                },
                                child: Icon(
                                  XmshopIcons.add,
                                  color: Colors.black45,
                                  size: ScreenAdapter.fontSize(32),
                                ),
                              ),
                            )
                          ])
                        ])
                  : Container()
            ])
          : Container(),
      Positioned(left: 0, right: 0, bottom: 0, child: bottom)
    ]);
  }
}
