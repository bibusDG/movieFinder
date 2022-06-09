import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:my_movies/views/bucket_list/bucket_list_controller.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    BucketListController bucketListController = Get.put(BucketListController());

    return SafeArea(
        child: Scaffold(
          body: Obx(()=>Container(
              width: double.maxFinite,
              height: double.maxFinite,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(onPressed: (){
                    Get.toNamed('/searchPage');
                  },
                      child: Text('Search for movie')),
                  ElevatedButton(onPressed: (){
                    Get.toNamed('/newsPage');
                  },
                      child: Text('News')),
                  ElevatedButton(onPressed: (){
                    Get.toNamed('/bucketList');
                  }
                      , child: Text('My Bucket list')),
                  Text(bucketListController.bucketList.length.toString()),

                ],
              ),

            ),
          ),
        ));
  }
}
