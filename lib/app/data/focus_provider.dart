import 'package:get/get_connect/http/src/response/response.dart';

import '../common/providers/base_provider.dart';
import '../models/focus_model.dart';

abstract class IFocusProvider {
  Future<Response<FocusModel>> getFocusModel({Map<String, dynamic>? query});
}

class FocusProvider extends BaseProvider implements IFocusProvider {
  @override
  Future<Response<FocusModel>> getFocusModel({Map<String, dynamic>? query}) async{
    final res = await get("/focus", query: query);
    return Response(
        statusCode: res.statusCode,
        statusText: res.statusText,
        body: FocusModel.fromJson(res.body)
    );
  }
}