
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
  PostModel? postmodel;
 void getAllPosts() async
  {
    emit(AppLoadingStates());
     await Api().get(url: 'https://dummyjson.com/posts').then((value)
      {
        final data = json.decode(value.body);
        print(data);
        if(value.statusCode==200){
          postmodel = PostModel.fromJson(data);
        emit(AppScseesStates());
        }else
        {
          print('error');
        }
      }).catchError((error) {
        print('error.toString()$error');
        emit(AppErrorStates());
      });
    }
  }