import 'package:equatable/equatable.dart';

class Article extends Equatable {
  final String id;
  final String title;
  final String subtitle;
  final String body;
  final String author;
  //final String authorImageUrl;
  final String category;
  final String imageUrl;
  final int views;
  final DateTime createdAt;

  const Article({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.body,
    required this.author,
    //required this.authorImageUrl,
    required this.category,
    required this.imageUrl,
    required this.views,
    required this.createdAt,
  });
  static List<Article> articles = [
    Article(
      id: '1',
      title:
          'Donald Trump endorses Jim Jordan to succeed Kevin McCarthy as U.S. House speaker',
      subtitle:
          'Donald Trump wrote on his Truth Social site, “Congressman Jim Jordan has been a STAR long before making his very successful journey to Washington, D.C., representing Ohio’s 4th Congressional District”',
      body:
          'Donald Trump, the current GOP Presidential front-runner, has used the leadership vacuum on the Hill to further demonstrate his control over the Republican Party. House Republicans are deeply fractured and some have been asking him to lead them — a seemingly fanciful suggestion that he also promoted after inflaming the divisions that forced out Kevin McCarthy as Speaker.',
      author: 'Mr. Sharma',
      //authorImageUrl: authorImageUrl,
      category: 'Politics', //https://unsplash.com/photos/WpOMM4uE-F8
      imageUrl: 'images/at1.png',
      views: 1200,
      createdAt: DateTime.now().subtract(Duration(hours: 2)),
    ),
    Article(
      id: '2',
      title:
          'Asian Games | Indian women thump Nepal, storms into kabaddi final',
      subtitle:
          'Led ably by Ritu Negi, India defeated Nepal by a comfortable margin of 61-17. At half-time, India were well and truly in command at 29-10.',
      body:
          'The Indian women\'s kabaddi team assured the country of a silver at least after they got the better of Nepal in the semi-final of the team event in the ongoing Asian Games in Hangzhou on October 6. Led ably by Ritu Negi, India defeated Nepal by a comfortable margin of 61-17. At half-time, India were well and truly in command at 29-10.',
      author: 'Mr. Gupta',
      //authorImageUrl: authorImageUrl,
      category: 'Sports',
      imageUrl: 'images/at2.png',
      views: 1553,
      createdAt: DateTime.now().subtract(Duration(hours: 3)),
    ),
    Article(
      id: '3',
      title:
          'World Mental Health Day 2023: Date, Theme and Significance Of The Day',
      subtitle:
          'world mental health day 2023: date, theme and significance of the day',
      body:
          'World Mental Health Day is observed every year globally on October 10. The day aims to raise awareness on mental health issues and also provide support for people with mental health issues. On World Mental Health Day, people organise seminars, workshops, events and conferences which aim to educate people about mental health issues and ways to manage and prevent them.',
      author: 'Mr. Smith',
      //authorImageUrl: authorImageUrl,
      category: 'Health',
      imageUrl: 'images/at3.png',
      views: 2254,
      createdAt: DateTime.now().subtract(Duration(hours: 3)),
    ),
    Article(
      id: '4',
      title: 'Money Laundering Case Live News Updates',
      subtitle: 'ED raids premises of AAP MLA Amanatullah Khan in Delhi',
      body:
          'Money Laundering Case Live News Updates: The Enforcement Directorate on Tuesday raided the premises of AAP MLA Amanatullah Khan in Delhi as part of a money-laundering investigation against him and some others, official sources said.',
      author: 'Mrs. Chakravarti',
      //authorImageUrl: authorImageUrl,
      category: 'Frauds',
      imageUrl: 'images/at4.png',
      views: 554,
      createdAt: DateTime.now().subtract(Duration(hours: 4)),
    ),
    Article(
      id: '5',
      title: 'Mutual Funds - News, Reviews & Analysis',
      subtitle: 'Small cap funds broaden their stock holdings to spread risk',
      body:
          '"Given the limited liquidity in most small-cap stocks, a fund\'s internal prudential scrip wise exposure limits and the fund manager\'s perception on their valuation post the recent run-up, it is imperative for them to look for newer stocks to invest in," said Deepak Jasani, head of retail research at HDFC Securities.',
      author: 'Mrs. Khanna',
      //authorImageUrl: authorImageUrl,
      category: 'Market',
      imageUrl: 'images/at5.png',
      views: 1554,
      createdAt: DateTime.now().subtract(Duration(hours: 5)),
    ),
  ];

  @override
  List<Object?> get props => [
        id,
        title,
        subtitle,
        body,
        author,
        //autorImageUrl,
        category,
        imageUrl,
        views,
        createdAt,
      ];
}
