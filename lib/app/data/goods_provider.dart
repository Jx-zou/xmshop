import 'package:get/get.dart';
import 'package:xmshop/app/common/providers/base_provider.dart';
import 'package:xmshop/app/models/goods_model.dart';

abstract class IGoodsProvider {
  Future<Response<GoodsModel>> getGoodsModel({Map<String, dynamic>? query});
}

class GoodsProvider extends BaseProvider implements IGoodsProvider {
  @override
  Future<Response<GoodsModel>> getGoodsModel({Map<String, dynamic>? query}) async {
    final res = await get("/plist", query: query);
    return Response(
        statusCode: res.statusCode,
        statusText: res.statusText,
        body: GoodsModel.fromJson(res.body)
    );
  }
  
}