import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:webfeed/webfeed.dart';
import 'package:http/http.dart' as http;

// ###############################
// NEWS PROVIDER
// ###############################
final newsProviderAsync =
    FutureProvider.family<List<RssItem>, String>((ref, url) async {
  final client = http.Client();

  var response = await client.get(Uri.parse(url));

  DateTime currDate = DateTime.now();
  DateTime compareDate =
      DateTime(currDate.year, currDate.month - 2, currDate.day);

  return RssFeed.parse(response.body)
      .items!
      .where((element) => element.pubDate!.month > compareDate.month)
      .toList();
});
