import 'package:flutter/material.dart';
import 'widgets/video_player_screen.dart';

class ProjectIndividualLayout extends StatefulWidget {
  final int index;

  const ProjectIndividualLayout({super.key, required this.index});

  @override
  _ProjectIndividualLayoutState createState() => _ProjectIndividualLayoutState();
}

class _ProjectIndividualLayoutState extends State<ProjectIndividualLayout> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final String titlePrj = "Title Project";

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 300,
              child: VideoPlayerScreen(videoPath: ''),
            ),
            TabBar(
              controller: _tabController,
              indicatorColor: Colors.blue,
              labelColor: Colors.blue,
              unselectedLabelColor: Colors.grey,
              tabs: [
                Tab(text: titlePrj),
                Tab(text: "Autores"),
                Tab(text: "CVs"),
              ],
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  _buildMemorySection(),
                  _buildAuthorsSection(),
                  _buildCVSection(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMemorySection() { // Memoria del proyecto
    return Center(child: Text("Información detallada del proyecto"));
  }

  Widget _buildAuthorsSection() { // Autores del proyecto
    return Center(child: Text("Autores del proyecto"));
  }

  Widget _buildCVSection() { // CVs de los autores
    return Center(child: Text("Recursos y enlaces útiles"));
  }
}
