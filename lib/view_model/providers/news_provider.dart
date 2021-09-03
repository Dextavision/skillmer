import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:webfeed/webfeed.dart';
import 'package:http/http.dart' as http;

// ###############################
// NEWS PROVIDER
// ###############################
final newsProviderAsync = FutureProvider<List<RssItem>>((ref) async {
  final client = http.Client();

  var response =
      await client.get(Uri.parse('https://www.gamestar.de/news/rss/news.rss'));

  return RssFeed.parse(response.body).items!;
});
