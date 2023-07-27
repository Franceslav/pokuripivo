import 'package:flutter/material.dart';
import 'package:pivo/Theme/app_button_style.dart';
import 'package:pivo/resources/resources.dart';

class PivoDetailsMainInfoWidget extends StatelessWidget {
  const PivoDetailsMainInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _TopPosterWidget(),
      ],
    );
  }
}

class _TopPosterWidget extends StatelessWidget {
  const _TopPosterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image(
          image: AssetImage(AppImages.k1664CmykCocardeLockupPrimarySimplePos),
        ),
      ],
    );
  }
}

class PivoNamedWidget extends StatelessWidget {
  const PivoNamedWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      maxLines: 3,
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
            text: 'Blanche Kronenburg 1664',
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17),
          ),
          TextSpan(
            text: ' (Франция)',
            style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
          ),
        ],
      ),
    );
  }
}

class ScoreWidget extends StatelessWidget {
  const ScoreWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Row(children: [
          TextButton(
              style: AppButtonStyle.linkButton,
              onPressed: () {},
              child: Row(children: [
                /* Шкала Оценки */
                Text(
                  'Оценка',
                )
              ]))
        ]),
        Container(
          width: 1,
          height: 15,
          color: Colors.grey,
        ),
        Row(
          children: [
            Icon(Icons.play_arrow),
            TextButton(
                style: AppButtonStyle.linkButton,
                onPressed: () {},
                child: Text('Посмотреть обзор')),
          ],
        ),
      ],
    );
  }
}

class SummeryWidget extends StatelessWidget {
  const SummeryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Color.fromRGBO(243, 186, 0, 0.976),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 65),
        child: Text(
          'светлый нефильтрованный эль, объем 0.46',
          maxLines: 2,
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.w400, fontSize: 16),
        ),
      ),
    );
  }
}

class PeopleWidget extends StatelessWidget {
  const PeopleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final comments = TextStyle(
        color: Colors.white, fontWeight: FontWeight.w400, fontSize: 16);
    final recommendation = TextStyle(
        color: Colors.white, fontWeight: FontWeight.w400, fontSize: 16);

    return Column(
      children: [
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Comments', style: comments),
                  Text('Recommendation', style: recommendation)
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Comments', style: comments),
                  Text('Recommendation', style: recommendation)
                ],
              ),
            )
          ],
        )
      ],
    );
  }
}
