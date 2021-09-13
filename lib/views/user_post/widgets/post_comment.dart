import 'package:flutter/material.dart';
import 'package:skillmer/shared/constants.dart';
import 'package:skillmer/shared/utilitys.dart';

class PostComment extends StatelessWidget {
  const PostComment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
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
                    decoration: const BoxDecoration(
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
                    text: const TextSpan(
                      style: TextStyle(
                        fontSize: 14.0,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                            text: 'Dextavision ',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        TextSpan(
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
                const SizedBox(
                  width: 40.0,
                ),
                const Text('20h'),
                IconButton(
                  icon: const Icon(Icons.plus_one_outlined),
                  onPressed: () {},
                  iconSize: 20.0,
                  color: Colors.white,
                ),
                const Text('Answer'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
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
                    child: const Text(
                      'Show Answers (42)',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () {},
                  ),
                ),
                const SizedBox(
                  width: 40.0,
                  child: Divider(
                    thickness: 5.0,
                    color: accentColor,
                  ),
                ),
              ],
            ),
            Visibility(
              visible: false,
              child: SingleChildScrollView(
                physics: const ScrollPhysics(),
                child: Column(
                  children: <Widget>[
                    ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 2,
                      itemBuilder: (context, index) {
                        return const PostComment();
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
