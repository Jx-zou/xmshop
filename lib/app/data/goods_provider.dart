import 'package:get/get.dart';
import 'package:xmshop/app/common/providers/base_provider.dart';
import 'package:xmshop/app/models/goods_model.dart';

abstract class IGoodsProvider {
  Future<Response<List<GoodsModel>>> getGoodsModel({Map<String, dynamic>? query});
}

class GoodsProvider extends BaseProvider implements IGoodsProvider {


  List<GoodsModel>? _decode(dynamic json) {
    if (json['result'] != null) {
      List<GoodsModel> list = <GoodsModel>[];
      json['result'].forEach((v) {
        list.add(GoodsModel.fromJson(v));
      });
      return list;
    }
    return null;
  }

  @override
  Future<Response<List<GoodsModel>>> getGoodsModel({Map<String, dynamic>? query}) async {
    final res = await get("/plist", query: query);
    return Response(
        statusCode: res.statusCode,
        statusText: res.statusText,
        body: _decode(res.body)
    );
  }

}