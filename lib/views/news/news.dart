import 'package:flutter/material.dart';
import 'package:skillmer/shared/constants.dart';
import 'package:skillmer/views/news/widgets/four_players_news.dart';
import 'package:skillmer/views/news/widgets/gamepro_news.dart';
import 'package:skillmer/views/news/widgets/gamestar_news.dart';
import 'package:skillmer/views/news/widgets/ign_news.dart';

class News extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
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
        Container(
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
        Container(
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
