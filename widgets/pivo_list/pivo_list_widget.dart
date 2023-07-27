import 'package:flutter/material.dart';
import 'package:pivo/resources/resources.dart';

class Pivo {
  String imageName;
  final int id;
  final String title;
  final String sort;
  final String description;
  Pivo({
    required this.imageName,
    required this.id,
    required this.title,
    required this.sort,
    required this.description,
  });
}

class PivoListWidget extends StatefulWidget {
  PivoListWidget({Key? key}) : super(key: key);

  @override
  State<PivoListWidget> createState() => _PivoListWidgetState();
}

class _PivoListWidgetState extends State<PivoListWidget> {
  final _pivo = [
    Pivo(
        imageName: AppImages.blanc,
        id: 1,
        title: 'Blanche Kronenburg 1664',
        sort: 'Пшеничное пиво',
        description:
            'Пиво золотисто-желтого цвета с обильной белоснежной пеной обладает необычным легким ароматом, в котором преобладают кориандр, хмелевые, солодовые и цитрусовые оттенки. Вкус – сухой, свежий, мягкий с приятной горчинкой, уравновешенной фруктовыми нотами, чувствуется привкус грейпфрута. Послевкусие легкое, освежающее. В продажу пиво поступает в фирменной таре.'),
    Pivo(
        id: 2,
        imageName: AppImages.c0626401154d6fa01b80d67837aaddfe,
        title: 'Franziskainer',
        sort: 'Пшеничное пиво',
        description:
            'Пиво золотисто-желтого цвета с обильной белоснежной пеной обладает необычным легким ароматом, в котором преобладают кориандр, хмелевые, солодовые и цитрусовые оттенки. Вкус – сухой, свежий, мягкий с приятной горчинкой, уравновешенной фруктовыми нотами, чувствуется привкус грейпфрута. Послевкусие легкое, освежающее. В продажу пиво поступает в фирменной таре.'),
    Pivo(
        id: 3,
        imageName: AppImages.e36d05e10895ecacfe301d349b57a9,
        title: 'Carlsberg',
        sort: 'Пшеничное пиво',
        description:
            'Пиво золотисто-желтого цвета с обильной белоснежной пеной обладает необычным легким ароматом, в котором преобладают кориандр, хмелевые, солодовые и цитрусовые оттенки. Вкус – сухой, свежий, мягкий с приятной горчинкой, уравновешенной фруктовыми нотами, чувствуется привкус грейпфрута. Послевкусие легкое, освежающее. В продажу пиво поступает в фирменной таре.'),
    Pivo(
        id: 4,
        imageName: AppImages.prazacka,
        title: 'Prazacka',
        sort: 'Пшеничное пиво',
        description:
            'Пиво золотисто-желтого цвета с обильной белоснежной пеной обладает необычным легким ароматом, в котором преобладают кориандр, хмелевые, солодовые и цитрусовые оттенки. Вкус – сухой, свежий, мягкий с приятной горчинкой, уравновешенной фруктовыми нотами, чувствуется привкус грейпфрута. Послевкусие легкое, освежающее. В продажу пиво поступает в фирменной таре.'),
    Pivo(
        id: 5,
        imageName: AppImages.a369d5cc14cb99b9f34743650a0691,
        title: 'Hoegarden',
        sort: 'Пшеничное пиво',
        description:
            'Пиво золотисто-желтого цвета с обильной белоснежной пеной обладает необычным легким ароматом, в котором преобладают кориандр, хмелевые, солодовые и цитрусовые оттенки. Вкус – сухой, свежий, мягкий с приятной горчинкой, уравновешенной фруктовыми нотами, чувствуется привкус грейпфрута. Послевкусие легкое, освежающее. В продажу пиво поступает в фирменной таре.'),
  ];

  var _filteredPivo = <Pivo>[];
  final _searchConroller = TextEditingController();

  void _searchPivo() {
    final query = _searchConroller.text;
    if (query.isNotEmpty) {
      _filteredPivo = _pivo.where((Pivo pivo) {
        return pivo.title.toLowerCase().contains(query.toLowerCase());
      }).toList();
    } else {
      _filteredPivo = _pivo;
    }
    setState(() {});
  }

  @override
  void initState() {
    super.initState();

    _filteredPivo = _pivo;
    _searchConroller.addListener(_searchPivo);
  }

  void _onPivoTap(int index) {
    final id = _pivo[index].id;
    Navigator.of(context).pushNamed(
      '/main_screen/pivo_details',
      arguments: id,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView.builder(
            padding: EdgeInsets.only(top: 70),
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            itemCount: _filteredPivo.length,
            itemExtent: 163,
            itemBuilder: (BuildContext context, int index) {
              final pivo = _filteredPivo[index];
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          border:
                              Border.all(color: Colors.brown.withOpacity(0.2)),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.white,
                              blurRadius: 8,
                              offset: Offset(0, 2),
                            )
                          ]),
                      clipBehavior: Clip.hardEdge,
                      child: Row(
                        children: [
                          Image(image: AssetImage(pivo.imageName)),
                          SizedBox(width: 15),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 20),
                                Text(
                                  pivo.title,
                                  maxLines: 1,
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                SizedBox(height: 5),
                                Text(pivo.sort,
                                    maxLines: 1,
                                    style: TextStyle(color: Colors.grey)),
                                SizedBox(height: 20),
                                Text(
                                  pivo.description,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                )
                              ],
                            ),
                          ),
                          SizedBox(width: 15),
                        ],
                      ),
                    ),
                    Material(
                      color: Colors.transparent,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(10),
                        onTap: () => _onPivoTap(index),
                      ),
                    )
                  ],
                ),
              );
            }),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: TextField(
            controller: _searchConroller,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white.withAlpha(235),
              border: OutlineInputBorder(),
            ),
          ),
        ),
      ],
    );
  }
}
