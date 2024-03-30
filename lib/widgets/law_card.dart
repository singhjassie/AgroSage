import 'package:agrosage/model/blog_model.dart';
import 'package:agrosage/widgets/section_header.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LawId extends StatelessWidget {
  const LawId({
    super.key,
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
            child: SectionHeader(
              title: 'Learn ',
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.27,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: blogs.length,
              itemBuilder: (context, index) {
                return LawCard(
                  blog: blogs[index],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class LawCard extends StatelessWidget {
  const LawCard({
    super.key,
    required this.blog,
  });

  final Blog blog;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed('/blog', arguments: blog);
      },
      child: Container(
        margin: const EdgeInsets.only(right: 10),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.45,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                image: DecorationImage(
                  image: NetworkImage(
                    blog.cropUrl, // Placeholder if no image URL is available
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
                height: 50,
                width: MediaQuery.of(context).size.width * 0.37,
                margin: const EdgeInsets.only(bottom: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  color: Theme.of(context).colorScheme.background,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 5.0),
                      child: Text(
                        blog.description,
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.onBackground,
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                )),
            Positioned(
              // Adjust positioning as needed
              top: 20.0,
              left: 20.0,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
