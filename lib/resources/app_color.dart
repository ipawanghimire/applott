import 'package:flutter/material.dart';

const Color darkModeprimaryColor = Colors.black;
const Color primaryColor = Color(0xff7879F1);

const Color textColor = Color(0xffABABF7);
const Color whiteColor = Color(0xffFFFFFF);
const Color yellowColor = Color(0xffF0BB00);
const Color liteYellowColor = Color(0xffFAFF00);
const Color greyColor = Color(0xff999999);
const Color greenColor = Color(0xff26AE60);
const Color darkBlue = Color(0xFF1C37CC);
LinearGradient deepGreenGradient() {
  return const LinearGradient(
    colors: [
      Color(0xFF09781B),
      Color(0xFF00610F),
    ],
    stops: [0.0, 1.0],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
}

LinearGradient bodyGradient() {
  return const LinearGradient(
    colors: [
      Color(0xFF675FD1), // Start color: #675FD1
      Colors.black,
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
}

LinearGradient headerGradient() {
  return const LinearGradient(
    colors: [
      Color(0xFF675FD1), // Start color: #675FD1
      Color(0xFF414BC3),
    ],
    stops: [1.0, 1.0],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
}

LinearGradient createLightGreenGradient() {
  return const LinearGradient(
    colors: [
      Color(0xFFA0E59A),
      Color(0xFF189D0D),
    ],
    stops: [0.0, 1.0],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
}

LinearGradient createDarkBlueGradient() {
  return const LinearGradient(
    colors: [
      Color(0xFF0C1F4A),
      Color(0xFF3054A0),
    ],
    stops: [0.0, 1.0],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
}

LinearGradient createNewBlueGradient() {
  return const LinearGradient(
    colors: [
      Color(0xFF5E84FD),
      Color(0xFF1C37CC),
    ],
    stops: [0.0, 1.0],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
}

LinearGradient createAvgGreenGradient() {
  return const LinearGradient(
    colors: [
      Color(0xFF26AE60),
      Color(0xFF008539),
    ],
    stops: [0.0, 1.0],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
}

const BoxDecoration customBoxDecoration = BoxDecoration(
  gradient: LinearGradient(
    begin: Alignment(0.5, 0),
    end: Alignment(0.5, 1),
    colors: [
      Color(0x66FFFFFF),
      Color(0x1AFFFFFF),
    ],
  ),
  border: Border.fromBorderSide(BorderSide(width: 2, color: Color(0x80FFFFFF))),
  borderRadius: BorderRadius.all(Radius.circular(20)),
);
const TextStyle myTextStyle = TextStyle(
  fontWeight: FontWeight.w600,
  fontSize: 18,
  color: whiteColor,
);
