import 'package:checkgames/src/cardGame.dart';
import 'package:checkgames/src/cardGameView.dart';
import 'package:checkgames/views/cardView.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class HomeView extends StatefulWidget{

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with SingleTickerProviderStateMixin{
  bool _isBottomSheetOpen = false;
  AnimationController _controller;

  Animation<Offset> _offsetAnimation;



  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 5),
      vsync: this,
    )..repeat(reverse: true);

    _offsetAnimation = Tween<Offset>(
      begin: Offset.zero,
      end: const Offset(1.5, 0.0),
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInCirc,
    ));
  }


  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  Widget build(BuildContext context) {
    return MaterialApp(

      home: Scaffold(
        appBar: AppBar(
          title: Text("Check Games"),
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.more_vert, color: Colors.white),
                splashColor: Colors.cyan,
                onPressed: (){

                }
            )

          ],
        ),
        body: Builder(
          builder: (BuildContext context){
            double maxHeight = MediaQuery.of(context).size.height;
            double maxWidth = MediaQuery.of(context).size.width;
            return SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Container(
                  color: Colors.green[900],
                  height: MediaQuery.of(context).size.height,
                  padding: EdgeInsets.fromLTRB(10, 20, 10, 5),
                  child: Column(
                    children: [
                      Card(
                          elevation: 20,
                          child: Stack(
                            alignment: Alignment.centerLeft,
                            children: [
                              Container(color: Colors.white, height: maxHeight / 5, width: maxWidth / 2,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Card(
                                    color: Colors.white,
                                    elevation:0,
                                    child: Stack(
                                      children: [
                                        Image.asset("assets/images/spade.png", width: maxWidth / 5)
                                      ],
                                    ),
                                  ),
                                  TextButton(
                                    child: Text("Beginner", style: TextStyle(color: Colors.green[900], fontSize: 19),),
                                    onPressed: (){
                                      Navigator.push(context, new MaterialPageRoute(builder: (context){ return new CardView();}));
                                    },
                                  )
                                ],
                              )
                            ],
                          )
                      ),
                      Card(
                          elevation: 20,
                          child: Stack(
                            alignment: Alignment.centerLeft,
                            children: [
                              Container(color: Colors.white, height: maxHeight / 5, width: maxWidth / 2,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Card(
                                    color: Colors.white,
                                    elevation:0,
                                    child: Stack(
                                      children: [
                                        Image.asset("assets/images/heart.png", width: maxWidth / 5),
                                        Image.asset("assets/images/spade.png", width: maxWidth / 5)
                                      ],
                                    )
                                  ),
                                  TextButton(
                                    child: Text("Normal", style: TextStyle(color: Colors.green[900], fontSize: 19),),
                                  )
                                ],
                              )
                            ],
                          )
                      ),
                    ],
                  ),
                )
            );
          }
        ),
        floatingActionButton: Builder(
          builder: (BuildContext ctxt){
            return FloatingActionButton(
                tooltip: 'View a Card',
                child: Icon(Icons.games),
                onPressed: (){
                  if(!_isBottomSheetOpen){
                    _isBottomSheetOpen = true;
                    Scaffold.of(ctxt).showBottomSheet((ctxt) {
                      // create a new card randomly
                      var card = new CardGame(CardType.Heart, CardRank.Joker);
                      card.random();
                      var sheetHeight = (MediaQuery.of(ctxt).size.height / 3) * 2;
                      return Container(
                          color: Colors.teal,
                          height: sheetHeight,
                      );
                    });
                  }
                  else{
                    _isBottomSheetOpen = false;
                    Navigator.pop(ctxt);
                  }

                }
            );
          },
        ),
        drawer: Builder(
          builder: (BuildContext ctxt){
            return Container(
              color: Colors.teal,
              height: MediaQuery.of(ctxt).size.height,
              width: (MediaQuery.of(ctxt).size.width / 5) * 4,
              child: ListView(
                  padding: EdgeInsets.zero,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                    ),
                    Stack(
                      children: [
                        ClipPath(
                          clipper: BezierClipper(),
                          child: Container(
                              color: Colors.white,
                              height: MediaQuery.of(ctxt).size.height / 3,
                              padding: EdgeInsets.all(13),
                              child: Image.asset("assets/images/logo.png", fit: BoxFit.contain,)
                          ),
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              IconButton(
                                icon: Icon(Icons.arrow_back,color: Colors.teal),
                                iconSize: 32,
                                visualDensity: VisualDensity.comfortable,
                                onPressed: () {
                                  Navigator.pop(ctxt);
                                },
                              ),
                            ]
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ListTile(
                      leading: Icon(Icons.score_rounded,color: Colors.white),
                      title: Text('Score',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      onTap: (){

                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.dashboard_customize,color: Colors.white),
                      title: Text('Card Theme',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    ListTile(
                      leading: Icon(Icons.online_prediction,color: Colors.white),
                      title: Text('Play Online',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    ListTile(
                      leading: Icon(Icons.share,color: Colors.white),
                      title: Text('Share',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SlideTransition(
                      position: _offsetAnimation,
                      child: Image.asset("assets/images/cards.png"),
                    ),
                  ]),
            );
          },
        )
      ),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
    );
  }
}

class BezierClipper extends CustomClipper<Path>{
  @override
  Path getClip(Size size){
  Path path = new Path();
  path.lineTo(0, size.height*0.85); //vertical line
  path.cubicTo(size.width/3, size.height, 2*size.width/3, size.height*0.7, size.width, size.height*0.85);
  path.lineTo(size.width, 0); //vertical line
  return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}