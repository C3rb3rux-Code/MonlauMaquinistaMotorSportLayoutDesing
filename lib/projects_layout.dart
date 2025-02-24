import 'package:flutter/material.dart';
import 'package:layoutsdesing/widgets/project_cards.dart';
import 'widgets/line_painter.dart';
import 'project_individual_layout.dart';

class ProjectsLayout extends StatefulWidget {
  const ProjectsLayout({super.key});

  @override
  _ProjectsLayout createState() => _ProjectsLayout();
}

class _ProjectsLayout extends State<ProjectsLayout> {
  String _filterSelectOption = "Todos";

  final List<String> _filter = [
    "Todos",
    "CFGS Automación",
    "CFGM Electromecánica",
    "CFGM Carrocería",
    "CFGM Motocicletas"
  ];
  final List<Map<String, String>> items = [
    {
      "title": "Proyecto 1",
      "author": "Autores.",
    },
    {
      "title": "Proyecto 2",
      "author": "Autores.",
    },
    {
      "title": "Proyecto 3",
      "author": "Autores.",
    },
    {
      "title": "Proyecto 1",
      "author": "Autores.",
    },
    {
      "title": "Proyecto 2",
      "author": "Autores.",
    },
    {
      "title": "Proyecto 3",
      "author": "Autores.",
    },
    {
      "title": "Proyecto 1",
      "author": "Autores.",
    },
    {
      "title": "Proyecto 2",
      "author": "Autores.",
    },
    {
      "title": "Proyecto 3",
      "author": "Autores.",
    },
  ];

  @override
  Widget build(BuildContext context) {

    int _selectedIndex = 0;

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
                              "Proyectos",
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
                    DropdownButton<String>(
                      value: _filter.contains(_filterSelectOption)
                          ? _filterSelectOption
                          : null,
                      hint: Text("Selecciona una opción"),
                      icon: const Icon(Icons.arrow_drop_down,
                          color: Colors.black),
                      dropdownColor: Colors.white,
                      style: const TextStyle(color: Colors.white),
                      underline: Container(),
                      onChanged: (String? newValue) {
                        setState(() {
                          _filterSelectOption = newValue!;
                        });
                      },
                      items:
                          _filter.map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value,
                              style: const TextStyle(color: Colors.black)),
                        );
                      }).toList(),
                    )
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
                      print(index);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              ProjectIndividualLayout(index: _selectedIndex),
                        ),
                      );
                    },
                    child: ProjectCards(
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
