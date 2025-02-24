import 'package:flutter/material.dart';
import 'widgets/video_player_screen.dart';

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
            /*Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: TitleSection(
                    title: titlePrj,
                    subtitle: "Autores",
                    onTitleTap: () => _tabController.animateTo(0),
                    onSubtitleTap: () => _tabController.animateTo(1),
                  ),
                ),
              ],
            ),*/
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
                  _buildDetailsSection(),
                  _buildAuthorsSection(),
                  _buildResourcesSection(),
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

  Widget _buildAuthorsSection() {
    return Center(
      child: Column(
        children: [
          Row(children: [
            SizedBox(
              width: 100,
              height: 100,
              child: Expanded(child: Image.network("")),
            ),
            SizedBox(
              width: 100,
              height: 100,
              child: Expanded(child: Image.network("")),
            )
          ],),
          Row(children: [
            SizedBox(
              width: 100,
              height: 100,
              child: Expanded(child: Image.network("")),
            ),
            SizedBox(
              width: 100,
              height: 100,
              child: Expanded(child: Image.network("")),
            )
          ],)
        ],
      ),

    );
  }

  Widget _buildResourcesSection() {
    return Center(child: Text("Recursos y enlaces útiles"));
  }
}
