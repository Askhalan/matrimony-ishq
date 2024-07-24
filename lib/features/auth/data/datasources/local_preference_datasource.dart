import 'dart:developer';

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
Future<bool> getUserLogedIn() async {
  log(preference.read('isLogedin').toString());
  final bool? isLoggedIn = preference.read('isLogedin');
  return isLoggedIn ?? false;
}

  //---------------------------------------------------
  @override
  Future<void> setUserLogedIn() async {
    try{
     await preference.writeIfNull('isLogedin', true);
     log("------------------- in ssetUserLogin");
     log(preference.read('isLogedin').toString());
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