import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/icons/xmshop_fonts.dart';
import '../../../common/views/loading.dart';
import '../../../utils/screen_adapter.dart';
import '../controllers/product_controller.dart';

class ProductView extends GetView<ProductController> {
  const ProductView({super.key});

  _appBar() => AppBar(
        titleSpacing: 0,
        title: Container(
          width: ScreenAdapter.width(850),
          height: ScreenAdapter.height(100),
          decoration: BoxDecoration(
              color: const Color.fromARGB(255, 244, 244, 244),
              borderRadius: BorderRadius.circular(30)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                  padding: EdgeInsets.fromLTRB(
                      ScreenAdapter.width(34), 0, ScreenAdapter.width(10), 0),
                  child: const Icon(XmshopFonts.search,
                      size: 20, color: Colors.black45)),
              Text(
                "",
                style: TextStyle(
                    fontSize: ScreenAdapter.fontSize(32),
                    color: Colors.black54),
              )
            ],
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: const [Text("")],
      );

  _subHeader() => Positioned(
        left: 0,
        right: 0,
        top: 0,
        child: Container(
            height: ScreenAdapter.height(120),
            width: ScreenAdapter.width(1080),
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border(
                    bottom: BorderSide(
                        width: ScreenAdapter.height(2),
                        color: const Color.fromARGB(255, 244, 244, 244)))),
            child: Row(
                children: controller.subHeaderList
                    .map((value) => Expanded(
                        flex: 1,
                        child: InkWell(
                          onTap: () {
                            controller.onSubTap(value['id']);
                          },
                          child: Padding(
                              padding: EdgeInsets.fromLTRB(
                                  0,
                                  ScreenAdapter.height(16),
                                  0,
                                  ScreenAdapter.height(16)),
                              child: Obx(() => Text(
                                    "${value['title']}",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: controller.selectId.value ==
                                                value['id']
                                            ? Colors.orange
                                            : Colors.black45,
                                        fontSize: ScreenAdapter.fontSize(38)),
                                  ))),
                        )))
                    .toList())),
      );

  _productList() => Positioned(
      top: ScreenAdapter.height(120),
      left: 0,
      right: 0,
      bottom: 0,
      child: controller.obx(
          (state) => RefreshIndicator(
              onRefresh: () => controller.onRefresh(),
              child: ListView.builder(
                  shrinkWrap: true,
                  controller: controller.scrollController,
                  itemCount: state!.length,
                  itemBuilder: (context, index) => Column(children: [
                        Container(
                            margin: EdgeInsets.fromLTRB(
                                ScreenAdapter.height(26),
                                ScreenAdapter.height(26),
                                ScreenAdapter.height(26),
                                0),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10)),
                            padding: EdgeInsets.fromLTRB(
                                ScreenAdapter.width(60),
                                ScreenAdapter.width(60),
                                ScreenAdapter.width(60),
                                0),
                            child: Row(children: [
                              Container(
                                padding:
                                    EdgeInsets.all(ScreenAdapter.width(60)),
                                width: ScreenAdapter.width(400),
                                height: ScreenAdapter.height(460),
                                child: Image.network(
                                    "https://xiaomi.itying.com/${state[index].pic}"
                                        .replaceAll("\\", "/"),
                                    fit: BoxFit.fitHeight),
                              ),
                              Expanded(
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                          bottom: ScreenAdapter.height(20)),
                                      child: Text("${state[index].title}",
                                          style: TextStyle(
                                              fontSize:
                                                  ScreenAdapter.fontSize(48),
                                              fontWeight: FontWeight.bold)),
                                    ),
                                    Text("${state[index].subTitle}",
                                        style: TextStyle(
                                            fontSize:
                                                ScreenAdapter.fontSize(34),
                                            color: Colors.black54)),
                                    Container(
                                        padding: EdgeInsets.only(
                                            bottom: ScreenAdapter.height(20)),
                                        child: Row(children: [
                                          Expanded(
                                              child: ListTile(
                                            title: Text("CPU",
                                                style: TextStyle(
                                                    fontSize:
                                                        ScreenAdapter.fontSize(
                                                            42),
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black54)),
                                            subtitle: Text("Helio G25",
                                                style: TextStyle(
                                                    fontSize:
                                                        ScreenAdapter.fontSize(
                                                            32),
                                                    color: Colors.black38)),
                                          )),
                                          Container(
                                            width: 1,
                                            height: ScreenAdapter.height(60),
                                            color: Colors.black12,
                                          ),
                                          Expanded(
                                              child: ListTile(
                                            title: Text("CPU",
                                                style: TextStyle(
                                                    fontSize:
                                                        ScreenAdapter.fontSize(
                                                            42),
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black54)),
                                            subtitle: Text("Helio G25",
                                                style: TextStyle(
                                                    fontSize:
                                                        ScreenAdapter.fontSize(
                                                            32),
                                                    color: Colors.black38)),
                                          )),
                                          Container(
                                            width: 1,
                                            height: ScreenAdapter.height(60),
                                            color: Colors.black12,
                                          ),
                                          Expanded(
                                              child: ListTile(
                                            title: Text("CPU",
                                                style: TextStyle(
                                                    fontSize:
                                                        ScreenAdapter.fontSize(
                                                            42),
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black54)),
                                            subtitle: Text("Helio G25",
                                                style: TextStyle(
                                                    fontSize:
                                                        ScreenAdapter.fontSize(
                                                            32),
                                                    color: Colors.black38)),
                                          ))
                                        ])),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          bottom: ScreenAdapter.height(20)),
                                      child: Text("￥${state[index].price}",
                                          style: TextStyle(
                                              fontSize:
                                                  ScreenAdapter.fontSize(38),
                                              fontWeight: FontWeight.bold)),
                                    )
                                  ])),
                            ])),
                        !controller.hasMore.value && index == state.length - 1
                            ? Container(
                                height: ScreenAdapter.height(50),
                                alignment: Alignment.center,
                                child: (Text("已加载完毕呦，我是有底线的~",
                                    style: TextStyle(
                                        fontSize: ScreenAdapter.fontSize(24),
                                        color: Colors.black45))))
                            : Container()
                      ]))),
          onLoading: const Loading()));

  _endDrawer() => Drawer(
        child: Container(
          padding: EdgeInsets.fromLTRB(
              ScreenAdapter.width(40),
              ScreenAdapter.height(200),
              ScreenAdapter.width(40),
              ScreenAdapter.width(40)),
          child: const Text("endDrawer..."),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: controller.scaffoldKey,
        endDrawer: _endDrawer(),
        appBar: _appBar(),
        backgroundColor: const Color.fromARGB(255, 244, 244, 244),
        body: Stack(
          children: [_productList(), _subHeader()],
        ));
  }
}
