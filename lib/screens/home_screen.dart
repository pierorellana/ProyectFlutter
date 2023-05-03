// import 'package:flutter/material.dart';

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({Key? key}) : super(key: key);

//   @override
//   _HomeScreenState createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _controller;
//   late Animation<Offset> _animation;
//   bool _showText = false;

//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(
//       duration: const Duration(seconds: 1),
//       vsync: this,
//     )..forward();
//     _animation = Tween<Offset>(
//       begin: const Offset(0.0, 0.5),
//       end: const Offset(0.0, -1.3),
//     ).animate(
//       CurvedAnimation(
//         parent: _controller,
//         curve: Curves.easeOut,
//       ),
//     )..addStatusListener((status) {
//       if (status == AnimationStatus.completed) {
//         setState(() {
//           _showText = true;
//         });
//       }
//     });
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: SafeArea(
//         child: Scaffold(
//           backgroundColor: const Color(0xFF1B4568), // Fondo azul
//           body: Stack(
//             alignment: Alignment.center,
//             children: [
//               SlideTransition(
//                 position: _animation,
//                 child: Image.asset(
//                   'assets/logo2.png',
//                   width: 200,
//                   height: 200,
//                 ),
//               ),
//               AnimatedOpacity(
//                 opacity: _showText ? 1.0 : 0.0,
//                 duration: const Duration(milliseconds: 500),
//                 child: const Padding(
//                   padding: EdgeInsets.only(top: 220),
//                   child: Center(
//                     child: Text(
//                       'Descubre todo lo que puedes hacer con ARCSA Móvil, tú puedes',
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontWeight: FontWeight.bold,
//                         fontSize: 22,
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }



import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animation;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    )..forward();
    _animation = Tween<Offset>(
      begin: const Offset(0.0, 1.2),
      end: const Offset(0.0, -1.3),
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeOut,
      ),
    );
    _opacityAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.6, 1, curve: Curves.easeOut),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          backgroundColor: const Color(0xFF1B4568),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SlideTransition(
                position: _animation,
                child: Image.asset(
                  'assets/logo2.png',
                  width: 200,
                  height: 200,
                ),
              ),
              SizedBox(height: 16),
              FadeTransition(
                opacity: _opacityAnimation,
                child: const Text(
                  'Descubre todo lo que puedes hacer con ARCSA Móvil, tú puedes',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
