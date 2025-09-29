import 'package:flutter/material.dart';
import 'package:penka/widgets/score_card.dart';

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

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
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
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.yellow[800],
          labelColor: Colors.yellow[800],
          labelStyle: TextStyle( // active tab text style
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
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  ScoreCard(
                    leftTeamSrc: 'assets/arg.png',
                    rightTeamSrc: 'assets/bra.png',
                    leftScore: 2,
                    rightScore: 1,
                  ),
                  Divider(
                    height: 10,
                    color: Colors.grey[600],
                  ),
                  ScoreCard(
                    leftTeamSrc: 'assets/col.png',
                    rightTeamSrc: 'assets/chi.png',
                    leftScore: 3,
                    rightScore: 1,
                  ),
                  Divider(
                    height: 10,
                    color: Colors.grey[600],
                  ),
                  ScoreCard(
                    leftTeamSrc: 'assets/col.png',
                    rightTeamSrc: 'assets/chi.png',
                    leftScore: 3,
                    rightScore: 1,
                  ),
                  Divider(
                    height: 10,
                    color: Colors.grey[600],
                  ),
                  ScoreCard(
                    leftTeamSrc: 'assets/col.png',
                    rightTeamSrc: 'assets/chi.png',
                    leftScore: 3,
                    rightScore: 1,
                  ),
                  Divider(
                    height: 10,
                    color: Colors.grey[600],
                  ),
                  ScoreCard(
                    leftTeamSrc: 'assets/col.png',
                    rightTeamSrc: 'assets/chi.png',
                    leftScore: 3,
                    rightScore: 1,
                  ),
                  Divider(
                    height: 10,
                    color: Colors.grey[600],
                  ),
                  ScoreCard(
                    leftTeamSrc: 'assets/col.png',
                    rightTeamSrc: 'assets/chi.png',
                    leftScore: 3,
                    rightScore: 1,
                  ),
                  Divider(
                    height: 10,
                    color: Colors.grey[600],
                  ),
                  ScoreCard(
                    leftTeamSrc: 'assets/col.png',
                    rightTeamSrc: 'assets/chi.png',
                    leftScore: 3,
                    rightScore: 1,
                  ),
                ],
              ),
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
