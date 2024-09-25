import 'package:flutter/material.dart';

class BuildArticalItem extends StatelessWidget {
  final dynamic article; // هنا نحدد المتغير الذي سنستقبل فيه المقال

  const BuildArticalItem(this.article,
      {super.key}); // تعديل البناء ليشمل المعطى

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: article['urlToImage'] != null && article['urlToImage'] != 'https://thumbs.dreamstime.com/b/news-woodn-dice-depicting-letters-bundle-small-newspapers-leaning-left-dice-34802664.jpg'
                    ? NetworkImage(article['urlToImage'])
                    : NetworkImage('https://thumbs.dreamstime.com/b/news-woodn-dice-depicting-letters-bundle-small-newspapers-leaning-left-dice-34802664.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            // استخدام Expanded لتوسيع العمود
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "${article['title']}", // استبدل بعنوان المقال
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  "${article['publishedAt']}", // استبدل بعنوان المقال
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
class ArticleBuilder extends StatelessWidget {
  final List<dynamic> list; // Define the type of your list here

  const ArticleBuilder({super.key, required this.list});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) => BuildArticalItem(list[index]),
      separatorBuilder: (context, index) => const Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Divider(),
      ),
      itemCount: list.length,
    );
  }
}
