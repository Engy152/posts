
import 'dart:convert';

import 'package:dummy_posts/cubit/states.dart';
import 'package:dummy_posts/models/PostModel.dart';
import 'package:dummy_posts/network/http.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

class PostsCubit extends Cubit<PostsStates>
{
  PostsCubit():super(AppInitialStates());
  static PostsCubit get(context) => BlocProvider.of(context);
  //
  PostModel? postmodel;
 void getAllPosts() async
  {
      Api().get(url: 'https://dummyjson.com/posts').then((value)
      {
        final data = json.decode(value.body);
        print('88888888888');
        print(data);
        postmodel = PostModel.fromJson(data);
        print('ttttttttttttttttttttttttt');
        emit(AppScseesStates());
      }
      ).catchError((error) {
        print('error.toString()$error');
        emit(AppErrorStates());
      });


    }
  }