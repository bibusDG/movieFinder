import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:my_movies/controllers/movie_controller.dart';
import 'package:my_movies/views/bucket_list/bucket_list_controller.dart';
import 'package:my_movies/views/search_page/search_page_controller.dart';

class SearchPage extends StatelessWidget {
  SearchPage({Key? key}) : super(key: key);

  List productionYear =[for (int year = 1980; year < 2023; year++) year.toString()] + [''];
  Map originalGenre = {'action':'accion','crime':'crimen', 'animation': 'animacion','adventure': 'aventura',
    'sience-fiction': 'ciencia-ficcion', 'comedy':'comedia', 'history': 'historia', 'drama':'drama',
    'fantasy': 'fantasia', '':'',};
  Map rankType = {'title': 'title', 'year': 'year', 'rating': 'rating', '': ''};

  @override
  Widget build(BuildContext context) {

    SearchPageController searchPageController = Get.put(SearchPageController());
    MovieController movieController = Get.put(MovieController());
    BucketListController bucketListController = Get.find();

    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.maxFinite,
          height: double.maxFinite,
          child: Column(
            children: [
              SizedBox(
                height: 10.0,
              ),
              Text('SEARCH', style: TextStyle(fontSize: 25.0),),
              SizedBox(
                height: 30.0,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Container(child: Text('By Date', style: TextStyle(fontSize: 25.0)),),
                      Row(
                        children: [
                          Obx(()=>DropdownButton<dynamic>(
                              value: searchPageController.newYearValue.value,
                              items: productionYear
                                    .map<DropdownMenuItem>((value) {
                                    return DropdownMenuItem(
                                    value: value,
                                    child: Text(value.toString()),
                                    );
                                    }).toList(),
                              onChanged: (chosenValue){
                                searchPageController.newYearValue.value = chosenValue ;
                                searchPageController.addYearToChoiceList(chosenValue);

                              }
                            ),
                          ),
                          IconButton(icon:Icon(Icons.cancel), onPressed: (){
                              searchPageController.newYearValue.value = '';
                              searchPageController.addYearToChoiceList('');
                            },),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Container(child: Text('By Category', style: TextStyle(fontSize: 25.0)),),
                      Row(
                        children: [
                          Obx(()=>DropdownButton<dynamic>(
                              value: searchPageController.newTypeValue.value,
                              items: originalGenre.keys
                                  .map<DropdownMenuItem>((value) {
                                return DropdownMenuItem(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                              onChanged: (chosenValue){
                                searchPageController.newTypeValue.value = chosenValue ;
                                searchPageController.addCatgoryToChoiceList(originalGenre[chosenValue]);

                              }
                          ),
                          ),
                          IconButton(icon:Icon(Icons.cancel), onPressed: (){
                            searchPageController.newTypeValue.value = '' ;
                            searchPageController.addCatgoryToChoiceList(originalGenre['']);
                          },),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Container(child: Text('By Rank', style: TextStyle(fontSize: 25.0),),
                      ),
                      Row(
                        children: [
                          Obx(()=>DropdownButton<dynamic>(
                              value: searchPageController.newRankValue.value,
                              items: rankType.keys
                                  .map<DropdownMenuItem>((value) {
                                return DropdownMenuItem(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                              onChanged: (chosenValue){
                                searchPageController.newRankValue.value = chosenValue ;
                                searchPageController.addRankToChoiceList(rankType[chosenValue]);
                              }
                          ),
                          ),
                          IconButton(icon:Icon(Icons.cancel), onPressed: (){
                            searchPageController.newRankValue.value = '' ;
                            searchPageController.addRankToChoiceList(rankType['']);
                          },),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20.0,),
              ElevatedButton(onPressed: (){
                movieController.fetchProducts();
                },
                  child: Text('Search')),
              Obx(()=>Expanded(flex:1,
                child: Container(
                    child:GridView.builder(
                      // padding: EdgeInsets.all(20.0),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1,
                      ),
                      itemCount: movieController.movieList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Card(
                          margin: EdgeInsets.all(30.0),
                          // color: Colors.amber,
                          child: Row(
                            children: [
                              Expanded(flex:1,
                                child: Center(child:
                                Image.network(movieController.movieList[index].image.toString(),
                                ),
                                ),
                              ),
                              Expanded(flex:1,
                                child: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(height: 50.0,),
                                      Text('Title: ${movieController.movieList[index].titleOriginal}'),
                                      SizedBox(height: 20.0,),
                                      Text('Rating: ${movieController.movieList[index].rating}'),
                                      SizedBox(height: 20.0,),
                                      Text('Production: ${movieController.movieList[index].countries[0].name}'),
                                      SizedBox(height: 20.0,),
                                      Text('Production year: ${movieController.movieList[index].year}'),
                                      SizedBox(height: 40.0,),
                                      ElevatedButton(onPressed: (){
                                        if(bucketListController.bucketList.contains(movieController.movieList[index].titleOriginal))
                                          {
                                          }else{
                                          bucketListController.addToBucketList(movieController.movieList[index].titleOriginal);
                                        }
                                      }, child: Text('Add to bucket list')),

                                      // Text(movieController.movieList[index].titleOriginal),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          );
                        }
                    ),
                ),
              ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

// Column(
// children: [
// for (var i = 0; i<movieController.movieList.length;i++)
// Row(
// children: [
// Text(i.toString()),
// Image.network(movieController.movieList[i].image.toString(),),
// ],
// ),
// ],
// ),