import 'package:flutter/material.dart';
import 'package:skillmer/shared/constants.dart';
import 'package:skillmer/shared/utilitys.dart';

class CommentsComment extends StatelessWidget {
  const CommentsComment();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 35.0),
      child: Card(
        elevation: 0,
        color: scaffoldBackgroundColor,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: Utility.getPostLevelColor(0),
            width: 0.6,
          ),
          borderRadius: BorderRadius.circular(4.0),
        ),
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
                  width: 40.0,
                ),
                Text('20h'),
                IconButton(
                  icon: Icon(Icons.plus_one_outlined),
                  onPressed: () {},
                  iconSize: 20.0,
                  color: Colors.white,
                ),
                Text('Answer'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 40.0,
                  child: Divider(
                    thickness: 5.0,
                    color: accentColor,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10.0,
                  ),
                  child: TextButton(
                    child: Text(
                      'Show Answers (2)',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () {},
                  ),
                ),
                Container(
                  width: 40.0,
                  child: Divider(
                    thickness: 5.0,
                    color: accentColor,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
