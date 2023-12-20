import 'package:flutter/material.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/screens/home_screen.dart';
import 'package:news_app/widgets/bottom_nav_bar.dart';

import 'article_screen.dart';

class DiscoverScreen extends StatelessWidget {
  const DiscoverScreen({super.key});
  static const routeName = '/discover';
  @override
  Widget build(BuildContext context) {
    List<String> tabs = ['Health', 'Politics', 'Sports', 'Frauds', 'Market'];
    //Article article = Article.articles[0];
    return DefaultTabController(
      initialIndex: 0,
      length: tabs.length,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.menu,
                color: Colors.black,
              )),
        ),
        bottomNavigationBar: const BottomNavBar(index: 1),
        body: ListView(
          padding: const EdgeInsets.all(20),
          children: [const _DiscoverNews(), _CategoryNews(tabs: tabs)],
        ),
      ),
    );
  }
}

class _CategoryNews extends StatelessWidget {
  const _CategoryNews({
    super.key,
    required this.tabs,
  });

  final List<String> tabs;

  @override
  Widget build(BuildContext context) {
    final articles = Article.articles;
    return Column(
      children: [
        TabBar(
          isScrollable: true,
          indicatorColor: Colors.black,
          tabs: tabs
              .map(
                (tab) => Tab(
                  icon: Text(tab,
                      style:
                          Theme.of(context).textTheme.headlineSmall!.copyWith(
                                fontWeight: FontWeight.w600,
                              )),
                ),
              )
              .toList(),
        ),
        SizedBox(
            height: MediaQuery.of(context).size.height,
            child: TabBarView(
                children: tabs
                    .map(
                      (tab) => ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: articles.length,
                        itemBuilder: ((context, index) {
                          return InkWell(
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                ArticleScreen.routeName,
                                arguments: articles[index],
                              );
                            },
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  //margin: const EdgeInsets.all(20.0),
                                  //borderRadius: 5,
                                  child: Image(
                                    width: 100,
                                    height: 80,
                                    image: AssetImage(articles[index].imageUrl),
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(articles[index].title,
                                          maxLines: 2,
                                          overflow: TextOverflow.clip,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyLarge!
                                              .copyWith(
                                                  fontWeight: FontWeight.bold)),
                                      const SizedBox(height: 10),
                                      Row(
                                        children: [
                                          const Icon(
                                            Icons.schedule,
                                            size: 18,
                                          ),
                                          Text(
                                            '${DateTime.now().difference(articles[index].createdAt).inHours} hours ago    ',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodySmall!,
                                          ),
                                          const Icon(
                                            Icons.visibility,
                                            size: 18,
                                          ),
                                          Text(
                                            '${articles[index].views} views',
                                            style:
                                                const TextStyle(fontSize: 12),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          );
                        }),
                      ),
                    )
                    .toList())),
      ],
    );
  }
}

class _DiscoverNews extends StatelessWidget {
  const _DiscoverNews({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.25,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Discover',
              style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.w900,
                  )),
          Text(
            'News from all over the world',
            style: Theme.of(context).textTheme.bodySmall!,
          ),
          const SizedBox(height: 5),
          TextFormField(
            decoration: InputDecoration(
                hintText: 'Search here',
                fillColor: Colors.grey.shade200,
                filled: true,
                prefixIcon: const Icon(
                  Icons.search,
                  color: Colors.grey,
                ),
                suffixIcon: const RotatedBox(
                  quarterTurns: 1,
                  child: Icon(
                    Icons.tune,
                    color: Colors.grey,
                  ),
                ),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    borderSide: BorderSide.none)),
          ),
        ],
      ),
    );
  }
}
