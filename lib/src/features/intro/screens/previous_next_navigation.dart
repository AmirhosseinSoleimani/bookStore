import 'package:book_store/src/app/app_export.dart';
import 'package:book_store/src/core/resources/assets_manager.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../core/logic/common/platform_info.dart';
import '../../../core/logic/keyboard/full_screen_keyboard_listener.dart';
import '../../../widgets/buttons/buttons.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class PreviousNextNavigation extends StatefulWidget {
  const PreviousNextNavigation({super.key, this.onPreviousPressed, this.onNextPressed, required this.child, this.listenToMouseWheel = true, this.maxWidth = 1000, this.previousBtnColor, this.nextBtnColor});

  final VoidCallback? onPreviousPressed;
  final VoidCallback? onNextPressed;
  final Widget child;
  final bool listenToMouseWheel;
  final double? maxWidth;
  final Color? previousBtnColor;
  final Color? nextBtnColor;

  @override
  State<PreviousNextNavigation> createState() => _PreviousNextNavigationState();
}

class _PreviousNextNavigationState extends State<PreviousNextNavigation> {
  DateTime _lastMouseScrollTime = DateTime.now();
  final int _scrollCoolDownMs = 300;

  bool _handleKeyDown(KeyDownEvent event) {
    if(event.logicalKey == LogicalKeyboardKey.arrowLeft && widget.onPreviousPressed != null) {
      widget.onPreviousPressed?.call();
      return true;
    }
    if(event.logicalKey == LogicalKeyboardKey.arrowRight && widget.onNextPressed != null) {
      widget.onNextPressed?.call();
      return true;
    }
    return false;
  }

  void _handleMouseScroll(event) {
    if (event is PointerScrollEvent) {
      if(DateTime.now().microsecondsSinceEpoch - _lastMouseScrollTime.microsecondsSinceEpoch < _scrollCoolDownMs) {
        return;
      }
      _lastMouseScrollTime = DateTime.now();
      if(event.scrollDelta.dy > 0 && widget.onPreviousPressed != null) {
        widget.onPreviousPressed!();
      }
      else if(event.scrollDelta.dy < 0 && widget.onNextPressed != null) {
        widget.onNextPressed!();
      }
    }
  }


  @override
  Widget build(BuildContext context) {
    if (PlatformInfo.isMobile) return widget.child;
    return Listener(
      onPointerSignal: widget.listenToMouseWheel ? _handleMouseScroll : null,
      child: FullScreenKeyboardListener(
        onKeyDown: _handleKeyDown,
        child: Stack(
          children: [
            widget.child,
            Center(
              child: SizedBox(
                width: widget.maxWidth ?? double.infinity,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: RegisterSingletons.$styles.insets.sm),
                  child: Row(
                    children: [
                      CircleIconButton(
                        icon: IconManager.previous,
                        onPressed: widget.onPreviousPressed,
                        semanticLabel: AppLocalizations.of(context).previous,
                        bgColor: widget.previousBtnColor,
                      ),
                      const Spacer(),
                      CircleIconButton(
                        icon: IconManager.next,
                        onPressed: widget.onNextPressed,
                        semanticLabel: AppLocalizations.of(context).next,
                        flipIcon: true,
                        bgColor: widget.nextBtnColor,
                      )
                    ],
                  ),
                ),
              ),
            )
        ],
      ),
      ),
    );
  }
}
