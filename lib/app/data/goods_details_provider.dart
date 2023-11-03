import 'package:get/get.dart';

import '../common/providers/base_provider.dart';
import '../models/goods_details_model.dart';

abstract class IGoodsDetailsProvider {
  Future<Response<GoodsDetailsModel>> getGoodsDetailsModel({required Map<String, dynamic> query});
}

class GoodsDetailsProvider extends BaseProvider implements IGoodsDetailsProvider {
  @override
  Future<Response<GoodsDetailsModel>> getGoodsDetailsModel({required Map<String, dynamic> query}) async {
    final res = await get("/pcontent", query: query);
    return Response(
        statusCode: res.statusCode,
        statusText: res.statusText,
        body: GoodsDetailsModel.fromJson(res.body)
    );
  }
}