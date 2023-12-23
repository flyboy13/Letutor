// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

class VideoCallRoom extends StatefulWidget {
  const VideoCallRoom({super.key});

  @override
  _VideoCallRoomState createState() => _VideoCallRoomState();
}

class _VideoCallRoomState extends State<VideoCallRoom> {
  int endTime = DateTime.now().millisecondsSinceEpoch + 10000000 * 30;
  bool muted = false;
  bool camOff = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: Container(
        height: 50,
        color: Colors.black.withOpacity(0.8),
        child: Row(
          children: [
            Expanded(
              child: Container(
                alignment: Alignment.center,
                child: InkWell(
                  child: SizedBox(
                    width: 40,
                    height: 40,
                    child: Container(
                      color: Colors.grey,
                      child: Icon(
                        muted ? Icons.mic_off : Icons.mic,
                        size: 30,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      muted = !muted;
                    });
                  },
                ),
              ),
            ),
            Expanded(
              child: Container(
                alignment: Alignment.center,
                child: InkWell(
                  child: SizedBox(
                    width: 40,
                    height: 40,
                    child: Container(
                      color: Colors.grey,
                      child: Icon(
                        camOff ? Icons.videocam_off : Icons.videocam,
                        size: 30,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      camOff = !camOff;
                    });
                  },
                ),
              ),
            ),
            Expanded(
              child: Container(
                alignment: Alignment.center,
                child: InkWell(
                  child: SizedBox(
                    width: 40,
                    height: 40,
                    child: Container(
                      color: Colors.red,
                      child: const Icon(
                        Icons.call_end,
                        size: 30,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(
                    alignment: Alignment.topLeft,
                    child: Row(
                      children: [
                        SizedBox(
                          child: Image.asset(
                            'assets/calendar.png',
                            scale: 50,
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(5),
                          color: Colors.black.withOpacity(0.5),
                          margin: const EdgeInsets.only(left: 10),
                          child: const Row(
                            children: [
                              Text(
                                "Tutoring meeting room",
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          color: Colors.black.withOpacity(0.5),
                          alignment: Alignment.center,
                          width: 200,
                          child: const Text(
                            'Lesson start in: ',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Container(
                          color: Colors.black.withOpacity(0.5),
                          alignment: Alignment.center,
                          width: 200,
                          child: Text(
                            endTime.toString(),
                            style: const TextStyle(
                                fontSize: 20, color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
