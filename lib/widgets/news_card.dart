import 'package:agrosage/model/news_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class NewslistCard extends StatelessWidget {
  const NewslistCard({
    super.key,
    required this.newslist,
  });

  final Newslist newslist;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed('/newslist', arguments: newslist);
      },
      child: Container(
        height: 75,
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: Image.network(
                newslist.imageUrl,
                height: 50,
                width: 50,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    newslist.title,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '${newslist.blogs.length} news',
                    maxLines: 2,
                    style:const TextStyle(
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ],
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.arrow_forward_ios,
                color: Theme.of(context).colorScheme.onBackground,
              ),
            ),
          ],
        ),
      ),
    );
  }
}