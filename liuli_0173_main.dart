import 'package:flutter/material.dart';

// 刘丽 20231060173 — 创新实验第14周 Flutter 个性化修改
// 此文件为个人任务提交，不影响小组共享的 lib/main.dart

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // 修改1：AppBar 标题包含姓名和学号
      title: '刘丽 20231060173 - 创新实验',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
        ),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // 修改4：计数变量改为"已完成任务次数"，含义不再是点击次数
  int _completedTaskCount = 0;

  void _markTaskDone() {
    setState(() {
      _completedTaskCount++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // 修改1：AppBar 标题显示姓名 + 学号
        title: const Text(
          '刘丽 20231060173｜第14周 Flutter 任务',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // 修改2：页面中央说明文字体现第14周任务
            const Text(
              '📅 创新实验 第14周',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Flutter 个性化修改任务',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 32),
            const Text(
              '当前已完成的任务次数：',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 12),
            // 修改4：展示已完成任务次数
            Text(
              '$_completedTaskCount',
              style: Theme.of(context).textTheme.displayLarge?.copyWith(
                    color: Colors.deepPurple,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 20),
            Text(
              _completedTaskCount == 0
                  ? '还没有完成任何任务，加油！💪'
                  : '太棒了！已完成 $_completedTaskCount 个任务！🎉',
              style: const TextStyle(fontSize: 14, color: Colors.teal),
            ),
          ],
        ),
      ),
      // 修改3：右下角按钮文案改为"完成任务"，图标改为 check_circle
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _markTaskDone,
        tooltip: '标记完成一个任务',
        icon: const Icon(Icons.check_circle),
        label: const Text('完成任务'),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
    );
  }
}
