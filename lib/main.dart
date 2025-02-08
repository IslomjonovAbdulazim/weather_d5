import 'package:device_preview/device_preview.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

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

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
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
                        "Tashkent",
                        style: GoogleFonts.manrope(
                          color: Color(0xff111827),
                          fontSize: 48,
                          fontWeight: FontWeight.w800,
                          height: 1,
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(CupertinoIcons.location_solid),
                  ),
                ],
              ),

              /// Body
              Spacer(),
              Image.asset("assets/wind.png"),
              Spacer(),

              /// Bottom
              GradientText(
                "19°",
                colors: [
                  Color(0xff111827),
                  Color(0xff6B7280),
                ],
                gradientDirection: GradientDirection.ttb,
                style: GoogleFonts.manrope(
                  fontSize: 144,
                  fontWeight: FontWeight.w900,
                  height: 1,
                ),
              ),
              Text(
                "Cloud",
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
