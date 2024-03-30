import 'package:agrosage/model/blog_model.dart';
import 'package:agrosage/screens/posts_screen.dart';
import 'package:agrosage/widgets/label_divider.dart';
import 'package:agrosage/widgets/learn.dart';
import 'package:agrosage/widgets/text_tile.dart';
import 'package:agrosage/widgets/video_carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BlogScreen extends StatelessWidget {
  const BlogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Blog> blogs = Blog.blogs;

    return SingleChildScrollView(
      child: Column(
        children: [
          const VideoCarouselSlider(),
          Learn(blogs: blogs),
          const SizedBox(
            height: 3,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: Column(
              children: [
                LabelDivider(label: 'News'),
                TextTile(
                    title: 'title',
                    description: 'description',
                    image_path: 'assets/images/leaf_image.png',
                    destination: PostScreen(),
                    ),
                TextTile(
                    title: 'title',
                    description: 'description',
                    image_path: 'assets/images/leaf_image.png',
                    destination: PostScreen(),
                    ),
                TextTile(
                    title: 'title',
                    description: 'description',
                    image_path: 'assets/images/leaf_image.png',
                    destination: PostScreen(),
                    ),
                LabelDivider(label: 'Others'),
                TextTile(
                    title: 'title',
                    description: 'description',
                    image_path: 'assets/images/leaf_image.png',
                    destination: PostScreen(),
                    ),
                TextTile(
                    title: 'title',
                    description: 'description',
                    image_path: 'assets/images/leaf_image.png',
                    destination: PostScreen(),
                    ),
                TextTile(
                    title: 'title',
                    description: 'description',
                    image_path: 'assets/images/leaf_image.png',
                    destination: PostScreen(),
                    ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
