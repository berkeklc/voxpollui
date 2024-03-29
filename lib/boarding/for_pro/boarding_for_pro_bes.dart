import 'package:flutter/material.dart';

void main() {
  runApp(const VoxpollProBes());
}
class VoxpollProBes extends StatelessWidget {
  const VoxpollProBes({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color.fromARGB(255, 18, 32, 47),
      ),
      home: Scaffold(
        body: Container(
  width: 428,
  height: 926,
  clipBehavior: Clip.antiAlias,
  decoration: ShapeDecoration(
    color: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(32),
    ),
  ),
  child: Stack(
    children: [
      Positioned(
        left: 0,
        top: 0,
        child: Container(
          width: 428,
          height: 47,
          clipBehavior: Clip.antiAlias,
          decoration: const BoxDecoration(),
          child: Stack(
            children: [
              Positioned(
                left: 33,
                top: 14,
                child: Container(
                  width: 54,
                  height: 21,
                  padding: const EdgeInsets.only(top: 1),
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 54,
                        height: 20,
                        child: Text(
                          '9:41',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xFF010101),
                            fontSize: 17,
                            fontFamily: 'SF Pro Text',
                            fontWeight: FontWeight.w600,
                            height: 0.08,
                            letterSpacing: -0.41,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 318,
                top: 19,
                child: SizedBox(
                  width: 77.40,
                  height: 13,
                  child: Stack(
                    children: [
                      const Positioned(
                        left: 50,
                        top: 0,
                        child: SizedBox(
                          width: 27.40,
                          height: 13,
                          child: Stack(children: [
                          
                          ]),
                        ),
                      ),
                      Positioned(
                        left: 26,
                        top: 1,
                        child: Container(
                          width: 17,
                          height: 12,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage("https://via.placeholder.com/17x12"),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      Positioned(
        left: 26,
        top: 64,
        child: SizedBox(
          width: 40,
          height: 40,
          child: Stack(
            children: [
              Positioned(
                left: 0,
                top: 0,
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(width: 1, color: Color(0xFFBCBCBC)),
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      Positioned(
        left: 31,
        top: 843,
        child: Container(
          width: 366,
          height: 49,
          decoration: ShapeDecoration(
            color: const Color(0xFF2355FF),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          ),
        ),
      ),
      const Positioned(
        left: 141,
        top: 861,
        child: Text(
          'Ödeme Tamamlandı',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontFamily: 'Gilroy',
            fontWeight: FontWeight.w700,
            height: 0,
          ),
        ),
      ),
      const Positioned(
        left: 144,
        top: 483,
        child: Text(
          'Başarılı!',
          style: TextStyle(
            color: Color(0xFF151515),
            fontSize: 34,
            fontFamily: 'Gilroy',
            fontWeight: FontWeight.w700,
            height: 0,
          ),
        ),
      ),
      const Positioned(
        left: 55,
        top: 533,
        child: Text(
          'Siparişiniz yakında teslim edilecektir.           Uygulamamızı seçtiğiniz için teşekkür ederiz!',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0xFF161616),
            fontSize: 16,
            fontFamily: 'Gilroy',
            fontWeight: FontWeight.w500,
            height: 0,
          ),
        ),
      ),
      Positioned(
        left: 50,
        top: 225,
        child: Container(
          width: 317,
          height: 210,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: NetworkImage("https://via.placeholder.com/317x210"),
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    ],
  ),
)
      ),
    );
  }
}