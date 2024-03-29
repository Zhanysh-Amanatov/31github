/*External dependencies */
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
/*Local dependencies */
import 'package:finik/screens/common/button_widget.dart';
import 'package:finik/screens/common/input_label_widget.dart';
import 'package:finik/screens/common/input_widget.dart';
import 'package:finik/screens/common/logo_header_description_widget.dart';

class ForgotPasswordView extends StatefulWidget {
  const ForgotPasswordView({super.key});

  @override
  State<ForgotPasswordView> createState() => _ForgotPasswordViewState();
}

class _ForgotPasswordViewState extends State<ForgotPasswordView> {
  final emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        color: Colors.black,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: SingleChildScrollView(
              child: Form(
            key: _formKey,
            child: Column(children: [
              LogoHeaderDescriptionWidget(
                header: 'Новый пароль',
                style: TextStyle(
                  fontSize: 32.sp,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'NeueMachina',
                  color: Colors.white70,
                ),
                height: 8.h,
              ),
              SizedBox(height: 32.h),
              const InputLabelWidget(inputLabel: 'Нам нужна только ваша почта'),
              SizedBox(height: 16.h),
              InputWidget(
                controller: emailController,
                inputType: TextInputType.emailAddress,
                hintText: 'Enter email',
                icon: const Icon(Icons.email),
              ),
              SizedBox(height: 350.h),
              ButtonWidget(
                btnText: 'Далее',
              )
            ]),
          )),
        ),
      ),
    );
  }
}
