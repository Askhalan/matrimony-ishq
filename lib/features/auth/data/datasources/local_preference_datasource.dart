import 'package:get_storage/get_storage.dart';
abstract class LocalPrefDatasource{
  Future<void> setUserLogedIn();
  Future<bool> getUserLogedIn();
  Future<void> removeUserLogedIn();

}

class LocalPreferenceDatasourceImpl extends LocalPrefDatasource{

  final GetStorage preference ;

  LocalPreferenceDatasourceImpl({required this.preference});

  //---------------------------------------------------
  @override
  Future<bool> getUserLogedIn() {
    return preference.read('isLogedin');
  }

  //---------------------------------------------------
  @override
  Future<void> setUserLogedIn() async {
    try{
     await preference.writeIfNull('isLogedin', true);
    }catch (e){
      throw 'Login not saved';
    }
  }

  //---------------------------------------------------
  @override
  Future<void> removeUserLogedIn() async {
   
    try{
     await preference.remove('isLogedin');
    }catch (e){
      throw 'Login not saved';
    }
  }

}