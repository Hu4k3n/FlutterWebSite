import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter/cupertino.dart';
// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to My Page',
      theme: ThemeData(
        accentColor: Colors.black,
        canvasColor: Colors.red,
      ),
      home: SplashPage(),
    );
  }
}

class Designation extends StatefulWidget {
  Designation({Key? key}) : super(key: key);

  @override
  _DesignationState createState() => _DesignationState();
}

class _DesignationState extends State<Designation> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 50,
        width: 200,
        child: CarouselSlider(
          options: CarouselOptions(
              enableInfiniteScroll: true,
              reverse: false,
              autoPlay: true,
              scrollDirection: Axis.horizontal,
              autoPlayInterval: Duration(milliseconds: 2000)),
          items: [
            "Software Engineer",
            "Blender Artist",
            "PhotoShop",
            "Youtuber",
            "Designer"
          ].map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                    child: Text(
                  ' $i ',
                  style:
                      GoogleFonts.pacifico(fontSize: 15, color: Colors.white),
                ));
              },
            );
          }).toList(),
        ),
      ),
    );
  }
}

class FootNotes extends StatelessWidget {
  const FootNotes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Text(
          "\nPowered by Flutter \n Arjun 'Huraken' Syam \n August 2021",
          textAlign: TextAlign.center,
          style: GoogleFonts.lato(fontSize: 10, color: Colors.white),
        ),
      ),
    );
  }
}

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Welcome to My Humble Website",
                  style:
                      GoogleFonts.pacifico(fontSize: 25, color: Colors.white)),
              GestureDetector(
                onTap: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => MyHomePage()),
                  Navigator.of(context).push(_createRoute());
                },
                child: Hero(
                  tag: "home",
                  child: Container(
                    height: 250,
                    child: Lottie.network(
                      'https://assets9.lottiefiles.com/packages/lf20_T0oGsn.json', //click here
                      repeat: true,
                      reverse: true,
                      animate: true,
                    ),
                  ),
                ),
              ),
              Text(
                "Press to Start",
                style: GoogleFonts.pacifico(fontSize: 25, color: Colors.white),
              ),
              FootNotes()
            ],
          ),
        ),
      ),
    );
  }
}

Route _createRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => MainPage(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, 1.0);
      const end = Offset.zero;
      const curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            Column(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    width: 250,
                    child: Lottie.network(
                      'https://assets5.lottiefiles.com/packages/lf20_Aerz0y.json', //bg stars
                      repeat: true,
                      reverse: true,
                      animate: true,
                    ),
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.center,
              child: Container(
                width: 250,
                child: Lottie.network(
                  'https://assets1.lottiefiles.com/packages/lf20_HSr89w.json', //bg bubbles
                  repeat: true,
                  reverse: false,
                  animate: true,
                ),
              ),
            ),
            Column(
              children: [
                SizedBox(
                  height: 100,
                ),
                Text("Hi, I'm Arjun Syam",
                    style: GoogleFonts.pacifico(
                        fontSize: 25, color: Colors.white)),
                Designation(),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    width: 250,
                    child: Lottie.network(
                      'https://assets3.lottiefiles.com/packages/lf20_syhqmb9z.json', //floating boy
                      repeat: true,
                      reverse: true,
                      animate: true,
                    ),
                  ),
                ),
                Text(
                  "My Socials",
                  textAlign: TextAlign.center,
                  style:
                      GoogleFonts.pacifico(fontSize: 50, color: Colors.white),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.mail, color: Colors.white),
                    Text(
                      " arjun.syam23@gmail.com",
                      style: GoogleFonts.pacifico(
                          fontSize: 15, color: Colors.white),
                    ),
                  ],
                ),
                MySocials(),
                Text("See you later ig ?",
                    style: GoogleFonts.pacifico(
                        fontSize: 25, color: Colors.white)),
                Container(
                  height: 100,
                  child: Lottie.network(
                    'https://assets7.lottiefiles.com/packages/lf20_5fnww9qj.json', //anime girl
                    repeat: true,
                    reverse: false,
                    animate: true,
                  ),
                ),
                FootNotes()
              ],
            )
          ],
        ),
      ),
    );
  }
}

class MySocials extends StatefulWidget {
  MySocials({Key? key}) : super(key: key);

  @override
  _MySocialsState createState() => _MySocialsState();
}

class _MySocialsState extends State<MySocials> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: CarouselSlider(
        options: CarouselOptions(
            enableInfiniteScroll: true,
            reverse: false,
            autoPlay: true,
            scrollDirection: Axis.horizontal,
            autoPlayInterval: Duration(milliseconds: 4000)),
        items: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Youtube()),
              );
            },
            child: Hero(
              tag: "youtube",
              child: Container(
                height: 75,
                child: Lottie.network(
                  'https://assets10.lottiefiles.com/packages/lf20_3fuksula.json', //youtube icon
                  repeat: true,
                  reverse: true,
                  animate: true,
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Instagram()),
              );
            },
            child: Hero(
              tag: "instagram",
              child: Container(
                height: 100,
                child: Lottie.network(
                  'https://assets10.lottiefiles.com/packages/lf20_miwpcyh5.json', //insta icon
                  repeat: true,
                  reverse: true,
                  animate: true,
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Blog()),
              );
            },
            child: Hero(
              tag: "blog",
              child: Container(
                height: 75,
                child: Lottie.network(
                  'https://assets5.lottiefiles.com/private_files/lf30_FJSIAJ.json', //blog icon
                  repeat: true,
                  reverse: false,
                  animate: true,
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Github()),
              );
            },
            child: Hero(
              tag: "github",
              child: Container(
                height: 50,
                child: Lottie.network(
                  'https://assets5.lottiefiles.com/packages/lf20_dgBN4P.json', //github icon
                  repeat: true,
                  reverse: false,
                  animate: true,
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Linkedin()),
              );
            },
            child: Hero(
              tag: "linkedin",
              child: Container(
                height: 75,
                child: Lottie.network(
                  'https://assets6.lottiefiles.com/packages/lf20_atjsyyed.json', //linkedin icon
                  repeat: true,
                  reverse: false,
                  animate: true,
                ),
              ),
            ),
          ),
        ].map((i) {
          return Builder(
            builder: (BuildContext context) {
              return Container(child: i);
            },
          );
        }).toList(),
      ),
    );
  }
}

// class Socials extends StatefulWidget {
//   Socials({Key? key}) : super(key: key);

//   @override
//   _SocialsState createState() => _SocialsState();
// }

// class _SocialsState extends State<Socials> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         children: [
//           GestureDetector(
//             onTap: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => Youtube()),
//               );
//             },
//             child: Hero(
//               tag: "youtube",
//               child: Container(
//                 height: 75,
//                 child: Lottie.network(
//                   'https://assets10.lottiefiles.com/packages/lf20_3fuksula.json', //youtube icon
//                   repeat: true,
//                   reverse: true,
//                   animate: true,
//                 ),
//               ),
//             ),
//           ),
//           GestureDetector(
//             onTap: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => Instagram()),
//               );
//             },
//             child: Hero(
//               tag: "instagram",
//               child: Container(
//                 height: 100,
//                 child: Lottie.network(
//                   'https://assets10.lottiefiles.com/packages/lf20_miwpcyh5.json', //insta icon
//                   repeat: true,
//                   reverse: true,
//                   animate: true,
//                 ),
//               ),
//             ),
//           ),
//           GestureDetector(
//             onTap: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => Blog()),
//               );
//             },
//             child: Hero(
//               tag: "blog",
//               child: Container(
//                 height: 75,
//                 child: Lottie.network(
//                   'https://assets5.lottiefiles.com/private_files/lf30_FJSIAJ.json', //blog icon
//                   repeat: true,
//                   reverse: false,
//                   animate: true,
//                 ),
//               ),
//             ),
//           ),
//           GestureDetector(
//             onTap: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => Github()),
//               );
//             },
//             child: Hero(
//               tag: "github",
//               child: Container(
//                 height: 50,
//                 child: Lottie.network(
//                   'https://assets5.lottiefiles.com/packages/lf20_dgBN4P.json', //github icon
//                   repeat: true,
//                   reverse: false,
//                   animate: true,
//                 ),
//               ),
//             ),
//           ),
//           GestureDetector(
//             onTap: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => Linkedin()),
//               );
//             },
//             child: Hero(
//               tag: "linkedin",
//               child: Container(
//                 height: 75,
//                 child: Lottie.network(
//                   'https://assets6.lottiefiles.com/packages/lf20_atjsyyed.json', //linkedin icon
//                   repeat: true,
//                   reverse: false,
//                   animate: true,
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

class GoBack extends StatelessWidget {
  const GoBack({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SizedBox(
        height: 100,
      ),
      GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Container(
          height: 75,
          child: Text("Vamanos",
              style: GoogleFonts.pacifico(fontSize: 15, color: Colors.white)),
        ),
      ),
    ]);
  }
}
// class MyHomePage extends StatefulWidget {
//   MyHomePage({
//     Key? key,
//   }) : super(key: key);

//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: Center(
//       child: Stack(children: <Widget>[
//         Align(
//           alignment: Alignment.center,
//           child: Container(
//             child: Lottie.network(
//               'https://assets1.lottiefiles.com/packages/lf20_HSr89w.json', //bg bubbles
//               repeat: true,
//               reverse: false,
//               animate: true,
//             ),
//           ),
//         ),
//         Align(
//           alignment: Alignment.center,
//           child: Container(
//             child: Lottie.network(
//               'https://assets5.lottiefiles.com/packages/lf20_Aerz0y.json', //bg stars
//               repeat: true,
//               reverse: true,
//               animate: true,
//             ),
//           ),
//         ),
//         Align(
//           alignment: Alignment.center,
//           child: Container(
//             child: Lottie.network(
//               'https://assets3.lottiefiles.com/packages/lf20_syhqmb9z.json', //floating boy
//               repeat: true,
//               reverse: true,
//               animate: true,
//             ),
//           ),
//         ),
//         Align(
//           alignment: Alignment(0.25, 0),
//           child: GestureDetector(
//             onTap: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => Youtube()),
//               );
//             },
//             child: Hero(
//               tag: "youtube",
//               child: Container(
//                 height: 75,
//                 child: Lottie.network(
//                   'https://assets10.lottiefiles.com/packages/lf20_3fuksula.json', //youtube icon
//                   repeat: true,
//                   reverse: true,
//                   animate: true,
//                 ),
//               ),
//             ),
//           ),
//         ),
//         Align(
//           alignment: Alignment(-0.20, 0.25),
//           child: GestureDetector(
//             onTap: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => Instagram()),
//               );
//             },
//             child: Hero(
//               tag: "instagram",
//               child: Container(
//                 height: 100,
//                 child: Lottie.network(
//                   'https://assets10.lottiefiles.com/packages/lf20_miwpcyh5.json', //insta icon
//                   repeat: true,
//                   reverse: true,
//                   animate: true,
//                 ),
//               ),
//             ),
//           ),
//         ),
//         Align(
//           alignment: Alignment(0.25, -0.60),
//           child: GestureDetector(
//             onTap: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => Github()),
//               );
//             },
//             child: Hero(
//               tag: "github",
//               child: Container(
//                 height: 75,
//                 child: Lottie.network(
//                   'https://assets5.lottiefiles.com/packages/lf20_dgBN4P.json', //github icon
//                   repeat: true,
//                   reverse: false,
//                   animate: true,
//                 ),
//               ),
//             ),
//           ),
//         ),
//         Align(
//           alignment: Alignment(-0.1, 0.6),
//           child: GestureDetector(
//             onTap: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => Linkedin()),
//               );
//             },
//             child: Hero(
//               tag: "linkedin",
//               child: Container(
//                 height: 75,
//                 child: Lottie.network(
//                   'https://assets6.lottiefiles.com/packages/lf20_atjsyyed.json', //linkedin icon
//                   repeat: true,
//                   reverse: false,
//                   animate: true,
//                 ),
//               ),
//             ),
//           ),
//         ),
//         Align(
//           alignment: Alignment(-0.20, -0.60),
//           child: GestureDetector(
//             onTap: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => Blog()),
//               );
//             },
//             child: Hero(
//               tag: "blog",
//               child: Container(
//                 height: 75,
//                 child: Lottie.network(
//                   'https://assets5.lottiefiles.com/private_files/lf30_FJSIAJ.json', //blog icon
//                   repeat: true,
//                   reverse: false,
//                   animate: true,
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ]),
//     ));
//   }
// }

class Youtube extends StatelessWidget {
  const Youtube({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Hero(
                  tag: "youtube",
                  child: GestureDetector(
                    onTap: () {
                      html.window
                          .open('https://www.youtube.com/c/Huraken', 'new tab');
                    },
                    child: Container(
                      child: Lottie.network(
                        'https://assets10.lottiefiles.com/packages/lf20_3fuksula.json', //youtube icon
                        repeat: true,
                        reverse: true,
                        animate: true,
                      ),
                    ),
                  ),
                ),
                Text(
                  "Visit my Youtube channel to see my latest uploads",
                  style:
                      GoogleFonts.pacifico(fontSize: 15, color: Colors.white),
                ),
                GoBack()
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Instagram extends StatelessWidget {
  const Instagram({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Hero(
                  tag: "instagram",
                  child: GestureDetector(
                    onTap: () {
                      html.window.open(
                          'https://www.instagram.com/huraken._.x_x/',
                          'new tab');
                    },
                    child: Container(
                      height: 500,
                      child: Lottie.network(
                        'https://assets10.lottiefiles.com/packages/lf20_miwpcyh5.json', //instagram icon
                        repeat: true,
                        reverse: true,
                        animate: true,
                      ),
                    ),
                  ),
                ),
              ),
              Text(
                "Visit my Instagram to see my latest artwork or updates",
                style: GoogleFonts.pacifico(fontSize: 15, color: Colors.white),
              ),
              GoBack()
            ],
          ),
        ),
      ),
    );
  }
}

class Github extends StatelessWidget {
  const Github({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Hero(
                  tag: "github",
                  child: GestureDetector(
                    onTap: () {
                      html.window.open('https://github.com/Hu4k3n', 'new tab');
                    },
                    child: Container(
                      height: 500,
                      child: Lottie.network(
                        'https://assets5.lottiefiles.com/packages/lf20_dgBN4P.json', //github icon
                        repeat: true,
                        reverse: false,
                        animate: true,
                      ),
                    ),
                  ),
                ),
              ),
              Text(
                "Visit my Github to see updates regarding my Projects",
                style: GoogleFonts.pacifico(fontSize: 15, color: Colors.white),
              ),
              GoBack()
            ],
          ),
        ),
      ),
    );
  }
}

class Linkedin extends StatelessWidget {
  const Linkedin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Hero(
                  tag: "linkedin",
                  child: GestureDetector(
                    onTap: () {
                      html.window.open(
                          'https://www.linkedin.com/in/arjun-syam-9b1b961a0/',
                          'new tab');
                    },
                    child: Container(
                      height: 500,
                      child: Lottie.network(
                        'https://assets6.lottiefiles.com/packages/lf20_atjsyyed.json', //linkedin icon
                        repeat: true,
                        reverse: true,
                        animate: true,
                      ),
                    ),
                  ),
                ),
              ),
              Text(
                "Visit my LinkedIn Profile for my Professional endeavours",
                style: GoogleFonts.pacifico(fontSize: 15, color: Colors.white),
              ),
              GoBack()
            ],
          ),
        ),
      ),
    );
  }
}

class Blog extends StatelessWidget {
  const Blog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Hero(
                  tag: "blog",
                  child: GestureDetector(
                    onTap: () {
                      html.window
                          .open('https://kinghuraken.blogspot.com/', 'new tab');
                    },
                    child: Container(
                      child: Lottie.network(
                        'https://assets5.lottiefiles.com/private_files/lf30_FJSIAJ.json', //blog icon
                        repeat: true,
                        reverse: false,
                        animate: true,
                      ),
                    ),
                  ),
                ),
                Text(
                  "Visit my Blogs to read my weird stories",
                  style:
                      GoogleFonts.pacifico(fontSize: 15, color: Colors.white),
                ),
                GoBack()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
