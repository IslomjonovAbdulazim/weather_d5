import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:weather/weather.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: false,
      builder: (_) => WeatherApp(),
    ),
  );
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String city = "Iceland";
  int temp = 0;
  String sky = "";
  bool isLoading = false;

  @override
  void initState() {
    load();
    super.initState();
  }

  void load() async {
    String key = "30d288037340bc186f3c77d4ad7d435a";
    WeatherFactory wf = WeatherFactory(key);
    isLoading = true;
    setState(() {});
    Weather weather = await wf.currentWeatherByCityName(city);
    isLoading = false;
    setState(() {});
    temp = weather.temperature?.celsius?.toInt() ?? temp;
    sky = weather.weatherMain ?? sky;
    setState(() {});
  }

  String getWeatherImage() {
    switch (sky.toLowerCase()) {
      case 'clear':
        return 'assets/sunny.png';
      case 'clouds':
        return 'assets/cloud.png';
      case 'rain':
      case 'drizzle':
        return 'assets/rain.png';
      case 'snow':
        return 'assets/snow.png';
      case 'thunderstorm':
        return 'assets/thunderstorm.png';
      case 'wind':
        return 'assets/wind.png';
      default:
        return 'assets/cloud.png';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: isLoading
              ? Center(
                  child: CircularProgressIndicator.adaptive(),
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// Top
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "February 06, 2025",
                              style: GoogleFonts.manrope(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                color: Color(0xff6B7280),
                              ),
                            ),
                            Text(
                              city,
                              style: GoogleFonts.manrope(
                                color: Color(0xff111827),
                                fontSize: 40,
                                fontWeight: FontWeight.w800,
                                height: 1,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),

                    /// Body
                    Spacer(),
                    Image.asset(getWeatherImage()),
                    Spacer(),

                    /// Bottom
                    GradientText(
                      "$temp°",
                      colors: [
                        Color(0xff111827),
                        Color(0xff6B7280),
                      ],
                      gradientDirection: GradientDirection.ttb,
                      style: GoogleFonts.manrope(
                        fontSize: 130,
                        fontWeight: FontWeight.w900,
                        height: 1,
                      ),
                    ),
                    Text(
                      sky,
                      style: GoogleFonts.manrope(
                        fontSize: 24,
                        fontWeight: FontWeight.w900,
                        color: Color(0xff8EC1DD),
                      ),
                    ),
                    Spacer(),
                  ],
                ),
        ),
      ),
    );
  }
}
