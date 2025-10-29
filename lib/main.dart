import 'package:covid_tracker/views/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // final colorScheme = ColorScheme.fromSeed(
    //   seedColor: Colors.deepPurple,
    //   brightness: Brightness
    //       .dark, // this automatically sets dark mode colors
    // );
    return MaterialApp(
      title: 'Flutter Demo',

      theme: ThemeData(
        // useMaterial3: true,
        // scaffoldBackgroundColor: Colors.black87,
        // colorScheme: colorScheme,

        // brightness: Brightness.dark,
        // scaffoldBackgroundColor: Color.fromRGBO(
        //   34,
        //   30,
        //   30,
        //   1,
        // ),
        // textTheme: ThemeData.dark().textTheme.apply(
        //   bodyColor: Colors.white,
        //   displayColor: Colors.white,
        // ),
        // appBarTheme: const AppBarTheme(
        //   backgroundColor: Colors.black,
        //   foregroundColor: Colors.white,
        //   surfaceTintColor: Colors.transparent,
        // ),
        brightness: Brightness.dark,
        primarySwatch: Colors.blue,
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
      ),

      home: SplashScreen(),
    );
  }
}
