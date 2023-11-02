

import 'package:dummy_posts/cubit/cubit.dart';
import 'package:dummy_posts/cubit/states.dart';
import 'package:dummy_posts/modules/widgets/post.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context)
  {
    PostsCubit.get(context).getAllPosts();
    return BlocConsumer<PostsCubit,PostsStates>(
      listener: (context,state) { },
      builder: (context,state)
      {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            title: const Text(
              'Posts',
             style: TextStyle(fontSize: 23.0,color: Colors.black),
            ),
          ),
          body:
              state is AppLoadingStates? const Center(child: CircularProgressIndicator()):

          ListView.builder(
           physics: BouncingScrollPhysics(),
              itemBuilder: (context, index)
          {
            return post_screen( post:PostsCubit.get(context).postmodel!, index: index, );
          },
            itemCount:
                PostsCubit.get(context).postmodel!.posts!.length
          )
        );
      },
    );
  }
}
