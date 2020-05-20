import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  Widget buildKey({int soundNumber, Color color}) {
    String noteText = 'Inconnu';
    switch (soundNumber) {
      case 6:
        {
          noteText = 'La (A)';
        }
        break;
      case 7:
        {
          noteText = 'Si (B)';
        }
        break;
      case 1:
        {
          noteText = 'Do (C)';
        }
        break;
      case 2:
        {
          noteText = 'Ré (D)';
        }
        break;
      case 3:
        {
          noteText = 'Mi (E)';
        }
        break;
      case 4:
        {
          noteText = 'Fa (F)';
        }
        break;
      case 5:
        {
          noteText = 'Sol (G)';
        }
        break;
      default:
        {
          throw Exception('Unknown note called ${soundNumber.toString()}.');
        }
        break;
    }
    return Expanded(
      child: FlatButton(
        onPressed: () {
          final player = AudioCache();
          player.play('note$soundNumber.wav');
        },
        color: color,
        child: Text(noteText),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Xylophone de Oriane'),
          backgroundColor: Color.fromRGBO(65, 30, 19, 1.0),
        ),
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  'images/shallow-focus-photography-of-red-xylophone-165972.jpg',
                ),
                fit: BoxFit.cover,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 30.0,
                horizontal: 50.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  buildKey(soundNumber: 1, color: Colors.red),
                  buildKey(soundNumber: 2, color: Colors.orange),
                  buildKey(soundNumber: 3, color: Colors.yellow),
                  buildKey(soundNumber: 4, color: Colors.green),
                  buildKey(soundNumber: 5, color: Colors.blue),
                  buildKey(soundNumber: 6, color: Colors.lightBlue),
                  buildKey(soundNumber: 7, color: Colors.purple),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
