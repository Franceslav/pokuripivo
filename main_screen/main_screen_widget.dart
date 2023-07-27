import 'package:flutter/material.dart';
import 'package:pivo/widgets/pivo_list/pivo_list_widget.dart';

final List<MenuRowData> menuRow = [
  MenuRowData(Icons.favorite, 'Кравтовое пиво'),
  MenuRowData(Icons.favorite, 'Пиво'),
  MenuRowData(Icons.favorite, 'Сидр')
];

class MainScreenWidget extends StatefulWidget {
  const MainScreenWidget({super.key});

  @override
  State<MainScreenWidget> createState() => _MainScreenWidgetState();
}

class _MainScreenWidgetState extends State<MainScreenWidget> {
  int _selectedTab = 0;

  void onSelectedTab(int index) {
    setState(() {
      _selectedTab = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ПокуриПиво'),
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedTab,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Меню'),
            BottomNavigationBarItem(icon: Icon(Icons.phone), label: 'Пиво'),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite), label: 'Избранное'),
          ],
          onTap: onSelectedTab),
      body: IndexedStack(
        index: _selectedTab,
        children: [
          Text(
            'Пиво',
          ),
          PivoListWidget(),
          Text(
            'Избранное',
          )
        ],
      ),
    );
  }
}

class MenuRowData {
  final IconData icon;
  final String text;
  MenuRowData(this.icon, this.text);
}

class _MenuWidget extends StatelessWidget {
  final List<MenuRowData> menuRow;
  const _MenuWidget({
    Key? key,
    required this.menuRow,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromARGB(255, 219, 184, 28),
      width: double.infinity,
      child: Column(
        children: menuRow.map((data) => _MenuWidgetRow(data: data)).toList(),
      ),
    );
  }
}

class _MenuWidgetRow extends StatelessWidget {
  final MenuRowData data;
  const _MenuWidgetRow({super.key, required this.data});
  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 10),
      ),
      child: Container(
        height: 100,
        margin: const EdgeInsets.only(top: 10.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            SizedBox(width: 15),
            Icon(data.icon),
            SizedBox(width: 15),
            Text(data.text),
          ],
        ),
      ),
    );
  }
}

class _UserInfo extends StatelessWidget {
  const _UserInfo({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: double.infinity,
      margin: const EdgeInsets.only(top: 10.0),
      child: Column(
        children: [
          SizedBox(height: 30),
          ImageWidget(),
          SizedBox(height: 30),
          _Text1(),
          SizedBox(height: 10),
          _Text2()
        ],
      ),
    );
  }
}

class _Text2 extends StatelessWidget {
  const _Text2({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Text('или выбрать подходящее',
        style: TextStyle(color: Colors.brown, fontSize: 20));
  }
}

class _Text1 extends StatelessWidget {
  const _Text1({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Text('Здесь вы можете оставить отзыв о пиве',
        style: TextStyle(color: Colors.brown, fontSize: 20));
  }
}

class ImageWidget extends StatelessWidget {
  const ImageWidget({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 200,
      child: Image.network(
          'https://i.pinimg.com/originals/4d/92/e9/4d92e90b5233854035ae99f92397e0ed.png'),
    );
  }
}
