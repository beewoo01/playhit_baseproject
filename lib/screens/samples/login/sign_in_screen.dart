import 'package:flutter/material.dart';

class SignInScreen extends StatelessWidget {
  final void Function() onAction;

  const SignInScreen({
    super.key,
    required this.onAction,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "로그인 화면 입니다.",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              TextButton(
                onPressed: onAction,
                child: Text(
                  "Go Main Screen",
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
