import 'package:rdsdms/services/base.service.dart';

class AccountService extends BaseService {
  static Future<String> login(String username, String password) async {
    final response = await BaseService.get([username, password]);

    if (response != '') {
      return response;
    }
    return null;
  }
}
