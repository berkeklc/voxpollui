import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:voxpollui/product/constants/color_constants.dart';
import 'package:voxpollui/product/constants/font_constants.dart';

class BoardinIki extends StatefulWidget {
  const BoardinIki({super.key});

  @override
  State<BoardinIki> createState() => _BoardinIkiState();
}

class _BoardinIkiState extends State<BoardinIki> {
  bool onayliyorum = false;
  bool emailAlmak = false;
  final TextEditingController tel = TextEditingController();
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _focusNode.requestFocus();
    });
  }

  @override
  void dispose() {
    tel.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  Color getColor(Set<WidgetState> states) {
    const interactiveStates = <WidgetState>{
      WidgetState.pressed,
      WidgetState.hovered,
      WidgetState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return Colors.white;
    }
    return const Color.fromARGB(255, 35, 86, 255);
  }

  Color getColorForCheckBox(Set<WidgetState> states) {
    const interactiveStates = <WidgetState>{
      WidgetState.pressed,
      WidgetState.hovered,
      WidgetState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return Colors.white;
    }
    // return const Color.fromARGB(255, 35, 86, 255);
    return Colors.black;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: ColoredBox(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(0),
            height: MediaQuery.of(context).size.height + 0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 40, 0, 0),
                  child: Center(
                      child: Image.asset(
                    'assets/image/login.png',
                    height: 200,
                    width: 200,
                  )),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(35, 0, 0, 0),
                  child: Text(
                    'Telefon\nNumaranız',
                    style: TextStyle(
                      color: const Color(0xFF0C0C0C),
                      fontSize: 40,
                      fontFamily: FontConstants.gilroySemibold,
                      height: 0,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(35, 30, 0, 0),
                  child: SizedBox(
                    width: 332,
                    height: 48,
                    child: PhoneTextField(
                      controller: tel,
                      focusNode: _focusNode,
                      hintText: '555 123 45 67',
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(35, 20, 0, 0),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: CustomCheckbox(
                      isChecked: onayliyorum,
                      onChanged: (bool value) {
                        setState(() {
                          onayliyorum = value;
                        });
                      },
                      child: Text.rich(
                        TextSpan(
                          text: 'Aydınlatma Metni',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 13,
                            fontFamily: FontConstants.gilroyBold,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              /*
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: ((context) => const Kvkk())));
                                      */
                            },
                          children: [
                            TextSpan(
                              text: '’ni okudum, ',
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: FontConstants.gilroyLight,
                              ),
                            ),
                            TextSpan(
                              text: 'Açık Rıza Metni',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 13,
                                  fontFamily: FontConstants.gilroyBold),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  /*
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: ((context) =>
                                              const Kvkk())));
                                */
                                },
                            ),
                            TextSpan(
                              text: '’ni okudum ve onaylıyorum.',
                              style: TextStyle(
                                color: const Color(0xFF0C0C0C),
                                fontFamily: FontConstants.gilroyLight,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(35, 20, 0, 0),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: CustomCheckbox(
                      isChecked: emailAlmak,
                      onChanged: (bool value) {
                        setState(() {
                          emailAlmak = value;
                        });
                      },
                      child: Text.rich(
                        TextSpan(
                          text: 'Açık Rıza Metni ve ',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 13,
                            fontFamily: FontConstants.gilroyLight,
                          ),
                          children: [
                            TextSpan(
                              text: 'Ticari Elektronik İleti Aydınlatma Metni ',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: FontConstants.gilroyBold),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  /*
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: ((context) =>
                                              const Kvkk())));
                                              */
                                },
                            ),
                            TextSpan(
                              text:
                                  'Kapsamında SMS, e-posta ve arama almak istiyorum.',
                              style: TextStyle(
                                color: const Color(0xFF0C0C0C),
                                fontSize: 13,
                                fontFamily: FontConstants.gilroyLight,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                const Spacer(),
                Column(children: [
                  GestureDetector(
                    onTap: () {
                      /*
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Kvkk()),
                      );
                      */
                    },
                    child: SizedBox(
                      width: 333,
                      child: Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: 'İleri butonuna basarak ',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                                fontFamily: FontConstants.gilroyLight,
                              ),
                            ),
                            TextSpan(
                              text: 'Kullanıcı Sözleşmesi',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                                fontFamily: FontConstants.gilroyBold,
                              ),
                            ),
                            TextSpan(
                              text: '’ni kabul etmiş olursunuz.',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                                fontFamily: FontConstants.gilroyLight,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      if (onayliyorum && emailAlmak) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Container()),
                        );
                      } else {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return Dialog(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              elevation: 10,
                              backgroundColor: Colors.white,
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    const Text(
                                      'Dikkat',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 22.0,
                                        color: Colors.black,
                                      ),
                                    ),
                                    const SizedBox(height: 20),
                                    Text(
                                      'Rıza Metinleri Kabul Edilmelidir',
                                      style: TextStyle(
                                        fontSize: 16.0,
                                        color: Colors.grey[700],
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                    const SizedBox(height: 20),
                                    Divider(
                                      color: Colors.grey[300],
                                    ),
                                    Align(
                                      alignment: Alignment.centerRight,
                                      child: TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        style: TextButton.styleFrom(
                                          backgroundColor: AppColor.primary,
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 16.0, vertical: 10.0),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                        ),
                                        child: const Text(
                                          'Tamam',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      }
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
                      child: Center(
                        child: Text(
                          'İleri',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontFamily: FontConstants.gilroyMedium,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  ),
                ]),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class PhoneTextField extends StatelessWidget {
  const PhoneTextField({
    super.key,
    required this.controller,
    this.focusNode,
    this.hintText = '555 123 45 67',
  });
  final TextEditingController controller;
  final FocusNode? focusNode;
  final String hintText;

  // Custom formatter for phone number
  static final _phoneNumberFormatter = PhoneNumberFormatter();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 332,
      height: 48,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: TextField(
          inputFormatters: [
            LengthLimitingTextInputFormatter(13),
            FilteringTextInputFormatter.digitsOnly,
            _phoneNumberFormatter,
          ],
          keyboardType: TextInputType.phone,
          controller: controller,
          focusNode: focusNode,
          decoration: InputDecoration(
            hintText: hintText,
            prefix: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: '+90 ',
                    style: TextStyle(
                      fontFamily: FontConstants.gilroySemibold,
                      color: Colors.black,
                      fontSize: 28,
                    ),
                  ),
                ],
              ),
            ),
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(width: 1.0),
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(width: 1.0),
            ),
            border: InputBorder.none,
            hintStyle: TextStyle(
              color: Colors.black,
              fontSize: 28,
              fontFamily: FontConstants.gilroyLight,
              fontWeight: FontWeight.w400,
            ),
          ),
          style: TextStyle(
            color: Colors.black,
            fontSize: 28,
            fontFamily: FontConstants.gilroyLight,
            fontWeight: FontWeight.w400,
          ),
          cursorColor: Colors.blue,
        ),
      ),
    );
  }
}

class PhoneNumberFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final digitsOnly = newValue.text.replaceAll(RegExp(r'[^\d]'), '');
    final formattedText = _formatAsPhoneNumber(digitsOnly);
    return TextEditingValue(
      text: formattedText,
      selection: TextSelection.collapsed(offset: formattedText.length),
    );
  }

  String _formatAsPhoneNumber(String digits) {
    // Creating phone number format
    if (digits.length <= 3) {
      return digits;
    } else if (digits.length <= 6) {
      return '${digits.substring(0, 3)} ${digits.substring(3)}';
    } else if (digits.length <= 8) {
      return '${digits.substring(0, 3)} ${digits.substring(3, 6)} ${digits.substring(6)}';
    } else {
      return '${digits.substring(0, 3)} ${digits.substring(3, 6)} ${digits.substring(6, 8)} ${digits.substring(8, 10)}';
    }
  }
}

// ignore: must_be_immutable
class CustomCheckbox extends StatefulWidget {
  CustomCheckbox({
    required this.child,
    required this.isChecked,
    super.key,
    this.onChanged,
  });
  Widget child;
  bool isChecked = false;
  final ValueChanged<bool>? onChanged;

  @override
  State<CustomCheckbox> createState() => _CustomCheckboxState();
}

class _CustomCheckboxState extends State<CustomCheckbox>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _sizeAnimation;
  late Animation<Color?> _colorAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    _sizeAnimation =
        Tween<double>(begin: 20.0, end: 21.0).animate(_animationController);
    _colorAnimation = ColorTween(begin: Colors.transparent, end: Colors.white)
        .animate(_animationController);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _toggleCheckbox() {
    setState(() {
      widget.isChecked = !widget.isChecked;
      if (widget.isChecked) {
        _animationController.forward();
      } else {
        _animationController.reverse();
      }
      if (widget.onChanged != null) {
        widget.onChanged!(widget.isChecked);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _toggleCheckbox, // Hem checkbox hem de metin için tıklama işlevi
      child: Row(
        children: [
          AnimatedBuilder(
            animation: _animationController,
            builder: (context, child) {
              return Container(
                width: _sizeAnimation.value,
                height: _sizeAnimation.value,
                decoration: BoxDecoration(
                  color: widget.isChecked
                      ? const Color.fromARGB(255, 35, 86, 255)
                      : Colors.transparent,
                  borderRadius: widget.isChecked
                      ? BorderRadius.circular(4.0)
                      : BorderRadius.circular(0.0),
                  border: Border.all(
                    color: widget.isChecked
                        ? const Color.fromARGB(255, 35, 86, 255)
                        : Colors.black,
                    width: 0.9,
                  ),
                ),
                child: Center(
                  child: Icon(
                    Icons.check,
                    color: _colorAnimation.value,
                    size: 16,
                  ),
                ),
              );
            },
          ),
          const SizedBox(width: 8),
          Expanded(
            child: widget.child,
          ),
        ],
      ),
    );
  }
}
