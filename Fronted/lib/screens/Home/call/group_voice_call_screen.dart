import 'package:flutter/material.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';
//import 'package:zego_uikit/zego_uikit.dart';
//import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';

class GroupVoiceCallScreen extends StatelessWidget {
  final String callId;
  final String userId;
  final String userName;

  const GroupVoiceCallScreen({
    super.key,
    required this.callId,
    required this.userId,
    required this.userName,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ZegoUIKitPrebuiltCall(
        appID: 2027634727,
        appSign: "b249f713a363ef60314f068c7489641c6792a36f2ce912318a9ab37fbe2b7cfe",
        userID: userId,
        userName: userName,
        callID: callId,
        config: ZegoUIKitPrebuiltCallConfig.groupVoiceCall(),
      ),
    );
  }
}
