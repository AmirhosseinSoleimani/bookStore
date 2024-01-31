import 'package:book_store/src/core/resources/assets_manager.dart';
import 'package:flutter/material.dart';

class AuthScaffold extends StatelessWidget {
  const AuthScaffold({super.key, this.body, this.onBackPressed});
  final Widget? body;
  final VoidCallback? onBackPressed;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            actions: [
              if(onBackPressed != null) IconButton(
                  onPressed: onBackPressed,
                  icon: const Icon(
                      IconManager.chevron,
                  ),
              ),
            ],
          ),
          extendBodyBehindAppBar: true,
          body: body,
        ),
    );
  }
}
