import 'package:flutter/material.dart';
import 'package:pivo/resources/app_images.dart';

class PivoDetailsScreenCastWidget extends StatelessWidget {
  const PivoDetailsScreenCastWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text('Рекомендации',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
          ),
          SizedBox(
            height: 200,
            child: Scrollbar(
              child: ListView.builder(
                  itemCount: 20,
                  itemExtent: 120,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Colors.brown.withOpacity(0.2)),
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.white,
                                blurRadius: 8,
                                offset: Offset(0, 2),
                              )
                            ]),
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          clipBehavior: Clip.hardEdge,
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Image(
                                  image: AssetImage(
                                      AppImages.a369d5cc14cb99b9f34743650a0691),
                                  fit: BoxFit.fill,
                                  width: 160,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text('Hoegaarden'),
                                    SizedBox(height: 7),
                                    Text('Пшеничное'),
                                    SizedBox(height: 7),
                                    Text('Бельгия'),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(3.0),
            child: TextButton(
                onPressed: () {}, child: Text('Возможно вам понравится')),
          )
        ],
      ),
    );
  }
}
