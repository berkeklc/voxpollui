import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:voxpollui/features/authentication/view/boardin_dort.dart';
import 'package:voxpollui/product/constants/color_constants.dart';
import 'package:voxpollui/product/constants/font_constants.dart';

class BoardinUc extends StatefulWidget {
  const BoardinUc({super.key});

  @override
  State<BoardinUc> createState() => _BoardinUcState();
}

class _BoardinUcState extends State<BoardinUc> {
  final List<TextEditingController> _controllers =
      List.generate(6, (index) => TextEditingController());
  final List<FocusNode> _focusNodes = List.generate(6, (index) => FocusNode());

  @override
  void dispose() {
    for (final controller in _controllers) {
      controller.dispose();
    }
    for (final focusNode in _focusNodes) {
      focusNode.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(25, 5, 5, 15),
                  child: Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Onay Kodu',
                        style: TextStyle(
                          color: const Color(0xFF0C0C0C),
                          fontSize: 40,
                          fontFamily: FontConstants.gilroyMedium,
                          height: 0,
                        ),
                      )),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(6, (index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: SizedBox(
                        width: 50,
                        height: 50,
                        child: TextField(
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                          controller: _controllers[index],
                          focusNode: _focusNodes[index],
                          maxLength: 1,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 24,
                            fontFamily: FontConstants.gilroyLight,
                          ),
                          cursorColor: AppColor.primary,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(
                              gapPadding: 10,
                              borderRadius: BorderRadius.zero,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.zero,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.zero,
                            ),
                            counterText: '',
                          ),
                          onChanged: (value) {
                            if (value.isNotEmpty &&
                                index < _controllers.length - 1) {
                              FocusScope.of(context)
                                  .requestFocus(_focusNodes[index + 1]);
                            } else if (value.isEmpty && index > 0) {
                              FocusScope.of(context)
                                  .requestFocus(_focusNodes[index - 1]);
                            }
                          },
                          keyboardType: TextInputType.number,
                          textInputAction: TextInputAction.next,
                        ),
                      ),
                    );
                  }),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text.rich(
                      style: const TextStyle(
                        fontSize: 11,
                      ),
                      TextSpan(
                        text:
                            ' Lütfen cep telefonunuza gelen 4 haneli kodu girin. Eğer SMS gelmediyse tekrar göndermek için',
                        style: TextStyle(
                          fontFamily: FontConstants.gilroyLight,
                        ),
                        children: [
                          TextSpan(
                            text: ' buraya',
                            style: TextStyle(
                              color: const Color(0xFF0C0C0C),
                              fontFamily: FontConstants.gilroyMedium,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                            text: ' tıklayın',
                            style: TextStyle(
                              color: const Color(0xFF0C0C0C),
                              fontFamily: FontConstants.gilroyLight,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            alignment: Alignment.bottomCenter,
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const BoardinDort()),
                );
              },
              child: Container(
                alignment: Alignment.bottomCenter,
                width: double.infinity,
                height: 49,
                margin: const EdgeInsets.all(31),
                decoration: ShapeDecoration(
                  color: const Color(0xFF2355FF),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                child: const Center(
                  child: Text(
                    'İleri',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontFamily: 'Gilroy',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
