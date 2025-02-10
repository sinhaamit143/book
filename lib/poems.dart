import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'menu.dart';

class Poems extends StatefulWidget {
  const Poems({super.key});

  @override
  LoadingScreenState createState() => LoadingScreenState();
}

class LoadingScreenState extends State<Poems> {
  final List<Map<String, String>> poems = [
    {
      "title": "The Rainbow Balloon",
      "videoUrl": "https://youtu.be/khsXGETCqVw"
    },
    {
      "title": "The Giggle Bug",
      "videoUrl": "https://youtu.be/_o674p5NZPQ"
    },
    {
      "title": "Aha Tamatar Bade Mazedar",
      "videoUrl": "https://youtu.be/6rRRAVSilss"
    },
    {
      "title": "5 Little Ducks",
      "videoUrl": "https://youtu.be/N5YSbaUl9Y4"
    }
  ];

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        width: screenSize.width,
        height: screenSize.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/Loading Screen.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Column(
                    children: [
                      SizedBox(height: screenSize.height * 0.1),
                      Center(
                        child: Image.asset(
                          'assets/images/BooK.png',
                          width: screenSize.width * 0.6,
                        ),
                      ),
                      SizedBox(height: screenSize.height * 0.02),
                    ],
                  ),
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                        (context, index) => _buildPoemCard(poems[index]),
                    childCount: poems.length,
                  ),
                ),
              ],
            ),
            Positioned(
              top: screenSize.height * 0.05,
              left: screenSize.width * 0.07,
              child: _buildGradientCircle(
                child: IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.arrow_back, color: Colors.white, size: 22),
                ),
              ),
            ),
            Positioned(
              top: screenSize.height * 0.05,
              right: screenSize.width * 0.07,
              child: _buildGradientSquare(
                child: IconButton(
                  icon: const Icon(Icons.menu, color: Colors.white, size: 22),
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const MenuScreen()),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPoemCard(Map<String, String> poem) {
    String videoId = YoutubePlayer.convertUrlToId(poem["videoUrl"]!) ?? "";
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              child: YoutubePlayerBuilder(
                player: YoutubePlayer(
                  controller: YoutubePlayerController(
                    initialVideoId: videoId,
                    flags: const YoutubePlayerFlags(
                      autoPlay: false,
                      enableCaption: false,
                    ),
                  ),
                  showVideoProgressIndicator: true,
                ),
                builder: (context, player) => Column(
                  children: [
                    player,
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        poem["title"]!,
                        style: TextStyle(
                          fontFamily: 'CherryBombOne-Regular',
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGradientCircle({required Widget child}) {
    return Container(
      width: 40.0, // Adjust button width
      height: 40.0, // Adjust button height
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: const LinearGradient(
          colors: [Color(0xFFFF4DC3), Color(0xFF0066FF)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        border: Border.all(color: Colors.white, width: 1.5),
        boxShadow: const [
          BoxShadow(
            color: Color(0xFF4169E1),
            blurRadius: 10.0,
            spreadRadius: 1.0,
          ),
        ],
      ),
      child: child,
    );
  }

  Widget _buildGradientSquare({required Widget child}) {
    return Container(
      width: 40.0, // Adjust button width
      height: 40.0, // Adjust button height
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        gradient: const LinearGradient(
          colors: [Color(0xFFFF4DC3), Color(0xFF0066FF)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        border: Border.all(color: Colors.white, width: 1.5),
        boxShadow: const [
          BoxShadow(
            color: Color(0xFF4169E1),
            blurRadius: 10.0,
            spreadRadius: 1.0,
          ),
        ],
      ),
      child: child,
    );
  }
}
