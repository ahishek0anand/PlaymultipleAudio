import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/services.dart';

typedef void OnError(Exception exception);

class Oneaudio extends StatefulWidget {
  String sound;
  Oneaudio({Key key, @required this.sound}) : super(key: key);

  @override
  _OneaudioState createState() => _OneaudioState(sound);
}

class _OneaudioState extends State<Oneaudio> {
  Duration _duration = new Duration();
  Duration _position = new Duration();
  AudioPlayer advancedPlayer;
  AudioCache audioCache;
  double _sliderValue=1;
  String sound;
  _OneaudioState(this.sound);
  @override
  void initState() {
    super.initState();
    initPlayer();
  }

  void initPlayer() {
    advancedPlayer = new AudioPlayer();
    audioCache = new AudioCache(fixedPlayer: advancedPlayer);

    advancedPlayer.durationHandler = (d) => setState(() {
          _duration = d;
        });

    advancedPlayer.positionHandler = (p) => setState(() {
          _position = p;
        });
  }
void soundlevel(){
advancedPlayer.setVolume(_sliderValue);

}
  String localFilePath;
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () {
                   
                    audioCache.play(sound,volume: _sliderValue);
                   
                  },
                  child: Container(
                    height: 60,
                    width: 60,
                    child: Image(
                      image: AssetImage("assets/play-button.png"),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () {
                    advancedPlayer.pause();
                    advancedPlayer.setVolume(_sliderValue);
                  },
                  child: Container(
                    height: 60,
                    width: 60,
                    child: Image(
                      image: AssetImage("assets/icon.png"),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 60,
                  width: 60,
                  child: Image(
                    image: AssetImage("assets/square.png"),
                  ),
                ),
              ),
            ],
          ),
          //slider
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Slider(
              activeColor: Colors.indigoAccent,
              min: 0,
              max: 1,
              onChanged: (newRating) {
                
                setState(() {_sliderValue = newRating;
                 
                  });
                  soundlevel();

                 
              },
              value: _sliderValue,
              
            ),
            

          ),
          Text("${_sliderValue}")
        ],
      ),
    );
  }
}
