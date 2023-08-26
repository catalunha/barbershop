import 'package:barbershop/src/core/constants/local_storage_keys.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthInterceptor extends Interceptor {
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final RequestOptions(:headers, :extra) = options;
    headers.remove('Authorization');
    if (extra case {'DIO_AUTH_KEY': true}) {
      final sp = await SharedPreferences.getInstance();
      final accessToken = sp.getString(AppLocalStorageKeys.accessToken);
      headers.addAll({'Authorization': 'Bearer $accessToken'});
    }
    handler.next(options);
  }
}
