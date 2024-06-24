import 'package:application/components/buttons/like_button.dart';
import 'package:application/components/posts/post_header.dart';
import 'package:application/design/styles.dart';
import 'package:application/modules/publications_modules.dart';
import 'package:flutter/material.dart';

class PostCard extends StatelessWidget {
  final PostModel _post;
  final double padding;

  const PostCard(this._post, {super.key, this.padding = 8.0});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: .5,
      child: Padding(
        padding: EdgeInsets.all(padding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PostHeader(_post),

            // ANCHOR - Post Content
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: Styles.defaultSpacing),
                Text(
                  _post.title,
                  style: const TextStyle(fontSize: 18),
                ),
                const Text(
                    "as an undegrad math student, I have really enjoyed this deeper view into math that most people don't even get close to gettin close to. Before I took abstract algebra..."),
                const SizedBox(height: Styles.defaultSpacing),
              ],
            ),

            // ANCHOR - Post Actions
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                LikeButton(_post),
                TextButton(
                  onPressed: () {},
                  child: Row(
                    children: [
                      const Icon(Icons.chat, color: Styles.orange),
                      const SizedBox(width: Styles.defaultSpacing),
                      Text(
                        _post.commentsCount.toString(),
                        style: const TextStyle(color: Styles.black),
                      )
                    ],
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Row(
                    children: [
                      Icon(Icons.share, color: Styles.orange),
                      SizedBox(width: Styles.defaultSpacing),
                      Text("", style: TextStyle(color: Styles.black))
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
