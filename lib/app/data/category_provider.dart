

import 'package:get/get_connect/http/src/response/response.dart';

import '../common/providers/base_provider.dart';
import '../models/category_model.dart';

abstract class ICategoryProvider {
  Future<Response<List<CategoryModel>>> getPCateModel({Map<String, dynamic>? query});
}

class CategoryProvider extends BaseProvider implements ICategoryProvider {

  List<CategoryModel>? _decode(dynamic json) {
    if (json['result'] != null) {
      List<CategoryModel> list = <CategoryModel>[];
      json['result'].forEach((v) {
        list.add(CategoryModel.fromJson(v));
      });
      return list;
    }
    return null;
  }

  @override
  Future<Response<List<CategoryModel>>> getPCateModel({Map<String, dynamic>? query}) async {
    final res = await get("/pcate", query: query);
    return Response(
        statusCode: res.statusCode,
        statusText: res.statusText,
        body: _decode(res.body)
    );
  }
}