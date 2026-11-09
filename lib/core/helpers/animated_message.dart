import 'package:flutter/material.dart';


class AnimatedMessage {
  static void show(
    BuildContext context, {
    required String message,
    required Icon icon,
    required TextStyle? textStyle,
    Duration duration = const Duration(seconds: 3),
  }) {
    final overlay = Overlay.of(context, rootOverlay: true);

    late OverlayEntry entry;

    entry = OverlayEntry(
      builder: (context) => _AnimatedMessageView(
        message: message,
        icon: icon,
        messageStyle: textStyle,
        duration: duration,
        onDismiss: () {
          entry.remove();
        },
      ),
    );

    overlay.insert(entry);
  }
}

class _AnimatedMessageView extends StatefulWidget {
  final String message;
  final Icon icon;
  final TextStyle? messageStyle;
  final Duration duration;
  final VoidCallback onDismiss;

  const _AnimatedMessageView({
    required this.message,
    required this.duration,
    required this.onDismiss, required this.icon,  this.messageStyle,
  });

  @override
  State<_AnimatedMessageView> createState() => _AnimatedMessageViewState();
}

class _AnimatedMessageViewState extends State<_AnimatedMessageView>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 1),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic));

    _fadeAnimation = CurvedAnimation(parent: _controller, curve: Curves.easeIn);

    _startAnimation();
  }

  Future<void> _startAnimation() async {
    await _controller.forward();

    await Future.delayed(widget.duration);

    if (!mounted) return;

    await _controller.reverse();

    if (!mounted) return;

    widget.onDismiss();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
   
    return SafeArea(
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 20),
          child: SlideTransition(
            position: _slideAnimation,
            child: FadeTransition(
              opacity: _fadeAnimation,
              child: Material(
                color: const Color(0xFFE2EFEA),
      
                borderRadius: BorderRadius.circular(14),
                child: Container(
                  height: 50,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 14,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(
                      color: const Color(0xFFB5D4C9),
                      width: 1,
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [

                      widget.icon,

                      const SizedBox(width: 12),
                      Text(widget.message, style: widget.messageStyle),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
