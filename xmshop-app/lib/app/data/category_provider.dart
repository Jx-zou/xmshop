import 'package:get/get_connect/http/src/response/response.dart';

import '../models/category_model.dart';
import 'base_provider.dart';

abstract class ICategoryProvider {
  Future<Response<List<CategoryModel>>> getCategoryModel({Map<String, dynamic>? query});
}

class CategoryProvider extends BaseProvider implements ICategoryProvider {

  List<CategoryModel>? _decode(dynamic json) {
    if (json != null && json['result'] != null) {
      List<CategoryModel> list = <CategoryModel>[];
      json['result'].forEach((v) {
        list.add(CategoryModel.fromJson(v));
      });
      return list;
    }
    return null;
  }

  @override
  Future<Response<List<CategoryModel>>> getCategoryModel({Map<String, dynamic>? query}) async {
    final res = await get("/category", query: query);
    return Response(
        statusCode: res.statusCode,
        statusText: res.statusText,
        body: _decode(res.body)
    );
  }
}