import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/constants_utils.dart';
import '../../controllers/more/change_password_page_controller.dart';

class ChangePasswordPage extends GetView<ChangePasswordPageController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 60,
                color: Color(0xFF262261),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: Image.asset(
                          "assets/images/back@2x.png",
                          height: 20,
                          width: 20,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        "Change Password",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontFamily: "Comfortaa-Bold"),
                      ),
                    )
                  ],
                ),
              ),
              Form(
                key: controller.registerKey,
                autovalidateMode: AutovalidateMode.always,
                child: _getBody(),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _getBody() => Padding(
        padding: EdgeInsets.only(left: 10.0, right: 10.0),
        child: Column(
          children: <Widget>[
            _getCurrentPasswordTextField(),
            _getPasswordTextField(),
            _getPasswordValidationField(),
            _getConfirmPasswordTextField(),
            _getChangePasswordButton(),
          ],
        ),
      );

  Widget _getPasswordTextField() {
    return Container(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 10),
      child: Obx(
        () => TextFormField(
          textInputAction: TextInputAction.next,
          style: const TextStyle(
              fontSize: 20.0,
              color: Color(0xFF262261),
              fontFamily: "Comfortaa-Medium"),
          decoration: InputDecoration(
            labelText: "New Password",
            labelStyle: ConstantUtils.styleTextStyleTextField(),
            errorStyle: ConstantUtils.styleTextStyleErrorTextField(),
            suffixIcon: IconButton(
              icon: Icon(
                controller.passwordVisible.value
                    ? Icons.visibility_off
                    : Icons.visibility,
                color: Color(0xFF262261),
              ),
              onPressed: () {
                controller.isPasswordToggle();
              },
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xFFFFB451), width: 2),
            ),
          ),
          onChanged: (password) {
            controller.password = password;
            controller.onChangePassword(password);
          },
          obscureText: controller.passwordVisible.value,
          controller: controller.passwordController,
          validator: (value) {
            return controller.validatePassword(value!);
          },
          onSaved: (value) {
            controller.password = value!;
          },
        ),
      ),
    );
  }

  Widget _getPasswordValidationField() {
    return Obx(
      () => Column(
        children: [
          const SizedBox(
            height: 5,
          ),
          _rowPasswordField("contains at least 8 characters",
              controller.isPasswordEightDigit.value),
          _rowPasswordField("contains both lowercase and uppercase letters",
              controller.isPasswordUpperAndLower.value),
          _rowPasswordField("contains at least one number (0-9) or a symbol",
              controller.isPasswordOneNumberSymbol.value),
          _rowPasswordField("does not contain your email address",
              controller.isPasswordNotEmail.value),
        ],
      ),
    );
  }

  Widget _rowPasswordField(String label, bool passwordValidation) {
    return Row(
      children: [
        const SizedBox(
          width: 20,
        ),
        passwordValidation
            ? const SizedBox(
                height: 20,
                width: 20,
                child: Icon(
                  Icons.check,
                  color: Colors.green,
                  size: 20,
                ),
              )
            : const SizedBox(
                height: 20,
                width: 20,
                child: Icon(
                  Icons.circle,
                  color: Colors.black,
                  size: 7,
                ),
              ),
        const SizedBox(
          width: 5,
        ),
        Text(
          label,
          style: ConstantUtils.styleTextStylePasswordTextField(),
        )
      ],
    );
  }

  Widget _getCurrentPasswordTextField() {
    return Container(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 10),
      child: Obx(
        () => TextFormField(
          style: const TextStyle(
              fontSize: 20.0,
              color: Color(0xFF262261),
              fontFamily: "Comfortaa-Medium"),
          textInputAction: TextInputAction.done,
          decoration: InputDecoration(
            labelText: "Current Password",
            labelStyle: ConstantUtils.styleTextStyleTextField(),
            errorStyle: ConstantUtils.styleTextStyleErrorTextField(),
            suffixIcon: IconButton(
              icon: Icon(
                controller.currentPasswordVisible.value
                    ? Icons.visibility_off
                    : Icons.visibility,
                color: Color(0xFF262261),
              ),
              onPressed: () {
                controller.isCurrentPasswordToggle();
              },
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xFFFFB451), width: 2),
            ),
          ),
          obscureText: controller.currentPasswordVisible.value,
          controller: controller.currentPasswordController,
          validator: (value) {
            return controller.validateConfirmPassword(value!);
          },
          onSaved: (value) {
            controller.currentPassword = value!;
          },
          onChanged: (value) {
            controller.currentPassword = value;
          },
        ),
      ),
    );
  }

  Widget _getConfirmPasswordTextField() {
    return Container(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 10),
      child: Obx(
        () => TextFormField(
          style: const TextStyle(
              fontSize: 20.0,
              color: Color(0xFF262261),
              fontFamily: "Comfortaa-Medium"),
          textInputAction: TextInputAction.done,
          decoration: InputDecoration(
            labelText: "Confirmed Password",
            labelStyle: ConstantUtils.styleTextStyleTextField(),
            errorStyle: ConstantUtils.styleTextStyleErrorTextField(),
            suffixIcon: IconButton(
              icon: Icon(
                controller.confirmPasswordVisible.value
                    ? Icons.visibility_off
                    : Icons.visibility,
                color: Color(0xFF262261),
              ),
              onPressed: () {
                controller.isConfirmPasswordToggle();
              },
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xFFFFB451), width: 2),
            ),
          ),
          obscureText: controller.confirmPasswordVisible.value,
          controller: controller.confirmPasswordController,
          validator: (value) {
            return controller.validateConfirmPassword(value!);
          },
          onSaved: (value) {
            controller.confirmPassword = value!;
          },
          onChanged: (value) {
            controller.confirmPassword = value;
          },
        ),
      ),
    );
  }

  Widget _getChangePasswordButton() {
    return Container(
      width: double.infinity,
      height: 50,
      margin: const EdgeInsets.only(left: 20, right: 20, bottom: 10, top: 10),
      child: RaisedButton(
        color: Color(0xFFF05A28),
        textColor: Colors.white,
        elevation: 1.0,
        onPressed: () {},
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(7.5),
        ),
        child: Text(
          "Change Password",
          style: TextStyle(fontSize: 18.0, fontFamily: "Comfortaa-Bold"),
        ),
      ),
    );
  }
}
