import 'dart:async';
import 'dart:math' as math show pi;

import 'package:covid_tracker/views/world_states_view.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late final AnimationController _c = AnimationController(
    duration: const Duration(seconds: 3),
    vsync: this,
  )..repeat();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _c.dispose();
  }

  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 5),
      () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => WorldStatesView(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AnimatedBuilder(
                animation: _c,
                child: SizedBox(
                  height: 200,
                  width: 200,
                  child: Center(
                    child: Image.asset(
                      'assets/images/virus.png',
                    ),
                  ),
                ),
                builder:
                    (BuildContext context, Widget? child) {
                      return Transform.rotate(
                        angle: _c.value * 2 * math.pi,
                        child: child,
                      );
                    },
              ),
              SizedBox(
                height:
                    MediaQuery.of(context).size.height *
                    0.08,
              ),
              Align(
                alignment: Alignment.center,
                child: Text(
                  'Covid-19\nTracker App',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
