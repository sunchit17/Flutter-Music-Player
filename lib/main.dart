import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.blue,
          canvasColor: Colors.white,
          backgroundColor: Colors.white),
      home: Playlist(),
    );
  }
}

class Playlist extends StatelessWidget {
  final songNames = [
    'Someone Like You',
    'Solo Dance',
    '24K Magic',
    'Sunflower',
    'Better Now'
  ];
  final artistNames = [
    'Adele',
    'Martin Jensen',
    'Bruno Mars',
    'Post Malone',
    'Post Malone'
  ];
  final runTime = ['3:45', '2:59', '3:56', '2:23', '3:18'];
  final playRuns = [
    '1,234,233,000',
    '1,544,345,864',
    '3,232,345,742',
    '3,454,234,444',
    '3,444,231,456',
  ];
  final artistPicture = [
    'assets/some_one.jpg',
    'assets/solo_dance.jpg',
    'assets/24K_carat.jpg',
    'assets/sunflower.jpg',
    'assets/better_now.jpg'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        shrinkWrap: true,
        slivers: <Widget>[
          SliverAppBar(
            //title: Text('Fluttery Player'),
            expandedHeight: 350,
            flexibleSpace: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/sound_wave.jpg'),
                      fit: BoxFit.cover)),
            ),
          ),
          SliverList(
              delegate: SliverChildListDelegate(<Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 32, left: 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Popular Songs',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 32,
                        color: Colors.deepPurple),
                  ),
                ],
              ),
            ),
          ])),
          SliverList(
              delegate: SliverChildBuilderDelegate(
            (context, i) {
              return Padding(
                padding: const EdgeInsets.only(top: 32, left: 32),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MyHomePage(
                                artistNam: artistNames[i],
                                songNam: songNames[i],
                                artistPicture: artistPicture[i])));
                  },
                  child: Row(
                    children: <Widget>[
                      Expanded(
                          child: Text(
                        songNames[i],
                        style: TextStyle(color: Colors.black87, fontSize: 16),
                      )),
                      Padding(
                        padding: const EdgeInsets.only(left: 48),
                        child: Text(
                          runTime[i],
                          style: TextStyle(color: Colors.deepPurple),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 16),
                        child: Text(
                          playRuns[i],
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 16, right: 16),
                        child: Icon(
                          Icons.add,
                          color: Colors.grey,
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
            childCount: songNames.length,
          ))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.indigo,
        onPressed: () {},
        child: Icon(
          Icons.play_arrow,
          color: Colors.white,
        ),

        //shape: BeveledRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(32))),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage(
      {Key key, this.title, this.songNam, this.artistNam, this.artistPicture})
      : super(key: key);
  final String title;
  final String songNam;
  final String artistNam;
  final String artistPicture;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black87),
      ),
      body: Container(
        child: Center(
          child: ListView(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Card(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  margin: EdgeInsets.only(top: 50),
                  child: Container(
                    height: 300,
                    width: 300,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(artistPicture),
                            fit: BoxFit.scaleDown)),
                  ),
                  elevation: 32,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 32),
                  child: Text(
                    songNam,
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Center(
                child: Text(
                  artistNam,
                  style: TextStyle(color: Colors.indigo),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 44),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                        child: Icon(
                      Icons.shuffle,
                      color: Colors.grey,
                    )),
                    Expanded(child: Icon(Icons.skip_previous)),
                    Expanded(
                      child: Center(
                        child: Icon(
                          Icons.play_circle_outline,
                          color: Colors.black,
                          size: 54,
                        ),
                      ),
                    ),
                    Expanded(child: Icon(Icons.skip_next)),
                    Expanded(
                        child: Icon(
                      Icons.repeat,
                      color: Colors.grey,
                    )),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
