
import 'package:get/get.dart';

class BucketListController extends GetxController{

  List bucketList = [].obs;

  void addToBucketList(movieTitle){

    bucketList.add(movieTitle);
    print(bucketList);

  }

}