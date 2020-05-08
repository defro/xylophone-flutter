import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  void playSound(int soundNumber) {
    final player = AudioCache();
    player.play('note$soundNumber.wav');
  }

  Widget buildKey({int soundNumber, Color color}) {
    return Expanded(
      child: FlatButton(
        onPressed: () {
          playSound(soundNumber);
        },
        color: color,
      ),
    );
  }

  Widget buildKeyInstrument({String soundName, Color color}) {
    return Expanded(
      child: FlatButton(
        onPressed: () {
          final player = AudioCache();
          player.play('$soundName.wav');
        },
        color: color,
        child: Text(soundName),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Row(
            children: <Widget>[
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    buildKey(soundNumber: 1, color: Colors.red),
                    buildKey(soundNumber: 2, color: Colors.orange),
                    buildKey(soundNumber: 3, color: Colors.yellow),
                    buildKey(soundNumber: 4, color: Colors.blue),
                    buildKey(soundNumber: 5, color: Colors.teal),
                    buildKey(soundNumber: 6, color: Colors.green),
                    buildKey(soundNumber: 7, color: Colors.purple),
                  ],
                ),
              ),
              SizedBox(
                width: 10.0,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    buildKeyInstrument(
                        soundName: 'violin', color: Colors.red.shade200),
                    buildKeyInstrument(
                        soundName: 'flute', color: Colors.orange.shade200),
                    buildKeyInstrument(
                        soundName: 'sax', color: Colors.yellow.shade200),
                    buildKeyInstrument(
                        soundName: 'trumpet', color: Colors.blue.shade200),
                    buildKeyInstrument(
                        soundName: 'aah', color: Colors.teal.shade200),
                    buildKeyInstrument(
                        soundName: 'guitar', color: Colors.green.shade200),
                    buildKeyInstrument(
                        soundName: 'cello', color: Colors.purple.shade200),
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
