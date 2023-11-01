import 'package:get/get_connect/http/src/response/response.dart';

import '../common/providers/base_provider.dart';
import '../models/best_category_model.dart';

abstract class IBestCategoryProvider {
  Future<Response<List<BestCategoryModel>>> getBestCategoryModel();
}

class BestCategoryProvider extends BaseProvider implements IBestCategoryProvider {

  List<BestCategoryModel>? _decode(dynamic json) {
    if (json['result'] != null) {
      List<BestCategoryModel> list = <BestCategoryModel>[];
      json['result'].forEach((v) {
        list.add(BestCategoryModel.fromJson(v));
      });
      return list;
    }
    return null;
  }

  @override
  Future<Response<List<BestCategoryModel>>> getBestCategoryModel() async{
    final res = await get("/bestCate");
    return Response(
        statusCode: res.statusCode,
        statusText: res.statusText,
        body: _decode(res.body)
    );
  }
}