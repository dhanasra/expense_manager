
import 'package:flutter/material.dart';

//color codes
const primary = Color.fromARGB(255, 0, 2, 100);
const primary60 = Color(0xFFCF9FFF);
const primary10 = Color(0xFFECEAFC);

const secondary = Color(0xFF5367ff);
const secondary130 = Color(0xFF98a4ff);
const secondary60 = Color(0xFF98a4ff);
const secondary30 = Color(0xFFeef0ff);

const text130 = Color(0xFF44475b);
const text = Color(0xFF44475b);
const subtext = Color(0xFF7c7e8c);
const subtext50 = Color(0xFFb0b2ba);
const subtext70 = Color(0xFFecedef);

const information = Color(0xFF06B2FF);
const information50 = Color(0xFFCAE4FF);
const information70 = Color(0xFFDAE2FF);
const information10 = Color(0x44ADD8E6);

const iconLight = Color(0xFFb0b2ba);
const iconMedium = Color(0xFFdddee1);
const iconStrong = Color(0xFFecedef);

const border = Color(0xFFecedef);
const bgLight = Color(0xFFF5F5F5);

const ternary = Color(0xFF06B2FF);
const primaryLight = Color(0xFFCFE0FA);
const subText = Color(0xFF9F9F9F);
const info = Color(0xFFB0B0B0);
const promptColor = Color(0xFFD0D0D0);
const iconColor = Color(0xFF1E1E1E);
const error = Color(0xFFFF0000);
const error50 = Color(0xFFCC4444);
const success = Color(0xFF226642);
const warning = Color(0xFFF1C232);

//gradient
const splashGradient = LinearGradient(
    colors: [
      Color.fromARGB(255, 0, 0, 243),
      Color.fromARGB(255, 28, 168, 70),
      Color.fromARGB(255, 0, 0, 255)
    ],
    stops: [0,0.5, 1],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight
);

//dimensions
const double blunt_4 = 4;
const double blunt = 4;
const double circle = 100;

const shimmer_1 = "shimmer_2";
const shimmer_2 = "shimmer_2";
const shimmer_3 = "shimmer_3";

//enums
enum SocialMediaType {
  google,
  facebook
}
enum Tags {
  error,
  info,
  success
}

enum MemberRole {
  Editor,
  Viewer,
  Admin
}

enum CashEntryType {
  CASH_IN,
  CASH_OUT
}

// durations
const kMS50 = Duration(milliseconds: 50);
const kMS100 = Duration(milliseconds: 100);
const kMS150 = Duration(milliseconds: 150);
const kMS200 = Duration(milliseconds: 200);
const kMS250 = Duration(milliseconds: 250);
const kMS300 = Duration(milliseconds: 300);
const kMS350 = Duration(milliseconds: 350);
const kMS400 = Duration(milliseconds: 400);
const kMS500 = Duration(milliseconds: 500);
const kMS800 = Duration(milliseconds: 800);
const kS1 = Duration(seconds: 1);
const kS2 = Duration(seconds: 2);
const kS3 = Duration(seconds: 3);
const kS5 = Duration(seconds: 5);
const kS20 = Duration(seconds: 20);

//defaults
const appAssets = "assets/images/";
const commonAvatar = "https://firebasestorage.googleapis.com/v0/b/tlearn-d688e.appspot.com/o/app_images%2Fman%20(1).png?alt=media&token=9c181f09-6120-4ee6-8dc0-51f1c6597dfa";
const commonAvatarOffline = "assets/images/man.png";
const defaultCountryCode = "IN";
const defaultCurrency = "INR";

const testAccessToken = "eyJhbGciOiJSUzI1NiIsImtpZCI6IjU4NWI5MGI1OWM2YjM2ZDNjOTBkZjBlOTEwNDQ1M2U2MmY4ODdmNzciLCJ0eXAiOiJKV1QifQ.eyJpc3MiOiJodHRwczovL3NlY3VyZXRva2VuLmdvb2dsZS5jb20vZXhwZW5zZS1tYW5hZ2VyLTg1MTA0IiwiYXVkIjoiZXhwZW5zZS1tYW5hZ2VyLTg1MTA0IiwiYXV0aF90aW1lIjoxNjY0NzA1MTQzLCJ1c2VyX2lkIjoiQ3JLNzhnUUpCS2RmRmE5QXdsNDBJMTZSMHBjMiIsInN1YiI6IkNySzc4Z1FKQktkZkZhOUF3bDQwSTE2UjBwYzIiLCJpYXQiOjE2NjQ3MDUxNDQsImV4cCI6MTY2NDcwODc0NCwiZW1haWwiOiJkaGFuYS50ZXN0QDAwMS5jb20iLCJlbWFpbF92ZXJpZmllZCI6ZmFsc2UsImZpcmViYXNlIjp7ImlkZW50aXRpZXMiOnsiZW1haWwiOlsiZGhhbmEudGVzdEAwMDEuY29tIl19LCJzaWduX2luX3Byb3ZpZGVyIjoicGFzc3dvcmQifX0.YUZtxJsOm5LLgCBKJrUbNeeTRwX4FmGjv-R_JWok7BlX9rnvp8B7IaE7RhLxgPSCDXFd1c6E5jR7tiNHMRgxuVdChYNrrjqKMPjv7W9vn7tVhrDUthtTrJQaO40ewJdkNjZUywLCn7edOiZG4uebeDTtLK_f5QAu-U-uS8Gxhe_eDr6yuOmRS-LKWIvNVHVfuq2GKiG7cOyCPKE2g5eEN27DtckhS2W_mY5-eJERkV16f7dwNg2lhjuIaM7EhJ6oP7-FccGSL_kRA5WKsS_hfIrg9n8pi5ZSrMWzHkm-4d-qdNSg1tUSZFWgp29yR3ac-TP76gOHC6o3Yq4854IOzA";
const testRefreshToken = "AOEOulb-ZXoW-PaRthkd5DbM63fTxGCEEK4mOHv-JjoFnabNXFFMJLKX8LjhbFZ6hQndIu6CsDHAB5h2g-xhlVyRH-1ZNaN7ivGAs0AWzeNLg8JoCC78aiR4S-za6SJTd3YrNaxocIP4CkM1y3vSisAo6Z168lDIRT6H1txZevOxqkJsjnUQiMUH8NOO0T-LoliC4U83uoI5OuD4mQ-eJp95LkIxnchMTaueh39gTcSjZYSAzKKilOU";

const List<Map<String,String>> languages = [
  {
    "name": "Tamil",
    "code": "ta"
  },
  {
    "name": "English",
    "code": "en"
  },
];