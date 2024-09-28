import 'package:flutter/material.dart';

void main() => runApp(const App());

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 垂直排列
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Logo
          Image.network(
            "https://tse2-mm.cn.bing.net/th/id/OIP-C.SF_aG_oJS2nwzVeRKn7R9AAAAA?w=196&h=196&c=7&r=0&o=5&dpr=1.5&pid=1.7",
            width: 100,
            height: 100,
          ),

          const SizedBox(height: 80,),

          // 用户名输入框
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 50, vertical: 25),
            child: TextField(
              decoration: InputDecoration(
                label: Text('账号'),
              ),
            ),
          ),

          // 密码输入框
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 50, vertical: 25),
            child: TextField(
              decoration: InputDecoration(
                label: Text('密码'),
              ),
            ),
          ),

          const SizedBox(height: 40,),

          // 登录按钮
          ElevatedButton(
            onPressed: () {},
            child: const Text('登录'),
          ),
        ],
      ),
    );
  }
}
