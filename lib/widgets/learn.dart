import 'package:agrosage/model/blog_model.dart';
import 'package:agrosage/widgets/section_header.dart';
import 'package:agrosage/widgets/tending_card.dart';
import 'package:flutter/material.dart';

class Learn extends StatelessWidget {
  const Learn({super.key, 
    required this.blogs,
  });

  final List<Blog> blogs;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 20.0,
        top: 20.0,
        bottom: 20.0,
      ),
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: SectionHeader(title: 'Trending '),
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.27,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: blogs.length,
              itemBuilder: (context, index) {
                return TrendingCard(blog: blogs[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}