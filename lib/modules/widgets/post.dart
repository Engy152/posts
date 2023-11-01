import 'package:dummy_posts/models/PostModel.dart';
import 'package:flutter/material.dart';

class post_screen extends StatelessWidget {
  const post_screen({
    Key? key,
    required this.post,
    required this.index,
  }) : super(key: key);
  final PostModel post;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30.0, left: 11, right: 11),
      child: Card(
        elevation: 15,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 15.0,
            ),
            Text(
              post.posts![index].title.toString(),
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 15.0,
            ),
            Text(
              //test
              post.posts![index].body.toString(),
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              children: [
                Icon(
                  Icons.favorite_sharp,
                  color: Colors.red,
                ),
                SizedBox(
                  width: 7,
                ),
                Text(
                  post.posts![index].reactions.toString(),
                ),
              ],
            ),
            Divider(
              color: Colors.grey[90],
              thickness: 1,
              //indent: 55,
              //endIndent: 55,
            ),
            Text(
              post.posts![index].tags.toString(),
              //style: TextStyle(fontSize: 15),
            ),
            SizedBox(height: 5.0,)
          ],
        ),
      ),
    );
  }
}
