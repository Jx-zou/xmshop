import 'package:get/get_connect/http/src/response/response.dart';

import '../common/providers/base_provider.dart';
import '../models/best_category_model.dart';

abstract class IBestCategoryProvider {
  Future<Response<BestCategoryModel>> getBestCategoryModel();
}

class BestCategoryProvider extends BaseProvider implements IBestCategoryProvider {
  @override
  Future<Response<BestCategoryModel>> getBestCategoryModel() async{
    final res = await get("/bestCate");
    return Response(
        statusCode: res.statusCode,
        statusText: res.statusText,
        body: BestCategoryModel.fromJson(res.body)
    );
  }
}