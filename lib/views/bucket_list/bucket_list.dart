import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:my_movies/views/bucket_list/bucket_list_controller.dart';
import 'package:my_movies/views/search_page/search_page_controller.dart';

class BucketList extends StatelessWidget {
  const BucketList({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    BucketListController bucketListController = Get.find();

    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Obx(()=>Column(
                children: [
                  Center(child: Text('My bucket list', style: TextStyle(fontSize: 25.0,),),),
                  SizedBox(height: 30.0,),
                  for (var i=0;i<bucketListController.bucketList.length; i++)
                  Row(
                    children: [
                      Text('${i+1}.'),
                      SizedBox(width: 5.0,),
                      Text(bucketListController.bucketList[i]),
                      SizedBox(width: 10.0,),
                      ElevatedButton(onPressed: (){
                        bucketListController.bucketList.remove(bucketListController.bucketList[i]);
                      }, child: Text('Remove from list')),
                    ],
                  ),
                ],
              ),
          ),
        ),
      ),
    );
  }
}
