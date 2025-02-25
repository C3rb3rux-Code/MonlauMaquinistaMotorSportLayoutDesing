import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
import 'widgets/video_player_screen.dart';
import 'widgets/cv_card.dart';

class ProjectIndividualLayout extends StatefulWidget {
  final int index;

  const ProjectIndividualLayout({super.key, required this.index});

  @override
  _ProjectIndividualLayoutState createState() =>
      _ProjectIndividualLayoutState();
}

class _ProjectIndividualLayoutState extends State<ProjectIndividualLayout>
    with SingleTickerProviderStateMixin {
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
                Tab(text: "Memoria"),
                Tab(text: "Autores"),
              ],
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  _buildDetailsSection(),
                  _buildMemorySection(),
                  _buildAuthorsSection()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailsSection() {
    return Center(child: Text("Información detallada del proyecto"));
  }

  Widget _buildMemorySection() {
    return Scaffold(
      body: PDF().fromPath('file:///C:/Users/polcr/Downloads/DAM-M6-UF3-PAC1-CreusPol.pdf')
    );
  }

  Widget _buildAuthorsSection() {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 5.0, top: 10.0),
                child: CVCard(imagePath: '', name: "hola"),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 5.0, top: 10.0),
                child: CVCard(imagePath: '', name: "hola"),
              )
            ],
          )
        ],
      ),
    );
  }
}
