import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomCheckbox extends StatefulWidget {
  Widget? child;
  bool isChecked = false;
  final ValueChanged<bool>? onChanged; // Yeni onChanged parametresi
  CustomCheckbox({
    super.key,
    this.child,
    required this.isChecked,
    this.onChanged,
  });

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
    _colorAnimation = ColorTween(begin: Colors.black, end: Colors.white)
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
        widget.onChanged!(
            widget.isChecked); // Checkbox durumunu dışarıya bildirin
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: _toggleCheckbox,
          child: AnimatedBuilder(
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
        ),
        const SizedBox(width: 8),
        Expanded(
          child: GestureDetector(
            onTap: _toggleCheckbox,
            child: widget.child,
          ),
        ),
      ],
    );
  }
}
