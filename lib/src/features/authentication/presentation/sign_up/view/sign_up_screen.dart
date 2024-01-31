import 'package:book_store/src/widgets/scaffolds/auth_scaffold.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatelessWidget {
  static const createAccountPageName = '/sign-up';


  const SignInScreen._({this.onAppbarBackButtonTap});

  final VoidCallback? onAppbarBackButtonTap;

  @override
  Widget build(BuildContext context) {
    return AuthScaffold(
      onBackPressed: onAppbarBackButtonTap,
      body: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height,
            maxWidth: MediaQuery.of(context).size.width,
          ),
          child: ,
        ),
      ),
    );
  }
}


