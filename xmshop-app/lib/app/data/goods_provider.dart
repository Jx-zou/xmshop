import 'package:get/get_connect/http/src/response/response.dart';

import '../models/goods_model.dart';
import 'base_provider.dart';

abstract class IGoodsProvider {
  Future<Response<List<GoodsModel>>> getGoodsModel({Map<String, dynamic>? query});
}

class GoodsProvider extends BaseProvider implements IGoodsProvider {

  List<GoodsModel>? _decode(dynamic json) {
    if (json != null && json['result'] != null) {
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