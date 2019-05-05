import 'package:meta/meta.dart';

abstract class UserRepository {
  Future<String> authenticate({
    @required String username,
    @required String password,
  });

  Future<String> registerNewCompany(
      {@required String companyName,
      @required String companyEmail,
      @required String password,
      // @required String confirmPassword,
      @required String location});

  Future<void> deleteToken();

  Future<void> persistToken(String token);

  Future<bool> hasToken();
}

class UserRepositoryImp extends UserRepository {
  @override
  Future<String> authenticate({
    @required String username,
    @required String password,
  }) async {
    await Future.delayed(Duration(seconds: 1));
    return 'token';
  }

  @override
  Future<void> deleteToken() async {
    /// delete from keystore/keychain
    await Future.delayed(Duration(seconds: 1));
    return;
  }

  @override
  Future<void> persistToken(String token) async {
    /// write to keystore/keychain
    await Future.delayed(Duration(seconds: 1));
    return;
  }

  @override
  Future<bool> hasToken() async {
    /// read from keystore/keychain
    await Future.delayed(Duration(seconds: 1));
    return true;
  }

  @override
  Future<String> registerNewCompany(
      {@required String companyName,
      @required String companyEmail,
      @required String password,
      // String confirmPassword,
      @required String location}) async {
    await Future.delayed(Duration(seconds: 1));
    return 'Token';
  }
}
