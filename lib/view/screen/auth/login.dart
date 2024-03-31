// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_project/controller/auth/login_controller.dart';
import 'package:my_project/core/constant/color.dart';
import 'package:my_project/core/functions/alertexitapp.dart';
import 'package:my_project/core/functions/validinput.dart';
import 'package:my_project/view/widget/auth/custombuttonauth.dart';
import 'package:my_project/view/widget/auth/customtextbodyauth.dart';
import 'package:my_project/view/widget/auth/customtextformauth.dart';
import 'package:my_project/view/widget/auth/customtexttitleauth.dart';
import 'package:my_project/view/widget/auth/logoauth.dart';
import 'package:my_project/view/widget/auth/textsignup.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LoginControllerImp controller = Get.put(LoginControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColor.backgroundcolor,
        elevation: 0.0,
        title: Text("15".tr,
            style: Theme.of(context)
                .textTheme
                .headline1!
                .copyWith(color: AppColor.grey)),
      ),
      body: WillPopScope(
        onWillPop: alertExitApp,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
          child: Form(
            key: controller.formstate,
            child: ListView(children: [
              const LogoAuth(),
              const SizedBox(height: 20),
              CustomTextTitleAuth(text: "10".tr),
              const SizedBox(height: 10),
              CustomTextBodyAuth(text: "11".tr),
              const SizedBox(height: 15),
              CustonTextFormAuth(
                isNumber: false,

                valid: (val) {
                  return validInput(val!, 5, 100, "email");
                },
                mycontroller: controller.email,
                hinttext: "12".tr,
                iconData: Icons.email_outlined,
                labeltext: "18".tr,
                // mycontroller: ,
              ),
              GetBuilder<LoginControllerImp>(
                builder:(controller)=> CustonTextFormAuth(
                
                        obscureText: controller.isshowpassword,
                    onTapIcon: () {
                      controller.showPassword();
                    },
                  isNumber: false,
                  valid: (val) {
                    return validInput(val!, 5, 30, "password");
                  },
                  mycontroller: controller.password,
                  hinttext: "13".tr,
                  iconData: Icons.lock_outline,
                  labeltext: "19".tr,
                  // mycontroller: ,
                ),
              ),
              InkWell(
                onTap: () {
                  controller.goToForgetPassword();
                },
                child: Text(
                  "14".tr,
                  textAlign: TextAlign.right,
                ),
              ),
              CustomButtomAuth(
                  text: "15".tr,
                  onPressed: () {
                    controller.login();
                  }),
              const SizedBox(height: 40),
              CustomTextSignUpOrSignIn(
                textone: "16".tr,
                texttwo: "17".tr,
                onTap: () {
                  controller.goToSignUp();
                },
              )
            ]),
          ),
        ),
      ),
    );
  }
}
