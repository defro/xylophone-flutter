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

  Widget buildKeyFlute({String note, Color color}) {
    String noteText = 'Inconnu';
    switch (note) {
      case 'a':
        {
          noteText = 'La (A)';
        }
        break;
      case 'b':
        {
          noteText = 'Si (B)';
        }
        break;
      case 'c':
        {
          noteText = 'Do (C)';
        }
        break;
      case 'd':
        {
          noteText = 'Ré (D)';
        }
        break;
      case 'e':
        {
          noteText = 'Mi (E)';
        }
        break;
      case 'f':
        {
          noteText = 'Fa (F)';
        }
        break;
      case 'g':
        {
          noteText = 'Sol (G)';
        }
        break;
      default:
        {
          throw Exception('Unknown note called $note.');
        }
        break;
    }
    return Expanded(
      child: FlatButton(
        onPressed: () {
          final player = AudioCache(prefix: 'flute/');
          player.play('mtg__flute-${note}4.wav');
        },
        color: color,
        child: Text(noteText),
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
              /*Expanded(
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
              ),*/
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    buildKeyFlute(note: 'c', color: Colors.red.shade200),
                    buildKeyFlute(note: 'd', color: Colors.orange.shade200),
                    buildKeyFlute(note: 'e', color: Colors.yellow.shade200),
                    buildKeyFlute(note: 'f', color: Colors.blue.shade200),
                    buildKeyFlute(note: 'g', color: Colors.teal.shade200),
                    buildKeyFlute(note: 'a', color: Colors.green.shade200),
                    buildKeyFlute(note: 'b', color: Colors.purple.shade200),
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
