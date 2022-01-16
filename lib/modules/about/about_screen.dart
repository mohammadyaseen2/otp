import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:otp/shared/theme/colors.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var model = [
      {
        'image': 'assets/mohdyas.jpg',
        'name': 'Mohammad Tayseer Yaseen',
        'id': '120180622031',
      },
      {
        'image': 'assets/hasan.jpg',
        'name': 'Hasan Talal Zaroor',
        'id': '120190622021',
      },
      {
        'image': 'assets/mohdarafat.jpg',
        'name': 'Mohammad Abd-Althaher Arafat',
        'id': '120190622003',
      },
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Padding(
          padding: EdgeInsets.all(10.0),
          child: Text(
            'Developers Team',
            style: TextStyle(
              fontSize: 25,
              color: primaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Wrap(
              children: List.generate(
                  model.length,
                  (index) => card(
                        context,
                        model[index],
                        index,
                      )),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            'v1.0.0',
            style: Theme.of(context).textTheme.bodyText1!.copyWith(
                  fontSize: 15,
                ),
          ),
        ),
      ],
    );
  }

  Widget card(context, model, index) => AnimationConfiguration.staggeredGrid(
        position: index,
        columnCount: 3,
        duration: const Duration(milliseconds: 1000),
        child: ScaleAnimation(
          scale: 0,
          child: FadeInAnimation(
            child: SizedBox(
              width: 300,
              child: Card(
                margin: const EdgeInsets.all(10),
                elevation: 5,
                borderOnForeground: true,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      CircleAvatar(
                          radius: 50,
                          backgroundImage: AssetImage(model['image'])),
                      const SizedBox(height: 20),
                      Text(
                        model['name'],
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        model['id'],
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              fontSize: 15,
                              color: Colors.grey,
                            ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 5),
                      Text(
                        'Computer Science',
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              fontSize: 15,
                              color: Colors.grey,
                            ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                color: Theme.of(context).backgroundColor,
              ),
            ),
          ),
        ),
      );
}
