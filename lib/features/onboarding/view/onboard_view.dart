import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:voxpollui/features/onboarding/mixin/onboard_mixin.dart';
import 'package:voxpollui/features/onboarding/view/onboard_iki.dart';
import 'package:voxpollui/product/constants/font_constants.dart';
import 'package:voxpollui/product/localization/locale_keys.g.dart';

final class OnboardView extends StatefulWidget {
  const OnboardView({super.key});

  @override
  State<OnboardView> createState() => _OnboardViewState();
}

class _OnboardViewState extends State<OnboardView> with OnboardMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        child: Stack(
          children: [
            Positioned(
              left: 270,
              top: 493,
              child: SizedBox(
                width: 260,
                height: 260,
                child: Stack(
                  children: [
                    Positioned(
                      left: 130,
                      top: 0,
                      child: Transform(
                        transform: Matrix4.identity()
                          ..translate(0.0)
                          ..rotateZ(0.79),
                        child: Container(
                          width: 183.85,
                          height: 183.85,
                          decoration: ShapeDecoration(
                            color: const Color(0xFF2355FF),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(47),
                            ),
                          ),
                        ),
                      ),
                    ),
                    // Sağa bakan ok
                    Positioned(
                      left: 60,
                      top: 115,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const BoardinIki(),
                            ),
                          );
                        },
                        child: const Icon(
                          Icons.arrow_forward,
                          size: 40,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ), //@
              ),
            ),
            Positioned(
              left: -150,
              top: 200,
              child: SizedBox(
                width: 260,
                height: 260,
                child: Stack(
                  children: [
                    Positioned(
                      child: Transform(
                        transform: Matrix4.identity()
                          ..translate(0.0)
                          ..rotateZ(0),
                        child: Container(
                          width: 183.85,
                          height: 183.85,
                          decoration: ShapeDecoration(
                            color: Colors.grey.withOpacity(0.2),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(56),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ), //@
              ),
            ),
            Positioned(
              left: 44,
              top: 94,
              child: Container(
                width: 90,
                height: 90,
                decoration: const ShapeDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/image/profil_foto1.png'),
                    fit: BoxFit.fill,
                  ),
                  shape: OvalBorder(),
                ),
              ),
            ),
            Positioned(
              left: 290,
              top: 148,
              child: Container(
                width: 69,
                height: 69,
                decoration: const ShapeDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/image/profil_foto2.png'),
                    fit: BoxFit.fill,
                  ),
                  shape: OvalBorder(),
                ),
              ),
            ),
            Positioned(
              left: 149,
              top: 281,
              child: Container(
                width: 125,
                height: 125,
                decoration: const ShapeDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/image/profil_foto3.png'),
                    fit: BoxFit.fill,
                  ),
                  shape: OvalBorder(),
                ),
              ),
            ),
            Positioned(
              left: 115,
              top: 263,
              child: Container(
                width: 13,
                height: 13,
                decoration: const ShapeDecoration(
                  color: Color(0xFFED3434),
                  shape: OvalBorder(),
                ),
              ),
            ),
            Positioned(
              left: 307,
              top: 94,
              child: Container(
                width: 18,
                height: 18,
                decoration: const ShapeDecoration(
                  color: Color(0xFF8FFF67),
                  shape: OvalBorder(),
                ),
              ),
            ),
            Positioned(
              left: 31,
              top: 61,
              child: Container(
                width: 26,
                height: 26,
                decoration: const ShapeDecoration(
                  color: Color(0xFFFF19CD),
                  shape: OvalBorder(),
                ),
              ),
            ),
            Positioned(
              left: 241,
              top: 272,
              child: Container(
                width: 153,
                height: 39,
                decoration: ShapeDecoration(
                  color: const Color(0xFF0C0C0C),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 201,
              top: 168,
              child: Container(
                width: 101,
                height: 29,
                decoration: ShapeDecoration(
                  color: const Color(0xFF0C0C0C),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 115,
              top: 86,
              child: Container(
                width: 129,
                height: 37,
                decoration: ShapeDecoration(
                  color: const Color(0xFF0C0C0C),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 246,
              top: 276,
              child: Container(
                width: 31,
                height: 31,
                decoration: const ShapeDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Color(0xFF00A3D7), Color(0xFF2355FF)],
                  ),
                  shape: OvalBorder(),
                ),
              ),
            ),
            Positioned(
              left: 205,
              top: 171,
              child: Container(
                width: 23,
                height: 23,
                decoration: const ShapeDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Color(0xFF00A3D7), Color(0xFF2355FF)],
                  ),
                  shape: OvalBorder(),
                ),
              ),
            ),
            Positioned(
              left: 119,
              top: 90,
              child: Container(
                width: 29,
                height: 29,
                decoration: const ShapeDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Color(0xFF00A3D7), Color(0xFF2355FF)],
                  ),
                  shape: OvalBorder(),
                ),
              ),
            ),
            Positioned(
              left: 125,
              top: 96,
              child: Container(
                width: 17,
                height: 17,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/image/Done.png'),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 253,
              top: 282,
              child: Container(
                width: 18,
                height: 18,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/image/Done.png'),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 211,
              top: 177,
              child: Container(
                width: 11,
                height: 11,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/image/Done.png'),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 286,
              top: 284,
              child: Container(
                width: 76,
                height: 4,
                decoration: ShapeDecoration(
                  color: const Color(0xFF323232),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 155,
              top: 99,
              child: Container(
                width: 65,
                height: 3,
                decoration: ShapeDecoration(
                  color: const Color(0xFF323232),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 236,
              top: 177,
              child: Container(
                width: 38,
                height: 3,
                decoration: ShapeDecoration(
                  color: const Color(0xFF323232),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 286,
              top: 294,
              child: Container(
                width: 91,
                height: 4,
                decoration: ShapeDecoration(
                  color: const Color(0xFF323232),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 155,
              top: 108,
              child: Container(
                width: 78,
                height: 3,
                decoration: ShapeDecoration(
                  color: const Color(0xFF323232),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 236,
              top: 185,
              child: Container(
                width: 46,
                height: 3,
                decoration: ShapeDecoration(
                  color: const Color(0xFF323232),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 47,
              top: 500,
              child: Text(
                LocaleKeys.onboard_page1_appinfo1.tr(),
                style: TextStyle(
                  color: const Color(0xFF0C0C0C),
                  fontSize: 36,
                  fontFamily: FontConstants.gilroyLight,
                  fontWeight: FontWeight.w300,
                  height: 0,
                ),
              ),
            ),
            Positioned(
              left: 47,
              top: 544,
              child: Text(
                LocaleKeys.onboard_page1_appinfo2.tr(),
                style: TextStyle(
                  color: const Color(0xFF0C0C0C),
                  fontSize: 36,
                  fontFamily: FontConstants.gilroyLight,
                  fontWeight: FontWeight.w300,
                  height: 0,
                ),
              ),
            ),
            Positioned(
              left: 47,
              top: 588,
              child: Text(
                LocaleKeys.onboard_page1_appinfo3.tr(),
                style: TextStyle(
                  color: const Color(0xFF2355FF),
                  fontSize: 36,
                  fontFamily: FontConstants.gilroyBlack,
                  height: 0,
                ),
              ),
            ),
            Positioned(
              left: 15,
              top: 620,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: GestureDetector(
                  onTap: () {
                    /*
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const BoardinIki()),
                      );
                      */
                  },
                  child: Container(
                    alignment: Alignment.bottomCenter,
                    width: MediaQuery.of(context).size.width / 2 - 50,
                    height: 49,
                    margin: const EdgeInsets.all(31),
                    decoration: ShapeDecoration(
                      color: const Color(0xFF2355FF),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        LocaleKeys.onboard_page1_start.tr(),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontFamily: FontConstants.gilroySemibold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


/*
Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(LocaleKeys.onboard_welcome.tr()),
          ),
          ElevatedButton(
            onPressed: onContinue,
            child: Text(LocaleKeys.onboard_continue.tr()),
          ),
        ],
      ),
    );
*/