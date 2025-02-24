import 'package:flutter/material.dart';
import 'package:layoutsdesing/widgets/line_painter.dart';
import 'package:layoutsdesing/widgets/project_cards.dart';

class SpeakersLayout extends StatefulWidget {
  const SpeakersLayout({super.key});

  @override
  _SpeakersLayout createState() => _SpeakersLayout();
}

class _SpeakersLayout extends State<SpeakersLayout> {

  final List<Map<String, String>> items = [
    {
      "title": "Titulo ponencia 1",
      "author": "Autores.",
    },
    {
      "title": "Titulo ponencia 2",
      "author": "Autores.",
    },
    {
      "title": "Titulo ponencia 3",
      "author": "Autores.",
    },
    {
      "title": "Titulo ponencia 4",
      "author": "Autores.",
    },
    {
      "title": "Titulo ponencia 5",
      "author": "Autores.",
    },
    {
      "title": "Titulo ponencia 6",
      "author": "Autores.",
    },
    {
      "title": "Titulo ponencia 7",
      "author": "Autores.",
    },
    {
      "title": "Titulo ponencia 8",
      "author": "Autores.",
    },
    {
      "title": "Titulo ponencia 9",
      "author": "Autores.",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 100,
                height: 110,
                child: Image.asset('assets/images/logomonlau.png'),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 13.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 150,
                            child: Text(
                              "Ponencias",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 17),
                            ),
                          ),
                          const SizedBox(width: 110),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  CustomPaint(
                    size: Size(100, 10),
                    painter: LinePainter(),
                  )
                ],
              ),
              Expanded(
                  child: ListView.builder(
                    padding: EdgeInsets.zero,
                    itemCount: items.length,
                    itemBuilder: (context, index) {

                      return InkWell(
                        onTap: () {

                        },
                        child:
                        ProjectCards(
                            title: items[index]["title"] ?? "Proyecto",
                            author: items[index]["author"] ?? "autores"),
                      );
                    },
                  )),
            ],
          ),
        ),
      ),
    );
  }
}