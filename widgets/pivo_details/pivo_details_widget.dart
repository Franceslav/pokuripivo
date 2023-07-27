import 'package:flutter/material.dart';
import 'package:pivo/widgets/pivo_details/pivo_details_main_widget_info.dart';
import 'package:pivo/widgets/pivo_details/pivo_details_screen_cast_widget.dart';

class PivoDetailWidget extends StatefulWidget {
  final int pivoId;
  const PivoDetailWidget({super.key, required this.pivoId});

  @override
  State<PivoDetailWidget> createState() => _PivoDetailWidgtState();
}

class _PivoDetailWidgtState extends State<PivoDetailWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Blanche Kronenburg 1664'),
      ),
      body: ColoredBox(
        color: Color.fromRGBO(224, 172, 1, 1),
        child: ListView(
          children: [
            PivoDetailsMainInfoWidget(),
            PivoNamedWidget(),
            ScoreWidget(),
            SummeryWidget(),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: _OverViewWidget(),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: DescriptionWidget(),
            ),
            SizedBox(height: 30),
            PeopleWidget(),
            SizedBox(height: 30),
            PivoDetailsScreenCastWidget()
          ],
        ),
      ),
    );
  }
}

class DescriptionWidget extends StatelessWidget {
  const DescriptionWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      'Пиво золотисто-желтого цвета с обильной белоснежной пеной обладает необычным легким ароматом, в котором преобладают кориандр, хмелевые, солодовые и цитрусовые оттенки. Вкус – сухой, свежий, мягкий с приятной горчинкой, уравновешенной фруктовыми нотами, чувствуется привкус грейпфрута. Послевкусие легкое, освежающее.',
      style: TextStyle(
          color: Colors.white, fontWeight: FontWeight.w400, fontSize: 16),
    );
  }
}

class _OverViewWidget extends StatelessWidget {
  const _OverViewWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      'Обзор',
      style: TextStyle(
          color: Colors.white, fontWeight: FontWeight.w400, fontSize: 16),
    );
  }
}
