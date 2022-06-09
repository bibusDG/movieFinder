import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

Map choiceList ={'year': '', 'category': '', 'rank': ''};

class SearchPageController extends GetxController{

  RxString newYearValue = ''.obs;
  RxString newTypeValue = ''.obs;
  RxString newRankValue = ''.obs;


  void addYearToChoiceList(chosenValue){
    choiceList['year']=chosenValue;
    print(choiceList);
  }
  void addCatgoryToChoiceList(chosenValue){
    choiceList['category']=chosenValue;
    print(choiceList);

  }
  void addRankToChoiceList(chosenValue){
    choiceList['rank']=chosenValue;
    print(choiceList);

  }
}