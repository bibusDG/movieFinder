import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:my_movies/controllers/movie_controller.dart';
import 'package:my_movies/models/movie_model.dart';
import 'package:my_movies/views/search_page/search_page_controller.dart';


class RemoteService {

  var client = http.Client();

  final _authority = "movies-app1.p.rapidapi.com";
  final _path = "/api/movies";
  final _query = {"sort":choiceList['rank'],"type":"movies","year":choiceList['year'],"genres":choiceList['category']};
  final Map<String, String> _headers = {
    "x-rapidapi-key": "d5d114ee38msh7189be4c4d71f31p180dbfjsn9d5bd40f938f",
    "x-rapidapi-host": "movies-app1.p.rapidapi.com",
  };

    Future<List<MovieModel>> fetchProducts() async{
    Uri uri = Uri.https(_authority, _path, _query);
    var response = await client.get(uri, headers: _headers);
    if (response.statusCode == 200){

      var jsonString = jsonDecode(response.body);
      var data = jsonEncode(jsonString['results']);
      // print(jsonString);
      // print(data);
      // return movieModelFromJson(data);
      // print(movieModelFromJson(jsonString));
      return movieModelFromJson(data);
      // return data.map((movies) => MovieModel.fromJson(movies)).toList();
    }else{
      throw Exception('No data');
    }
  }
}

// var data = jsonString['results'];
// print(data);
// return data.map((movies) => MovieModel.fromJson(movies)).toList();