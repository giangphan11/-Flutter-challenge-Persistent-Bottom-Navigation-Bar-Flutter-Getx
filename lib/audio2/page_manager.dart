import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class PageManager {
  final progressNotifier = ValueNotifier<ProgressBarState>(
    ProgressBarState(
      current: Duration.zero,
      buffered: Duration.zero,
      total: Duration.zero,
    ),
  );
  final buttonNotifier = ValueNotifier<ButtonState>(ButtonState.paused);

  //static const url = 'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-2.mp3';
  static const url = 'https://rr5---sn-8pxuuxa-i5oek.googlevideo.com/videoplayback?expire=1663534075&ei=my8nY7eGEIiVigbZmbmABA&ip=2402%3A800%3A61ae%3Ad89f%3A7c1b%3Ac15c%3Ad6fa%3Aeb3f&id=o-ALCnzGZbwJwUJvS8ND0JbJf-_2vwwbH8q2tMG4bScZjL&itag=140&source=youtube&requiressl=yes&mh=1I&mm=31%2C29&mn=sn-8pxuuxa-i5oek%2Csn-8pxuuxa-i5o6k&ms=au%2Crdu&mv=m&mvi=5&pl=50&initcwndbps=1248750&vprv=1&mime=audio%2Fmp4&gir=yes&clen=74229219&dur=4586.567&lmt=1663417290997002&mt=1663512311&fvip=6&keepalive=yes&fexp=24001373%2C24007246&c=ANDROID_EMBEDDED_PLAYER&rbqsm=fr&txp=4432434&sparams=expire%2Cei%2Cip%2Cid%2Citag%2Csource%2Crequiressl%2Cvprv%2Cmime%2Cgir%2Cclen%2Cdur%2Clmt&sig=AOq0QJ8wRQIhALgIXOaOTz9p8f4QIGWGs76VVws6WdgBV0bxmK5k4nxHAiBWJ6zSJWkul80tcHKvBNNCdffogssy-zuz1GW_HWAwEQ%3D%3D&lsparams=mh%2Cmm%2Cmn%2Cms%2Cmv%2Cmvi%2Cpl%2Cinitcwndbps&lsig=AG3C_xAwRgIhAI1gk0slnrgbAiMkL6LONpYcX2yKcluv-D0WijXwK84wAiEA8XCuylqJuSZIPO8I6tHrmlkdQythNSOixq5KKqxRgfs%3D';

  late AudioPlayer _audioPlayer;
  PageManager() {
    _init();
  }

  void _init() async {
    _audioPlayer = AudioPlayer();
    print("1");
    await _audioPlayer.setUrl(url);
    print("2");
    _audioPlayer.playerStateStream.listen((playerState) {
      final isPlaying = playerState.playing;
      final processingState = playerState.processingState;
      if (processingState == ProcessingState.loading ||
          processingState == ProcessingState.buffering) {
        buttonNotifier.value = ButtonState.loading;
      } else if (!isPlaying) {
        buttonNotifier.value = ButtonState.paused;
      } else if (processingState != ProcessingState.completed) {
        buttonNotifier.value = ButtonState.playing;
      } else {
        _audioPlayer.seek(Duration.zero);
        _audioPlayer.pause();
      }
    });

    _audioPlayer.positionStream.listen((position) {
      final oldState = progressNotifier.value;
      progressNotifier.value = ProgressBarState(
        current: position,
        buffered: oldState.buffered,
        total: oldState.total,
      );
    });

    _audioPlayer.bufferedPositionStream.listen((bufferedPosition) {
      final oldState = progressNotifier.value;
      progressNotifier.value = ProgressBarState(
        current: oldState.current,
        buffered: bufferedPosition,
        total: oldState.total,
      );
    });

    _audioPlayer.durationStream.listen((totalDuration) {
      final oldState = progressNotifier.value;
      progressNotifier.value = ProgressBarState(
        current: oldState.current,
        buffered: oldState.buffered,
        total: totalDuration ?? Duration.zero,
      );
    });
  }

  void play() {
    _audioPlayer.play();
  }

  void pause() {
    _audioPlayer.pause();
  }

  void seek(Duration position) {
    _audioPlayer.seek(position);
  }

  void dispose() {
    _audioPlayer.dispose();
  }
}

class ProgressBarState {
  ProgressBarState({
    required this.current,
    required this.buffered,
    required this.total,
  });
  final Duration current;
  final Duration buffered;
  final Duration total;
}

enum ButtonState { paused, playing, loading }