import 'package:flutter/material.dart';
import 'package:news_app/screens/screens.dart';

import '../models/article_model.dart';
import '../widgets/CustomTag.dart';
import '../widgets/bottom_nav_bar.dart';

class ArticleScreen extends StatelessWidget {
  const ArticleScreen({super.key});

  static const routeName = '/article';

  @override
  Widget build(BuildContext context) {
    final article = ModalRoute.of(context)!.settings.arguments as Article;
    return Container(
      width: double.infinity,
      //imageUrl: article.imageUrl,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: ListView(
          children: [
            _NewsHeadLine(
              article: article,
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.7,
              padding: const EdgeInsets.all(20.0),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                ),
                color: Colors.white,
              ),
              alignment: Alignment.center,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomTag(
                        backgroundColor: Colors.black,
                        children: [
                          const Icon(
                            Icons.person,
                            color: Colors.white,
                            size: 20,
                          ),
                          const SizedBox(width: 5),
                          Text(
                            article.author,
                            style:
                                Theme.of(context).textTheme.bodyLarge!.copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontSize: 16,
                                    ),
                          ),
                        ],
                      ),
                      const SizedBox(width: 15),
                      CustomTag(
                        backgroundColor: Color.fromARGB(255, 227, 219, 219),
                        children: [
                          const Icon(
                            Icons.timer,
                            size: 20,
                          ),
                          const SizedBox(width: 5),
                          Text(
                            '${DateTime.now().difference(article.createdAt).inHours} h    ',
                            style:
                                Theme.of(context).textTheme.bodyLarge!.copyWith(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                          ),
                        ],
                      ),
                      const SizedBox(width: 15),
                      CustomTag(
                        backgroundColor: Color.fromARGB(255, 227, 219, 219),
                        children: [
                          const Icon(
                            Icons.visibility,
                            size: 20,
                          ),
                          const SizedBox(width: 5),
                          Text(
                            '${article.views}',
                            style:
                                Theme.of(context).textTheme.bodyLarge!.copyWith(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    article.subtitle,
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                        ),
                    textAlign: TextAlign.justify,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    article.body,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontSize: 16,
                        ),
                    textAlign: TextAlign.justify,
                  ),
                  Image(
                    width: 300,
                    height: 200,

                    //margin: const EdgeInsets.all(20.0),
                    //borderRadius: 5,
                    image: AssetImage(article.imageUrl),
                    //imageUrl: articles[index].imageUrl
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

class _NewsHeadLine extends StatelessWidget {
  const _NewsHeadLine({
    Key? key,
    required this.article,
  }) : super(key: key);

  final Article article;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(13.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.05,
          ),
          Container(
            padding: const EdgeInsets.all(9.0),
            decoration: BoxDecoration(
              color: Colors.white70,
              border: Border.all(
                color: Colors.black,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Text(
              article.category,
              style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Container(
            padding: const EdgeInsets.all(9.0),
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 52, 50, 50),
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Text(
              article.title,
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .copyWith(color: Colors.white, fontWeight: FontWeight.w800),
            ),
          ),
        ],
      ),
    );
  }
}
