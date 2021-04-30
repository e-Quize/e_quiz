import 'dart:async';
import 'package:e_quiz/db/init_db.dart';

import 'package:e_quiz/db/sembast/singleton_sambest.dart';
import 'package:e_quiz/screens/splash_screen.dart';
import 'package:e_quiz/utils/widgetproperties.dart';
import 'package:e_quiz/models/user/user_model.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sembast/sembast.dart';

void main() {
  WidgetProperties.enablePlatformOverrideForDesktop();
  runApp(MainScreen());
  Init.initialize();
  // openDb();
}

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'Sans',
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
    );
  }

  openDb() async {
    await SingletonSembast.instance.openDb();
    var database = SingletonSembast.instance.db;
    // var store = intMapStoreFactory.store('user');
    var store = StoreRef.main();
    var userEntity = UserEntity();
    userEntity.FirstName = "Hafiz Naeem";
    userEntity.LastName = "Hassan From USA";
    await store.record('userModel').put(database, userEntity.toJson());
    var title = await store.record('userModel').get(database);
    var userModel = UserEntity.fromJson(title);
    print(userModel.FirstName);
  }
}
