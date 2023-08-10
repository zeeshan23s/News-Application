import 'packages_export.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: TextTheme(
          headlineLarge: TextStyle(
              fontSize: ScreenHelper.screenHeight(context) * 0.028,
              fontFamily: GoogleFonts.poppins().fontFamily),
          headlineMedium: TextStyle(
              fontSize: ScreenHelper.screenHeight(context) * 0.024,
              fontFamily: GoogleFonts.poppins().fontFamily),
          bodyLarge: TextStyle(
              fontSize: ScreenHelper.screenHeight(context) * 0.018,
              fontFamily: GoogleFonts.poppins().fontFamily),
          bodyMedium: TextStyle(
              fontSize: ScreenHelper.screenHeight(context) * 0.016,
              fontFamily: GoogleFonts.poppins().fontFamily),
          bodySmall: TextStyle(
              fontSize: ScreenHelper.screenHeight(context) * 0.014,
              fontFamily: GoogleFonts.poppins().fontFamily),
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}
