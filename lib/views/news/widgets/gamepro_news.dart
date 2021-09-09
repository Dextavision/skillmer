import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skillmer/view_model/providers/news_provider.dart';
import 'package:webfeed/webfeed.dart';
import 'package:url_launcher/url_launcher.dart';

class GameproNews extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final AsyncValue<List<RssItem>> newsFeed =
        watch(newsProviderAsync("https://www.gamepro.de/rss/gpnews.rss"));

    return newsFeed.when(
      loading: () => Center(
        child: CircularProgressIndicator(),
      ),
      error: (error, stack) => Text('Oops, something unexpected happened'),
      data: (news) => ListView.builder(
        itemCount: news.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: news[index].enclosure != null
                ? Image.network(news[index].enclosure!.url!)
                : Image.asset("assets/images/news_default.png"),
            title: Text(
              news[index].title!,
            ),
            onTap: () async {
              String _url = news[index].link!;
              await canLaunch(_url)
                  ? await launch(_url)
                  : throw 'Could not launch $_url';
            },
          );
        },
      ),
    );
  }
}
