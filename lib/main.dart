import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:audioplayers/audio_cache.dart';
import './audioPlayer.dart';

// title, photo, voice, need Border
final List<List<dynamic>> dataList = [
  ['Line登登登', 'line.png', 'line.mp3', false],
  ['Lineeeeee', 'line_circle.png', 'line_logo_sound.mp3', false],
  ['Knock', 'knock.png', 'knock.mp3', true],
  ['小震', 'vibration1.png', 'phone_vibration1.mp3', true],
  ['大震', 'vibration2.png', 'phone_vibration2.mp3', true],
];
void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isMute = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> dataListWidget = dataList.map((data) {
      return _buildCard(data);
    }).toList();

    return MaterialApp(
        home: Scaffold(
            backgroundColor: Colors.blue,
            body: GridView.count(crossAxisCount: 2, children: dataListWidget),
            floatingActionButton: FloatingActionButton(
              backgroundColor: Colors.grey,
              heroTag: "sound",
              child: isMute ? Icon(Icons.volume_off) : Icon(Icons.volume_up),
              onPressed: () {
                stopAudio();
                setState(() {
                  isMute = !isMute;
                });
              },
            )));
  }

  Widget _buildCard(data) {
    String title = data[0];
    String photoFilename = data[1];
    String audioFilename = data[2];
    bool isNeedBorder = data[3];

    return CupertinoButton(
      child: Container(
        height: 150,
        width: 150,
        decoration: BoxDecoration(
          border: isNeedBorder
              ? Border.all(
                  color: Colors.white, width: 2.0, style: BorderStyle.solid)
              : null,

          //color: Color.fromARGB(255, 255, 255, Random().nextInt(255)),
          image: DecorationImage(
            image: AssetImage("assets/$photoFilename"),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Container(
          margin: EdgeInsets.fromLTRB(15, 15, 0, 0),
          child: Text(
            title,
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.w600),
          ),
        ),
      ),
      onPressed: () {
        if (!isMute) {
          playAudio(audioFilename);
        }
      },
    );
  }
}

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//         home: Scaffold(
//             appBar: AppBar(
//               title: Text('Whip2'),
//             ),
//             body: Center(
//               child: Center(child: Image.asset('assets/whip.png')),
//             ),
//             floatingActionButton: FloatingActionButton(
//                 onPressed: () => playCache(),
//                 tooltip: 'Sound',
//                 child: Icon(Icons.volume_up))));
//   }
// }
