import 'package:flutter/material.dart';

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
                    onPressed: () {},
                    // 调节按钮内边距，让按钮看起来大一点
                    // 这里其实也可以将两个按钮提到函数里
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
                    onPressed: () {},
                    style: FilledButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        vertical: 16,
                        horizontal: 26,
                      ),
                    ),
                    child: const Text("登录"),
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
