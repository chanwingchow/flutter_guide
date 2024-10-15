import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

/// 登录页
class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    // 姓名
    final nameController = TextEditingController();
    // 学号
    final idController = TextEditingController();
    // 密码
    final pwdController = TextEditingController();

    // 已注册用户
    final List<User> users = [];

    return Scaffold(
      body: Stack(
        children: [
          // 背景图
          Image.asset(
            "assets/images/background.jpg",
            width: size.width,
            height: size.height,
            fit: BoxFit.cover,
          ),

          // 透明层
          Container(color: Colors.black.withOpacity(0.3)),

          // 内容
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // 姓名输入框
              _textField(
                hintText: "姓名",
                prefixIcon: Icons.person_outline,
                controller: nameController,
              ),

              // 学号输入框
              _textField(
                hintText: "学号",
                prefixIcon: Icons.numbers,
                controller: idController,
              ),

              // 密码输入框
              _textField(
                hintText: "密码",
                prefixIcon: Icons.lock_outline,
                controller: pwdController,
                obscureText: true,
              ),

              // 垂直空白间距
              const SizedBox(height: 40),

              // 按钮
              Row(
                // 水平方向居中
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // 取消按钮
                  FilledButton(
                    onPressed: () {
                      // 加一个返回功能
                      Navigator.pop(context);
                    },
                    style: FilledButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        vertical: 16,
                        horizontal: 26,
                      ),
                    ),
                    child: const Text("取消"),
                  ),

                  // 水平空白间距
                  const SizedBox(width: 30),

                  // 登录按钮
                  FilledButton(
                    onPressed: () {
                      if (nameController.text.isEmpty) {
                        Fluttertoast.showToast(msg: "姓名不能为空");
                        return;
                      } else if (!RegExp(r"^\d{11}$")
                          .hasMatch(idController.text)) {
                        Fluttertoast.showToast(msg: "学号是 11 位数字");
                        return;
                      } else if (pwdController.text.isEmpty) {
                        Fluttertoast.showToast(msg: "密码不能为空");
                        return;
                      }

                      // 检查用户是否已经注册
                      for (var user in users) {
                        // 找到注册用户
                        if (user.id == int.parse(idController.text)) {
                          if (user.name != nameController.text) {
                            // 用户已经注册
                            Fluttertoast.showToast(msg: "姓名错误");
                            return;
                          } else if (user.pwd != pwdController.text) {
                            // 用户已经注册
                            Fluttertoast.showToast(msg: "密码错误");
                            return;
                          } else {
                            Fluttertoast.showToast(msg: "登录成功");
                            Navigator.pop(context);
                            return;
                          }
                        }
                      }

                      Fluttertoast.showToast(msg: "该用户未注册");
                    },
                    style: FilledButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        vertical: 16,
                        horizontal: 26,
                      ),
                    ),
                    child: const Text("登录"),
                  ),

                  // 水平空白间距
                  const SizedBox(width: 30),

                  // 注册按钮
                  FilledButton(
                    onPressed: () {
                      if (nameController.text.isEmpty) {
                        Fluttertoast.showToast(msg: "姓名不能为空");
                        return;
                      } else if (!RegExp(r"^\d{11}$")
                          .hasMatch(idController.text)) {
                        Fluttertoast.showToast(msg: "学号是 11 位数字");
                        return;
                      } else if (pwdController.text.isEmpty) {
                        Fluttertoast.showToast(msg: "密码不能为空");
                        return;
                      }

                      final id = int.parse(idController.text);
                      // 检查用户是否已经注册
                      for (var user in users) {
                        if (user.id == id) {
                          // 用户已经注册
                          Fluttertoast.showToast(msg: "该用户已经注册过了");
                          return;
                        }
                      }

                      // 注册用户
                      users.add(
                        User(
                          id: id,
                          name: nameController.text,
                          pwd: pwdController.text,
                        ),
                      );
                      Fluttertoast.showToast(msg: "注册成功");
                    },
                    style: FilledButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        vertical: 16,
                        horizontal: 26,
                      ),
                    ),
                    child: const Text("注册"),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  /// 白边圆角带图标输入框
  Widget _textField({
    required String hintText,
    required IconData prefixIcon,
    required TextEditingController controller,
    bool obscureText = false,
  }) {
    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: const BorderSide(color: Colors.white),
    );

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 50),
      child: TextField(
        obscureText: obscureText,
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText,
          prefixIcon: Icon(prefixIcon),
          filled: true,
          border: border,
          enabledBorder: border,
        ),
      ),
    );
  }
}

/// 用户数据类
class User {
  final int id;
  String name;
  String pwd;

  User({required this.id, required this.name, required this.pwd});
}
