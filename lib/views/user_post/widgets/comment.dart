import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Comment extends ConsumerWidget {
  const Comment();

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10.0,
                  vertical: 1.0,
                ),
                child: Container(
                  width: 20.0,
                  height: 25.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage('assets/images/Skillmer.png'),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              Flexible(
                child: RichText(
                  text: new TextSpan(
                    // Note: Styles for TextSpans must be explicitly defined.
                    // Child text spans will inherit styles from parent
                    style: new TextStyle(
                      fontSize: 14.0,
                    ),
                    children: <TextSpan>[
                      new TextSpan(
                          text: 'Dextavision ',
                          style: new TextStyle(fontWeight: FontWeight.bold)),
                      new TextSpan(
                        text: 'Voll der mega krasse Comment, beste App ever!',
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
          Row(
            children: [
              SizedBox(
                width: 25.0,
              ),
              IconButton(
                icon: Icon(Icons.plus_one_outlined),
                onPressed: () {},
                iconSize: 20.0,
                color: Colors.white,
              ),
              SizedBox(width: 20.0),
              Text('Answer'),
            ],
          )
        ],
      ),
    );
  }
}
