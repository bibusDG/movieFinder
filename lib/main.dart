import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:my_movies/views/bucket_list/bucket_list.dart';
import 'package:my_movies/views/main_page/main_page.dart';
import 'package:my_movies/views/news_page/news_page.dart';
import 'package:my_movies/views/search_page/search_page.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData.dark(),
      getPages:[
        GetPage(name: '/', page:()=>MainPage()),
        GetPage(name: '/searchPage', page: ()=>SearchPage()),
        GetPage(name: '/bucketList', page: ()=>BucketList()),
        GetPage(name:'/newsPage',page: ()=>NewsPage()),

      ]
    );

  }
}


