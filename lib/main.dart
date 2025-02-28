import 'package:flutter/material.dart';
import 'widgets/line_painter.dart';
import 'widgets/title_section.dart';
import 'widgets/video_player_screen.dart';
import 'widgets/carrousel_prj.dart';
import 'widgets/custom_card.dart';
import 'projects_layout.dart';
import 'map_layout.dart';
import 'speakers_layout.dart';
import 'exhibitors_layout.dart';
import 'widgets/pop_up_speaker_card.dart';
import 'project_individual_layout.dart';

void main() {
  runApp(const MyApp());
}

final List<Map<String, String>> prjTexts = [
  {"name": "proyecto1", "author": "unknow"},
  {"name": "proyecto2", "author": "unknow"},
  {"name": "proyecto3", "author": "unknow"},
];

final List<Map<String, String>> items = [
  {
    "title": "Ponencia 1",
    "time": "10:00",
    "imageUrl": "https://via.placeholder.com/300",
    "description": "Descripción breve del Proyecto 1.",
  },
  {
    "title": "Ponencia 2",
    "time": "10:00",
    "imageUrl": "https://via.placeholder.com/300",
    "description": "Descripción breve del Proyecto 2.",
  },
  {
    "title": "Ponencia 3",
    "time": "10:00",
    "imageUrl": "https://via.placeholder.com/300",
    "description": "Descripción breve del Proyecto 3.",
  },
];

// Nota mental si pones stls se te genera una clase para widget...

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Monlau MotorSport',
      theme: ThemeData(
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Colors.black,
          selectedItemColor: Colors.blueAccent,
          unselectedItemColor: Colors.white,
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  final PageController _pageController = PageController();

  int _currentIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      _pageController.animateToPage(index,
          duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
    });
  }

  void _handleTapCarroussel() {
    print("Se hizo clic en la imagen $_currentIndex");

    if (_currentIndex == 0) {
      print("Abrir detalle del Proyecto 1");
    } else if (_currentIndex == 1) {
      print("Abrir detalle del Proyecto 2");
    } else {
      print("Otra acción para el índice $_currentIndex");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          _homeScreen(),
          const ProjectsLayout(),
          const MapLayout(),
          const SpeakersLayout(),
          const ExhibitorsLayout(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.home, color: Colors.white),
              label: 'Inicio',
              backgroundColor: Colors.black),
          BottomNavigationBarItem(
              icon: Icon(Icons.car_crash, color: Colors.white),
              label: 'Proyectos',
              backgroundColor: Colors.black),
          BottomNavigationBarItem(
              icon: Icon(Icons.map, color: Colors.white),
              label: 'Mapa',
              backgroundColor: Colors.black),
          BottomNavigationBarItem(
              icon: Icon(Icons.flag, color: Colors.white),
              label: 'Ponentes',
              backgroundColor: Colors.black),
          BottomNavigationBarItem(
              icon: Icon(Icons.add_home_work_sharp, color: Colors.white),
              label: 'Expositores',
              backgroundColor: Colors.black),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: Colors.black,
      ),
    );
  }

  Widget _homeScreen() {
    return SafeArea(
      child: Center(
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                    child: VideoPlayerScreen(
                  videoPath:
                      'assets/videos/e3d282eafaa9801e6243a4e0b5f4602c6826e7d0.mp4',
                ))
              ],
            ),
            Row(children: [
              Expanded(
                  child: TitleSection(
                title: 'DESCUBRE TODOS LOS PROYECTOS',
                subtitle: 'PROYECTOS',
                onTitleTap: () {},
                onSubtitleTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ProjectsLayout()));
                },
              ))
            ]),
            Row(children: [
              CustomPaint(size: const Size(100, 10), painter: LinePainter())
            ]),
            Row(children: [
              Expanded(
                  child: InkWell(
                onTap: _handleTapCarroussel,
                child: CarrouselPrj(projects: prjTexts),
              ))
            ]),
            Row(children: [
              CustomPaint(size: const Size(100, 10), painter: LinePainter())
            ]),
            Row(children: [
              Expanded(
                  child: TitleSection(
                title: 'DESCUBRE LOS PONENTES',
                subtitle: 'PONENTES',
                onTitleTap: () {},
                onSubtitleTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SpeakersLayout()));
                },
              ))
            ]),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      print(index);
                      SpeakersPopUpCArd(speakerName: 'Elon Musk', imageUrl: 'https://m.media-amazon.com/images/I/81fYiMk1D0L.jpg', hour: 15,);
                    },
                    child: CustomCard(
                        title: items[index]["title"] ?? "Título por defecto",
                        time: items[index]["time"] ?? "00:00",
                        imageUrl: items[index]["imageUrl"] ??
                            "https://via.placeholder.com/150",
                        description:
                            items[index]["description"] ?? "Sin descripción"),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
