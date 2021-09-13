import 'package:flutter/material.dart';
import 'package:skillmer/shared/constants.dart';
import 'package:skillmer/views/news/widgets/four_players_news.dart';
import 'package:skillmer/views/news/widgets/gamepro_news.dart';
import 'package:skillmer/views/news/widgets/gamestar_news.dart';

class News extends StatelessWidget {
  const News({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        SizedBox(
          height: 50.0,
          child: Center(
            child: Text(
              'Gamestar News',
              style: newsHeader,
            ),
          ),
        ),
        Expanded(
          child: GamestarNews(),
        ),
        SizedBox(
          height: 50.0,
          child: Center(
            child: Text(
              'Gamepro News',
              style: newsHeader,
            ),
          ),
        ),
        Expanded(
          child: GameproNews(),
        ),
        // Container(
        //   height: 50.0,
        //   child: Center(
        //     child: Text(
        //       'IGN.com News',
        //       style: newsHeader,
        //     ),
        //   ),
        // ),
        // Expanded(
        //   child: IgnNews(),
        // ),
        SizedBox(
          height: 50.0,
          child: Center(
            child: Text(
              '4Players News',
              style: newsHeader,
            ),
          ),
        ),
        Expanded(
          child: FourPlayersNews(),
        ),
      ],
    );
  }
}
