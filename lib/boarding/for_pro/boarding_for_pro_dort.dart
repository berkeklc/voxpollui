import 'package:flutter/material.dart';

void main() {
  runApp(const VoxpollProDort());
}

// Generated by: https://www.figma.com/community/plugin/842128343887142055/
class VoxpollProDort extends StatelessWidget {
  const VoxpollProDort({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color.fromARGB(255, 18, 32, 47),
      ),
      home: Scaffold(
        body:Container(
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
        left: 119,
        top: 861,
        child: Text(
          'Ödeme İşlemine Devam Et ',
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
        left: 26,
        top: 127,
        child: Text(
          'Fatura Adreslerim',
          style: TextStyle(
            color: Color(0xFF0C0C0C),
            fontSize: 24,
            fontFamily: 'Gilroy',
            fontWeight: FontWeight.w700,
            height: 0,
          ),
        ),
      ),
      Positioned(
        left: 29,
        top: 170,
        child: Container(
          width: 371,
          height: 140,
          decoration: ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            shadows: const [
              BoxShadow(
                color: Color(0x26000000),
                blurRadius: 25,
                offset: Offset(0, 1),
                spreadRadius: 0,
              )
            ],
          ),
        ),
      ),
      Positioned(
        left: 29,
        top: 333,
        child: Container(
          width: 371,
          height: 140,
          decoration: ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            shadows: const [
              BoxShadow(
                color: Color(0x26000000),
                blurRadius: 25,
                offset: Offset(0, 1),
                spreadRadius: 0,
              )
            ],
          ),
        ),
      ),
      Positioned(
        left: 29,
        top: 497,
        child: Container(
          width: 371,
          height: 140,
          decoration: ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            shadows: const [
              BoxShadow(
                color: Color(0x26000000),
                blurRadius: 25,
                offset: Offset(0, 1),
                spreadRadius: 0,
              )
            ],
          ),
        ),
      ),
      Positioned(
        left: 29,
        top: 661,
        child: Container(
          width: 371,
          height: 88,
          decoration: ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              side: const BorderSide(
                width: 1,
                strokeAlign: BorderSide.strokeAlignOutside,
                color: Color(0xFFB8B8B8),
              ),
              borderRadius: BorderRadius.circular(5),
            ),
            shadows: const [
              BoxShadow(
                color: Color(0x26000000),
                blurRadius: 25,
                offset: Offset(0, 1),
                spreadRadius: 0,
              )
            ],
          ),
        ),
      ),
      const Positioned(
        left: 46,
        top: 228,
        child: Text(
          'Bostanlı, Girne Blv No:7/A, 35590 Karşıyaka/İzmir',
          style: TextStyle(
            color: Color(0xFF0C0C0C),
            fontSize: 14,
            fontFamily: 'Gilroy',
            fontWeight: FontWeight.w500,
            height: 0,
          ),
        ),
      ),
      const Positioned(
        left: 46,
        top: 381,
        child: Text(
          'Vali Rahmi Bey, Menderes Cd. No:85, 35380\nBuca/İzmir',
          style: TextStyle(
            color: Color(0xFF0C0C0C),
            fontSize: 14,
            fontFamily: 'Gilroy',
            fontWeight: FontWeight.w500,
            height: 0,
          ),
        ),
      ),
      const Positioned(
        left: 46,
        top: 547,
        child: Text(
          'Vali Rahmi Bey Mahallesi 138 Sokak, Öğretmen\nEvleri Sokağı No: 28-30, 35380 Buca',
          style: TextStyle(
            color: Color(0xFF0C0C0C),
            fontSize: 14,
            fontFamily: 'Gilroy',
            fontWeight: FontWeight.w500,
            height: 0,
          ),
        ),
      ),
      const Positioned(
        left: 46,
        top: 188,
        child: Text(
          'Merkez Ofis',
          style: TextStyle(
            color: Color(0xFF151515),
            fontSize: 16,
            fontFamily: 'Gilroy',
            fontWeight: FontWeight.w700,
            height: 0.08,
          ),
        ),
      ),
      const Positioned(
        left: 46,
        top: 351,
        child: Text(
          'Ev',
          style: TextStyle(
            color: Color(0xFF151515),
            fontSize: 16,
            fontFamily: 'Gilroy',
            fontWeight: FontWeight.w700,
            height: 0.08,
          ),
        ),
      ),
      const Positioned(
        left: 46,
        top: 515,
        child: Text(
          'Buca Şube',
          style: TextStyle(
            color: Color(0xFF151515),
            fontSize: 16,
            fontFamily: 'Gilroy',
            fontWeight: FontWeight.w700,
            height: 0.08,
          ),
        ),
      ),
      const Positioned(
        left: 176,
        top: 698,
        child: Text(
          'Adres Ekle',
          style: TextStyle(
            color: Color(0xFF151515),
            fontSize: 16,
            fontFamily: 'Gilroy',
            fontWeight: FontWeight.w700,
            height: 0.08,
          ),
        ),
      ),
      const Positioned(
        left: 320,
        top: 188,
        child: Text(
          'Düzenle',
          textAlign: TextAlign.right,
          style: TextStyle(
            color: Color(0xFF2355FF),
            fontSize: 14,
            fontFamily: 'Gilroy',
            fontWeight: FontWeight.w600,
            height: 0.10,
          ),
        ),
      ),
      const Positioned(
        left: 320,
        top: 351,
        child: Text(
          'Düzenle',
          textAlign: TextAlign.right,
          style: TextStyle(
            color: Color(0xFF2355FF),
            fontSize: 14,
            fontFamily: 'Gilroy',
            fontWeight: FontWeight.w600,
            height: 0.10,
          ),
        ),
      ),
      const Positioned(
        left: 320,
        top: 515,
        child: Text(
          'Düzenle',
          textAlign: TextAlign.right,
          style: TextStyle(
            color: Color(0xFF2355FF),
            fontSize: 14,
            fontFamily: 'Gilroy',
            fontWeight: FontWeight.w600,
            height: 0.10,
          ),
        ),
      ),
      const Positioned(
        left: 70,
        top: 269,
        child: Text(
          ' Varsayılan fatura adresi olarak ayarla.',
          style: TextStyle(
            color: Color(0xFF0C0C0C),
            fontSize: 12,
            fontFamily: 'Gilroy',
            fontWeight: FontWeight.w500,
            height: 0,
          ),
        ),
      ),
      const Positioned(
        left: 70,
        top: 432,
        child: Text(
          ' Varsayılan ödeme yöntemi olarak ayarla.',
          style: TextStyle(
            color: Color(0xFF0C0C0C),
            fontSize: 12,
            fontFamily: 'Gilroy',
            fontWeight: FontWeight.w500,
            height: 0,
          ),
        ),
      ),
      const Positioned(
        left: 70,
        top: 596,
        child: Text(
          ' Varsayılan ödeme yöntemi olarak ayarla.',
          style: TextStyle(
            color: Color(0xFF0C0C0C),
            fontSize: 12,
            fontFamily: 'Gilroy',
            fontWeight: FontWeight.w500,
            height: 0,
          ),
        ),
      ),
      Positioned(
        left: 46,
        top: 264,
        child: SizedBox(
          width: 20,
          height: 20,
          child: Stack(
            children: [
              Positioned(
                left: 0,
                top: 0,
                child: Container(
                  width: 20,
                  height: 20,
                  decoration: ShapeDecoration(
                    color: const Color(0xFF2355FF),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      Positioned(
        left: 46,
        top: 427,
        child: Container(
          width: 20,
          height: 20,
          decoration: ShapeDecoration(
            color: const Color(0x002355FF),
            shape: RoundedRectangleBorder(
              side: const BorderSide(width: 2, color: Color(0xFF2355FF)),
              borderRadius: BorderRadius.circular(4),
            ),
          ),
        ),
      ),
      Positioned(
        left: 46,
        top: 591,
        child: Container(
          width: 20,
          height: 20,
          decoration: ShapeDecoration(
            color: const Color(0x002355FF),
            shape: RoundedRectangleBorder(
              side: const BorderSide(width: 2, color: Color(0xFF2355FF)),
              borderRadius: BorderRadius.circular(4),
            ),
          ),
        ),
      ),
      Positioned(
        left: 31,
        top: 778,
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
        left: 182,
        top: 796,
        child: Text(
          'Kartlarım',
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
    ],
  ),
)
      ),
    );
  }
}

// class VoxpollPro extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Container(
//           width: 428,
//           height: 926,
//           clipBehavior: Clip.antiAlias,
//           decoration: ShapeDecoration(
//             color: Colors.white,
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(32),
//             ),
//           ),
//           child: Stack(
//             children: [
//               Positioned(
//                 left: 0,
//                 top: 0,
//                 child: Container(
//                   width: 428,
//                   height: 47,
//                   clipBehavior: Clip.antiAlias,
//                   decoration: BoxDecoration(),
//                   child: Stack(
//                     children: [
//                       Positioned(
//                         left: 33,
//                         top: 14,
//                         child: Container(
//                           width: 54,
//                           height: 21,
//                           padding: const EdgeInsets.only(top: 1),
//                           decoration: ShapeDecoration(
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(24),
//                             ),
//                           ),
//                           child: Row(
//                             mainAxisSize: MainAxisSize.min,
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             crossAxisAlignment: CrossAxisAlignment.center,
//                             children: [
//                               SizedBox(
//                                 width: 54,
//                                 height: 20,
//                                 child: Text(
//                                   '9:41',
//                                   textAlign: TextAlign.center,
//                                   style: TextStyle(
//                                     color: Color(0xFF010101),
//                                     fontSize: 17,
//                                     fontFamily: 'SF Pro Text',
//                                     fontWeight: FontWeight.w600,
//                                     height: 0.08,
//                                     letterSpacing: -0.41,
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                       Positioned(
//                         left: 318,
//                         top: 19,
//                         child: Container(
//                           width: 77.40,
//                           height: 13,
//                           child: Stack(
//                             children: [
//                               Positioned(
//                                 left: 50,
//                                 top: 0,
//                                 child: Container(
//                                   width: 27.40,
//                                   height: 13,
//                                   child: Stack(children: [
//                                   ,
//                                   ]),
//                                 ),
//                               ),
//                               Positioned(
//                                 left: 26,
//                                 top: 1,
//                                 child: Container(
//                                   width: 17,
//                                   height: 12,
//                                   decoration: BoxDecoration(
//                                     image: DecorationImage(
//                                       image: NetworkImage("https://via.placeholder.com/17x12"),
//                                       fit: BoxFit.fill,
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               Positioned(
//                 left: 26,
//                 top: 64,
//                 child: Container(
//                   width: 40,
//                   height: 40,
//                   child: Stack(
//                     children: [
//                       Positioned(
//                         left: 0,
//                         top: 0,
//                         child: Container(
//                           width: 40,
//                           height: 40,
//                           decoration: ShapeDecoration(
//                             shape: RoundedRectangleBorder(
//                               side: BorderSide(width: 1, color: Color(0xFFBCBCBC)),
//                               borderRadius: BorderRadius.circular(5),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               Positioned(
//                 left: 31,
//                 top: 843,
//                 child: Container(
//                   width: 366,
//                   height: 49,
//                   decoration: ShapeDecoration(
//                     color: Color(0xFF2355FF),
//                     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
//                   ),
//                 ),
//               ),
//               Positioned(
//                 left: 119,
//                 top: 861,
//                 child: Text(
//                   'Ödeme İşlemine Devam Et ',
//                   textAlign: TextAlign.center,
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 16,
//                     fontFamily: 'Gilroy',
//                     fontWeight: FontWeight.w700,
//                     height: 0,
//                   ),
//                 ),
//               ),
//               Positioned(
//                 left: 26,
//                 top: 127,
//                 child: Text(
//                   'Fatura Adreslerim',
//                   style: TextStyle(
//                     color: Color(0xFF0C0C0C),
//                     fontSize: 24,
//                     fontFamily: 'Gilroy',
//                     fontWeight: FontWeight.w700,
//                     height: 0,
//                   ),
//                 ),
//               ),
//               Positioned(
//                 left: 29,
//                 top: 170,
//                 child: Container(
//                   width: 371,
//                   height: 140,
//                   decoration: ShapeDecoration(
//                     color: Colors.white,
//                     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
//                     shadows: [
//                       BoxShadow(
//                         color: Color(0x26000000),
//                         blurRadius: 25,
//                         offset: Offset(0, 1),
//                         spreadRadius: 0,
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//               Positioned(
//                 left: 29,
//                 top: 333,
//                 child: Container(
//                   width: 371,
//                   height: 140,
//                   decoration: ShapeDecoration(
//                     color: Colors.white,
//                     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
//                     shadows: [
//                       BoxShadow(
//                         color: Color(0x26000000),
//                         blurRadius: 25,
//                         offset: Offset(0, 1),
//                         spreadRadius: 0,
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//               Positioned(
//                 left: 29,
//                 top: 497,
//                 child: Container(
//                   width: 371,
//                   height: 140,
//                   decoration: ShapeDecoration(
//                     color: Colors.white,
//                     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
//                     shadows: [
//                       BoxShadow(
//                         color: Color(0x26000000),
//                         blurRadius: 25,
//                         offset: Offset(0, 1),
//                         spreadRadius: 0,
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//               Positioned(
//                 left: 29,
//                 top: 661,
//                 child: Container(
//                   width: 371,
//                   height: 88,
//                   decoration: ShapeDecoration(
//                     color: Colors.white,
//                     shape: RoundedRectangleBorder(
//                       side: BorderSide(
//                         width: 1,
//                         strokeAlign: BorderSide.strokeAlignOutside,
//                         color: Color(0xFFB8B8B8),
//                       ),
//                       borderRadius: BorderRadius.circular(5),
//                     ),
//                     shadows: [
//                       BoxShadow(
//                         color: Color(0x26000000),
//                         blurRadius: 25,
//                         offset: Offset(0, 1),
//                         spreadRadius: 0,
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//               Positioned(
//                 left: 46,
//                 top: 228,
//                 child: Text(
//                   'Bostanlı, Girne Blv No:7/A, 35590 Karşıyaka/İzmir',
//                   style: TextStyle(
//                     color: Color(0xFF0C0C0C),
//                     fontSize: 14,
//                     fontFamily: 'Gilroy',
//                     fontWeight: FontWeight.w500,
//                     height: 0,
//                   ),
//                 ),
//               ),
//               Positioned(
//                 left: 46,
//                 top: 381,
//                 child: Text(
//                   'Vali Rahmi Bey, Menderes Cd. No:85, 35380\nBuca/İzmir',
//                   style: TextStyle(
//                     color: Color(0xFF0C0C0C),
//                     fontSize: 14,
//                     fontFamily: 'Gilroy',
//                     fontWeight: FontWeight.w500,
//                     height: 0,
//                   ),
//                 ),
//               ),
//               Positioned(
//                 left: 46,
//                 top: 547,
//                 child: Text(
//                   'Vali Rahmi Bey Mahallesi 138 Sokak, Öğretmen\nEvleri Sokağı No: 28-30, 35380 Buca',
//                   style: TextStyle(
//                     color: Color(0xFF0C0C0C),
//                     fontSize: 14,
//                     fontFamily: 'Gilroy',
//                     fontWeight: FontWeight.w500,
//                     height: 0,
//                   ),
//                 ),
//               ),
//               Positioned(
//                 left: 46,
//                 top: 188,
//                 child: Text(
//                   'Merkez Ofis',
//                   style: TextStyle(
//                     color: Color(0xFF151515),
//                     fontSize: 16,
//                     fontFamily: 'Gilroy',
//                     fontWeight: FontWeight.w700,
//                     height: 0.08,
//                   ),
//                 ),
//               ),
//               Positioned(
//                 left: 46,
//                 top: 351,
//                 child: Text(
//                   'Ev',
//                   style: TextStyle(
//                     color: Color(0xFF151515),
//                     fontSize: 16,
//                     fontFamily: 'Gilroy',
//                     fontWeight: FontWeight.w700,
//                     height: 0.08,
//                   ),
//                 ),
//               ),
//               Positioned(
//                 left: 46,
//                 top: 515,
//                 child: Text(
//                   'Buca Şube',
//                   style: TextStyle(
//                     color: Color(0xFF151515),
//                     fontSize: 16,
//                     fontFamily: 'Gilroy',
//                     fontWeight: FontWeight.w700,
//                     height: 0.08,
//                   ),
//                 ),
//               ),
//               Positioned(
//                 left: 176,
//                 top: 698,
//                 child: Text(
//                   'Adres Ekle',
//                   style: TextStyle(
//                     color: Color(0xFF151515),
//                     fontSize: 16,
//                     fontFamily: 'Gilroy',
//                     fontWeight: FontWeight.w700,
//                     height: 0.08,
//                   ),
//                 ),
//               ),
//               Positioned(
//                 left: 320,
//                 top: 188,
//                 child: Text(
//                   'Düzenle',
//                   textAlign: TextAlign.right,
//                   style: TextStyle(
//                     color: Color(0xFF2355FF),
//                     fontSize: 14,
//                     fontFamily: 'Gilroy',
//                     fontWeight: FontWeight.w600,
//                     height: 0.10,
//                   ),
//                 ),
//               ),
//               Positioned(
//                 left: 320,
//                 top: 351,
//                 child: Text(
//                   'Düzenle',
//                   textAlign: TextAlign.right,
//                   style: TextStyle(
//                     color: Color(0xFF2355FF),
//                     fontSize: 14,
//                     fontFamily: 'Gilroy',
//                     fontWeight: FontWeight.w600,
//                     height: 0.10,
//                   ),
//                 ),
//               ),
//               Positioned(
//                 left: 320,
//                 top: 515,
//                 child: Text(
//                   'Düzenle',
//                   textAlign: TextAlign.right,
//                   style: TextStyle(
//                     color: Color(0xFF2355FF),
//                     fontSize: 14,
//                     fontFamily: 'Gilroy',
//                     fontWeight: FontWeight.w600,
//                     height: 0.10,
//                   ),
//                 ),
//               ),
//               Positioned(
//                 left: 70,
//                 top: 269,
//                 child: Text(
//                   ' Varsayılan fatura adresi olarak ayarla.',
//                   style: TextStyle(
//                     color: Color(0xFF0C0C0C),
//                     fontSize: 12,
//                     fontFamily: 'Gilroy',
//                     fontWeight: FontWeight.w500,
//                     height: 0,
//                   ),
//                 ),
//               ),
//               Positioned(
//                 left: 70,
//                 top: 432,
//                 child: Text(
//                   ' Varsayılan ödeme yöntemi olarak ayarla.',
//                   style: TextStyle(
//                     color: Color(0xFF0C0C0C),
//                     fontSize: 12,
//                     fontFamily: 'Gilroy',
//                     fontWeight: FontWeight.w500,
//                     height: 0,
//                   ),
//                 ),
//               ),
//               Positioned(
//                 left: 70,
//                 top: 596,
//                 child: Text(
//                   ' Varsayılan ödeme yöntemi olarak ayarla.',
//                   style: TextStyle(
//                     color: Color(0xFF0C0C0C),
//                     fontSize: 12,
//                     fontFamily: 'Gilroy',
//                     fontWeight: FontWeight.w500,
//                     height: 0,
//                   ),
//                 ),
//               ),
//               Positioned(
//                 left: 46,
//                 top: 264,
//                 child: Container(
//                   width: 20,
//                   height: 20,
//                   child: Stack(
//                     children: [
//                       Positioned(
//                         left: 0,
//                         top: 0,
//                         child: Container(
//                           width: 20,
//                           height: 20,
//                           decoration: ShapeDecoration(
//                             color: Color(0xFF2355FF),
//                             shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               Positioned(
//                 left: 46,
//                 top: 427,
//                 child: Container(
//                   width: 20,
//                   height: 20,
//                   decoration: ShapeDecoration(
//                     color: Color(0x002355FF),
//                     shape: RoundedRectangleBorder(
//                       side: BorderSide(width: 2, color: Color(0xFF2355FF)),
//                       borderRadius: BorderRadius.circular(4),
//                     ),
//                   ),
//                 ),
//               ),
//               Positioned(
//                 left: 46,
//                 top: 591,
//                 child: Container(
//                   width: 20,
//                   height: 20,
//                   decoration: ShapeDecoration(
//                     color: Color(0x002355FF),
//                     shape: RoundedRectangleBorder(
//                       side: BorderSide(width: 2, color: Color(0xFF2355FF)),
//                       borderRadius: BorderRadius.circular(4),
//                     ),
//                   ),
//                 ),
//               ),
//               Positioned(
//                 left: 31,
//                 top: 778,
//                 child: Container(
//                   width: 366,
//                   height: 49,
//                   decoration: ShapeDecoration(
//                     color: Color(0xFF2355FF),
//                     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
//                   ),
//                 ),
//               ),
//               Positioned(
//                 left: 182,
//                 top: 796,
//                 child: Text(
//                   'Kartlarım',
//                   textAlign: TextAlign.center,
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 16,
//                     fontFamily: 'Gilroy',
//                     fontWeight: FontWeight.w700,
//                     height: 0,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }