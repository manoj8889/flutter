import 'dart:math';
import 'package:flutter/material.dart';

void main() => runApp(MoodApp());

class MoodApp extends StatefulWidget {
  @override
  _MoodAppState createState() => _MoodAppState();
}

class _MoodAppState extends State<MoodApp> {
  Color _color = Colors.blue;
  String _message = "Stay calm and creative!";

  void _generateMood() {
    final random = Random();
    _color = Color.fromRGBO(
      random.nextInt(256),
      random.nextInt(256),
      random.nextInt(256),
      1,
    );

    // Simple color mood logic
    final brightness = _color.computeLuminance();
    if (brightness > 0.7) {
      _message = "Bright vibes only 🌞";
    } else if (brightness > 0.4) {
      _message = "Stay balanced 🌈";
    } else {
      _message = "Deep thoughts tonight 🌙";
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: _color,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                _message,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _generateMood,
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white.withOpacity(0.8)),
                child: Text("Generate Mood", style: TextStyle(color: Colors.black)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
