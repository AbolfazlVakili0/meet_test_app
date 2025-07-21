import 'dart:math';

import 'package:flutter/material.dart';
import 'package:jitsi_meet_flutter_sdk/jitsi_meet_flutter_sdk.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final String _roomId;
  late final String _userName;
  final _jitsi = JitsiMeet();

  @override
  void initState() {
    super.initState();
    _roomId = _safeRoomId();
    // مثلاً نام کاربر از SharedPreferences یا سرور دریافت شده است
    _userName = 'Abolfazl'; // اینجا جایگزین کن با متغیر واقعی
  }

  String _safeRoomId() {
    final ts = DateTime.now().microsecondsSinceEpoch.toRadixString(36);
    final rnd = Random().nextInt(9999).toString().padLeft(4, '0');
    return 'call-$ts-$rnd'; // مثلاً call-l9k3x2-4821
  }

  void _joinMeeting() {
    _jitsi.join(
      JitsiMeetConferenceOptions(
        room: _roomId,
        userInfo: JitsiMeetUserInfo(displayName: _userName),
        serverURL: "https://meet.jit.si/",
        token: "eyJhbGciOiJSUzI1NiIsImtpZCI6IjZkZTQwZjA0ODgxYzZhMDE2MTFlYjI4NGE0Yzk1YTI1MWU5MTEyNTAiLCJ0eXAiOiJKV1QifQ.eyJuYW1lIjoiYWJvbGZhemwgdmFraWxpIiwicGljdHVyZSI6Imh0dHBzOi8vbGgzLmdvb2dsZXVzZXJjb250ZW50LmNvbS9hL0FDZzhvY0s2OWpEczZibGF6b01tRXdLZnNBckNTbWlDaklyYWxLdlJoZXYtRDBvZTFtX2ZneDFaPXM5Ni1jIiwiaXNzIjoiaHR0cHM6Ly9zZWN1cmV0b2tlbi5nb29nbGUuY29tL21lZXQtaml0LXNpLTY2Y2JkIiwiYXVkIjoibWVldC1qaXQtc2ktNjZjYmQiLCJhdXRoX3RpbWUiOjE3NTMxMjM2MTcsInVzZXJfaWQiOiI3NkZweUp2MWZsUHdWVHVnN1FGS01JdmEzcm0yIiwic3ViIjoiNzZGcHlKdjFmbFB3VlR1ZzdRRktNSXZhM3JtMiIsImlhdCI6MTc1MzEyMzg5OCwiZXhwIjoxNzUzMTI3NDk4LCJlbWFpbCI6ImFib2xmYXpsdmFraWxpMjAwMUBnbWFpbC5jb20iLCJlbWFpbF92ZXJpZmllZCI6dHJ1ZSwiZmlyZWJhc2UiOnsiaWRlbnRpdGllcyI6eyJnb29nbGUuY29tIjpbIjEwOTczMjQ4NjA0NTk1MTY0MjMyMSJdLCJlbWFpbCI6WyJhYm9sZmF6bHZha2lsaTIwMDFAZ21haWwuY29tIl19LCJzaWduX2luX3Byb3ZpZGVyIjoiZ29vZ2xlLmNvbSJ9fQ.cbt9fF8Nii6fnCzfTXcNVE1L9S0320GeaM8E9yJ407-xCM99vPjAdj97srBrH3JJ8N_JZnUANV2rZKDoyOXV8WTB4-EVCAOYnUaRqmXYspIsWieB5oxRaba_O7Mdx9ai_4OdFPqIDNnMW82kiqx9OFPock3wWm86OS0lpfBJJILNEh9RXepVXy14YSljO7Bo42aJEU3SLJKAkjV6XeO6NRDCWZ4sI0QuV7GHWInFCzRRnIMZfwMy69wywznq-P2Fvz3HJrowsk9IEo-ySqKm8-VnmNyv6hWvQvmSc3uC0H5CFqN0ja7B4GRBYUM_VW3q1RZzExc_7AJ-oluLqadPTg",
        configOverrides: {
          'startWithAudioMuted': false,
          'startWithVideoMuted': false,
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('تماس دونفره')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: _joinMeeting,
              child: const Text('شروع تماس'),
            ),
          ],
        ),
      ),
    );
  }
}
