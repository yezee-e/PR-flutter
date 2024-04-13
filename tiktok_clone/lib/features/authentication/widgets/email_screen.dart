import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/authentication/widgets/form_button.dart';
import 'package:tiktok_clone/features/authentication/widgets/password_screen.dart';

class EmailScreen extends StatefulWidget {
  const EmailScreen({super.key});

  @override
  State<EmailScreen> createState() => _EmailScreenState();
}

class _EmailScreenState extends State<EmailScreen> {
  final TextEditingController _EmailController = TextEditingController();

  String _Email = "";

  @override
  void initState() {
    super.initState();
    _EmailController.addListener(() {
      setState(() {
        _Email = _EmailController.text;
      });
    });
  }

  @override
  void dispose() {
    _EmailController.dispose();
    super.dispose();
  }

  String? _isEmailValid() {
    if (_Email.isEmpty) return null;
    final regExp = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
    ); // 옳바른 이메일구조를 만족해야 next로 넘어감
    if (!regExp.hasMatch(_Email)) {
      return "Email not valid";
    }
    return null;
  }

  void _onScaffoldTap() {
    //focus 된걸 전부 unfocus 시키는 api를 제공
    FocusScope.of(context).unfocus();
  }

  void _onSubmit() {
    if (_Email.isEmpty || _isEmailValid() != null) return;
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => const PasswordScreen(),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onScaffoldTap,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Sign up",
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Sizes.size36),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gaps.v40,
              const Text(
                "What is your email",
                style: TextStyle(
                  fontSize: Sizes.size24,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Gaps.v16,
              TextField(
                controller: _EmailController,
                keyboardType: TextInputType.emailAddress, //키보드 타입지정
                autocorrect: false, //키보드 자동맞춤법
                onEditingComplete: _onSubmit, //키보드 done클릭시, 이동
                cursorColor: Theme.of(context).primaryColor,
                decoration: InputDecoration(
                  hintText: "Email",
                  errorText: _isEmailValid(),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey.shade400,
                    ),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey.shade400,
                    ),
                  ),
                ),
              ),
              Gaps.v16,
              GestureDetector(
                onTap: _onSubmit,
                child: FormButton(
                    disabled: _Email.isEmpty || _isEmailValid() != null),
              ) //값이 없거나 유효한 이메일이 아닐경우 활성x
            ],
          ),
        ),
      ),
    );
  }
}
