

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:my_movies/models/movie_model.dart';
import 'package:my_movies/services/http_service.dart';

class MovieController extends GetxController{
  var isLoading = true.obs;
  var movieList = <MovieModel>[].obs;

  @override
  void onInit(){
    fetchProducts();
    super.onInit();
  }
  void fetchProducts() async{
    try{
      isLoading(true);
      var movies = await RemoteService().fetchProducts();
      if (movies != null){
        movieList.value = movies;
      }
    }finally{
      isLoading(false);
    }
  }

}