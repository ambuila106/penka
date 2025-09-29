import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:penka/widgets/score_card.dart';
import 'package:penka/models/match.dart';
import 'package:share_plus/share_plus.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Penka',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        scaffoldBackgroundColor: Colors.grey[900], // 👈 Fondo global
      ),
      home: const MyHomePage(title: 'Penka'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  List<Match> matches = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _loadMatches();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Future<void> _loadMatches() async {
    try {
      final String response = await rootBundle.loadString('assets/matches.json');
      final Map<String, dynamic> data = json.decode(response);
      final List<dynamic> matchesJson = data['matches'];
      
      setState(() {
        matches = matchesJson.map((json) => Match.fromJson(json)).toList();
        isLoading = false;
      });
    } catch (e) {
      print('Error loading matches: $e');
      setState(() {
        isLoading = false;
      });
    }
  }

  void _shareApp() {
    Share.share(
      'https://www.penka.io/',
      subject: 'Check out Penka - Live Sports Scores!',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        backgroundColor: Colors.black,
        title: Image.asset(
          'assets/logo-penka.png',
          height: 40,
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 16.0),
            decoration: BoxDecoration(
              color: Colors.grey[900],
              shape: BoxShape.circle,
            ),
            child: IconButton(
              icon: const Icon(
                Icons.share,
                color: Colors.white,
                size: 20,
              ),
              onPressed: _shareApp,
              tooltip: 'Share Penka',
            ),
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.yellow[800],
          labelColor: Colors.yellow[800],
          labelStyle: const TextStyle( // active tab text style
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
          unselectedLabelColor: Colors.grey,
          tabs: const [
            Tab(
              text: 'To play',
            ),
            Tab(text: 'Result'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          // To play tab content
          isLoading
              ? const Center(
                  child: CircularProgressIndicator(
                    color: Colors.deepPurple,
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ListView.separated(
                    itemCount: matches.length,
                    separatorBuilder: (context, index) => Divider(
                      height: 10,
                      color: Colors.grey[600],
                    ),
                    itemBuilder: (context, index) {
                      final match = matches[index];
                      return ScoreCard(
                        leftTeamSrc: match.leftTeam.flag,
                        rightTeamSrc: match.rightTeam.flag,
                        leftScore: match.leftTeam.score,
                        rightScore: match.rightTeam.score,
                      );
                    },
                  ),
                ),
          // Result tab content
          const Center(
            child: ResultView(),
          ),
        ],
      ),
    );
  }
}

class ResultView extends StatelessWidget {
  const ResultView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.emoji_events,
          size: 80,
          color: Colors.amber,
        ),
        SizedBox(height: 20),
        Text(
          'Results',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        SizedBox(height: 10),
        Text(
          'Game results will appear here',
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}
