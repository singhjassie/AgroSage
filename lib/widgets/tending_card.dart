import 'package:agrosage/model/blog_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TrendingCard extends StatelessWidget {
  const TrendingCard({
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
                borderRadius: BorderRadius.circular(18.0),
                image: DecorationImage(
                  image: AssetImage(
                    blog.coverUrl,
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
                borderRadius: BorderRadius.circular(18.0),
                color:Theme.of(context).colorScheme.background,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        blog.title,
                        style:  TextStyle(
                          color: Theme.of(context).colorScheme.onBackground,
                          fontSize: 11,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      Text(
                        blog.description,
                        style: TextStyle(
                              color: Theme.of(context).colorScheme.onBackground.withOpacity(0.3),
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ],
                  ),
                  const  Icon(
                    Icons.arrow_forward_ios,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}