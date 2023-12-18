import 'package:get/get_connect/http/src/response/response.dart';

import '../models/focus_model.dart';
import 'base_provider.dart';

abstract class IFocusProvider {
  Future<Response<List<FocusModel>>> getFocusModels({Map<String, dynamic>? query});
}

class FocusProvider extends BaseProvider implements IFocusProvider {

  List<FocusModel>? _decode(dynamic json) {
    if (json != null && json['result'] != null) {
      List<FocusModel> list = <FocusModel>[];
      json['result'].forEach((v) {
        list.add(FocusModel.fromJson(v));
      });
      return list;
    }
    return null;
  }

  @override
  Future<Response<List<FocusModel>>> getFocusModels({Map<String, dynamic>? query}) async{
    final res = await get("/focus", query: query);
    return Response(
        statusCode: res.statusCode,
        statusText: res.statusText,
        body: _decode(res.body)
    );
  }
}