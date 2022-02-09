import 'package:dio/dio.dart';
import 'package:get/get.dart' as GetX;
import 'package:tcc_app/app/modules/signIn/login_controller.dart';

// const String backendUrl = "http://192.168.1.13:3000/";
const String backendUrl =
    "http://ec2-3-138-34-174.us-east-2.compute.amazonaws.com:3000/";

String? getAuthToken() {
  final controller = GetX.Get.find<LoginController>();
  return controller.authInfo.authToken;
}

String? get authToken => getAuthToken();

void clearAuthToken() {
  final controller = GetX.Get.find<LoginController>();
  controller.signOut();
}

get _dioOptions => BaseOptions(
      baseUrl: backendUrl,
      connectTimeout: 5000,
      receiveTimeout: 5000,
      headers: {
        'content-type': 'application/json',
        'accept': 'application/json',
        'Authorization': authToken != null ? 'Bearer ' + authToken! : "",
      },
    );

Dio get httpClient => Dio(_dioOptions);

typedef RequestFunction = Future<Response<dynamic>> Function();
typedef ProcessFunction<T> = T? Function(Response<dynamic> response);

Future<T?> executeRequest<T>(
  RequestFunction requestFunction,
  ProcessFunction<T> processFunction,
) async {
  Response<dynamic>? response;
  try {
    response = await requestFunction();

    if (response.statusCode == 401) {
      clearAuthToken();
    }

    if (response.statusCode != 200) {
      return null;
    }

    return processFunction(response);
  } catch (e, stacktrace) {
    // ignore: avoid_print
    print("API REQUEST ERROR");
    if (response != null) {
      // ignore: avoid_print
      print(response.data);
    }
    // ignore: avoid_print
    print(e);
    // ignore: avoid_print
    print(stacktrace);

    return null;
  }
}
