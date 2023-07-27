import 'package:flutter/material.dart';
import 'package:pivo/Theme/app_colors.dart';
import 'package:pivo/main_screen/main_screen_widget.dart';

import 'package:pivo/widgets/auth/auth_widget.dart';
import 'package:pivo/widgets/pivo_details/pivo_details_widget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Покури пиво',
      theme: ThemeData(
          appBarTheme: AppBarTheme(backgroundColor: AppColors.MainPivoColor),
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
              backgroundColor: AppColors.MainPivoColor),
          unselectedWidgetColor: Colors.black),
      routes: {
        '/': (context) => const AuthWidget(),
        '/main_screen': (context) => const MainScreenWidget(),
        '/main_screen/pivo_details': (context) {
          final arguments = ModalRoute.of(context)?.settings.arguments;
          if (arguments is int) {
            return PivoDetailWidget(pivoId: arguments);
          } else {
            return PivoDetailWidget(pivoId: 0);
          }
        },
      },
      initialRoute: '/',
    );
  }
}
