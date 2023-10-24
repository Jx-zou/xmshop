import 'package:get/get.dart';
import 'package:xmshop/app/common/providers/base_provider.dart';
import 'package:xmshop/app/models/pcate_model.dart';

abstract class IPCateProvider {
  Future<Response> getPCateModel({Map<String, dynamic>? query});
}

class PCateProvider extends BaseProvider implements IPCateProvider {

  @override
  Future<Response> getPCateModel({Map<String, dynamic>? query}) async {
    final res = await get("/pcate", query: query);
    return Response(
        statusCode: res.statusCode,
        statusText: res.statusText,
        body: PCateModel.fromJson(res.body)
    );
  }

}