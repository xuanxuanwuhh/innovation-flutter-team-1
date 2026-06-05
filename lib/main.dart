import 'package:flutter/material.dart';

void main() {
  runApp(const InnovationHelloApp());
}

class InnovationHelloApp extends StatelessWidget {
  const InnovationHelloApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '第1组 创新实验 Flutter 首页',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF0F766E),
          secondary: const Color(0xFFF59E0B),
        ),
        useMaterial3: true,
      ),
      home: const HelloHomePage(),
    );
  }
}

class HelloHomePage extends StatefulWidget {
  const HelloHomePage({super.key});

  @override
  State<HelloHomePage> createState() => _HelloHomePageState();
}

class _HelloHomePageState extends State<HelloHomePage> {
  int completedTasks = 0;

  String get progressText {
    if (completedTasks == 0) {
      return '准备开始第14周 Flutter 打卡';
    }
    if (completedTasks < 3) {
      return '继续加油，课堂任务正在推进';
    }
    return '今日目标已达成，可以截图提交';
  }

  void finishOneTask() {
    setState(() {
      completedTasks += 1;
    });
  }

  void resetTasks() {
    setState(() {
      completedTasks = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('第1组 创新实验 Flutter 首页'),
        backgroundColor: colorScheme.primaryContainer,
        foregroundColor: colorScheme.onPrimaryContainer,
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 520),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.rocket_launch,
                    size: 76,
                    color: colorScheme.primary,
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Hello Flutter，我们已经跑通第14周入门任务！',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    '第1组成员个性化展示 — 每人都有专属配色',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  const SizedBox(height: 24),
                  // ========== 小组成员信息卡片 ==========
                  Card(
                    elevation: 0,
                    color: colorScheme.secondaryContainer,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(18),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '👥 第1组成员（共5人）',
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 14),
                          // 成员1: 吴宣萱（组长）— 深青色
                          _MemberCard(
                            icon: Icons.star,
                            name: '吴宣萱（组长）',
                            studentId: '0024',
                            color: Color(0xFF0F766E),
                          ),
                          SizedBox(height: 10),
                          // 成员2: Mane — 玫红
                          _MemberCard(
                            icon: Icons.person,
                            name: 'Mane',
                            studentId: '0157',
                            color: Color(0xFFE11D48),
                          ),
                          SizedBox(height: 10),
                          // 成员3: 刘丽 — 紫色（个性化配色）
                          _MemberCard(
                            icon: Icons.star,
                            name: '刘丽',
                            studentId: '0173',
                            color: Color(0xFF7C3AED),
                          ),
                          SizedBox(height: 10),
                          // 成员4: 待补充
                          _MemberCard(
                            icon: Icons.person_outline,
                            name: '成员4（待补充）',
                            studentId: '????',
                            color: Color(0xFFF59E0B),
                          ),
                          SizedBox(height: 10),
                          // 成员5: 待补充
                          _MemberCard(
                            icon: Icons.person_outline,
                            name: '成员5（待补充）',
                            studentId: '????',
                            color: Color(0xFF3B82F6),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 18),
                  // ========== 任务打卡卡片 ==========
                  Card(
                    elevation: 0,
                    color: colorScheme.surfaceContainerHighest,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        children: [
                          const Text('已完成任务次数'),
                          const SizedBox(height: 8),
                          Text(
                            '$completedTasks',
                            style: Theme.of(context).textTheme.displayMedium
                                ?.copyWith(
                                  color: colorScheme.primary,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            progressText,
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 22),
                  Wrap(
                    alignment: WrapAlignment.center,
                    spacing: 12,
                    runSpacing: 12,
                    children: [
                      FilledButton.icon(
                        onPressed: finishOneTask,
                        icon: const Icon(Icons.check_circle),
                        label: const Text('完成一次打卡'),
                      ),
                      OutlinedButton.icon(
                        onPressed: resetTasks,
                        icon: const Icon(Icons.refresh),
                        label: const Text('重新开始'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: finishOneTask,
        icon: const Icon(Icons.add_task),
        label: const Text('任务 +1'),
      ),
    );
  }
}

/// 成员信息卡片组件 — 每人一行，带专属配色
class _MemberCard extends StatelessWidget {
  const _MemberCard({
    required this.icon,
    required this.name,
    required this.studentId,
    required this.color,
  });

  final IconData icon;
  final String name;
  final String studentId;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      decoration: BoxDecoration(
        border: Border(left: BorderSide(color: color, width: 4)),
        borderRadius: BorderRadius.circular(6),
        color: color.withOpacity(0.08),
      ),
      child: Row(
        children: [
          Icon(icon, size: 22, color: color),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 15,
                    color: color,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  '学号后四位：$studentId',
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.grey[700],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
