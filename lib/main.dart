import 'package:flutter/material.dart';

// ============================================================
// 第1组 创新实验 Flutter 小组项目
// 修改者：刘丽（学号20231060173，后四位0173）
//
// 【修改说明】
// 1. 在原始 Mane 清新绿色风格基础上优化
// 2. 保留原有 AppBar、FAB 打卡按钮的整体布局
// 3. 5位成员平等展示，每人一张名片卡片，无主次之分
// 4. 配色保持清新绿色系（emerald），成员各有浅色区分
// ============================================================

void main() {
  runApp(const FreshHelloApp());
}

class FreshHelloApp extends StatelessWidget {
  const FreshHelloApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '创新实验 Flutter 首页',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF10B981),
          brightness: Brightness.light,
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
  int _checkCount = 0;

  void _incrementCheck() {
    setState(() {
      _checkCount++;
    });
  }

  void _resetCheck() {
    setState(() {
      _checkCount = 0;
    });
  }

  String get _checkMessage {
    if (_checkCount == 0) return '点击右下角按钮开始打卡 🌿';
    if (_checkCount < 5) return '已完成 $_checkCount 次打卡，继续加油！💪';
    if (_checkCount < 10) return '太棒了！已打卡 $_checkCount 次 🔥';
    return '打卡达人！已累计 $_checkCount 次 ✨';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5FBF8),
      appBar: AppBar(
        title: const Text('创新实验 Flutter 首页'),
        centerTitle: true,
        backgroundColor: const Color(0xFF10B981),
        foregroundColor: Colors.white,
        elevation: 0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(16),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ===== 标题区 =====
            const SizedBox(height: 10),
            const Text(
              '🌿 Hello Flutter',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1A1A2E),
              ),
            ),
            const SizedBox(height: 6),
            const Text(
              '我们已完成第14周 Flutter 入门任务',
              style: TextStyle(
                fontSize: 16,
                color: Color(0xFF666666),
              ),
            ),
            const SizedBox(height: 24),

            // ===== 小组信息卡片 =====
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF10B981), Color(0xFF34D399)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF10B981).withValues(alpha: 0.3),
                    blurRadius: 16,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
              child: Column(
                children: [
                  _infoRow(Icons.group, '小组', '第1组'),
                  const SizedBox(height: 10),
                  _infoRow(Icons.people, '成员',
                      '吴宣萱、刘丽、李娅、马蝶、雷雅倩'),
                  const SizedBox(height: 10),
                  _infoRow(Icons.check_circle_outline, '打卡次数', '$_checkCount 次'),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // ===== 成员卡片列表 =====
            const Text(
              '👥 小组成员',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1A1A2E),
              ),
            ),
            const SizedBox(height: 12),
            _memberTile(
              name: '吴宣萱',
              id: '****0024',
              role: '组长',
              color: const Color(0xFF10B981),
              icon: Icons.star,
            ),
            const SizedBox(height: 8),
            _memberTile(
              name: '刘丽',
              id: '****0173',
              role: '成员',
              color: const Color(0xFF06B6D4),
              icon: Icons.person,
            ),
            const SizedBox(height: 8),
            _memberTile(
              name: '李娅',
              id: '****????',
              role: '成员',
              color: const Color(0xFF8B5CF6),
              icon: Icons.person,
            ),
            const SizedBox(height: 8),
            _memberTile(
              name: '马蝶',
              id: '****????',
              role: '成员',
              color: const Color(0xFFF59E0B),
              icon: Icons.person,
            ),
            const SizedBox(height: 8),
            _memberTile(
              name: '雷雅倩',
              id: '****????',
              role: '成员',
              color: const Color(0xFFEC4899),
              icon: Icons.person,
            ),
            const SizedBox(height: 32),

            // ===== 打卡状态区 =====
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: const Color(0xFF10B981).withValues(alpha: 0.2),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.05),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                children: [
                  const Icon(Icons.emoji_events,
                      color: Color(0xFF10B981), size: 36),
                  const SizedBox(height: 8),
                  Text(
                    _checkMessage,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 15,
                      color: Color(0xFF444444),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 80),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton.small(
            heroTag: 'reset',
            onPressed: _resetCheck,
            backgroundColor: Colors.white,
            foregroundColor: const Color(0xFF10B981),
            elevation: 2,
            child: const Icon(Icons.refresh),
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            heroTag: 'check',
            onPressed: _incrementCheck,
            backgroundColor: const Color(0xFF10B981),
            child: const Icon(Icons.check, size: 28),
          ),
        ],
      ),
    );
  }

  Widget _infoRow(IconData icon, String label, String value) {
    return Row(
      children: [
        Icon(icon, color: const Color(0xFFE8FFF5), size: 20),
        const SizedBox(width: 10),
        Text(
          '$label：',
          style: const TextStyle(
            fontSize: 14,
            color: Color(0xFFD1FAE5),
          ),
        ),
        Expanded(
          child: Text(
            value,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }

  Widget _memberTile({
    required String name,
    required String id,
    required String role,
    required Color color,
    required IconData icon,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        child: Row(
          children: [
            Container(
              width: 42,
              height: 42,
              decoration: BoxDecoration(
                color: color.withValues(alpha: 0.12),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: color, size: 22),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        name,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF1A1A2E),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          color: color.withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          role,
                          style: TextStyle(
                            fontSize: 11,
                            color: color,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 2),
                  Text(
                    id,
                    style: const TextStyle(
                      fontSize: 13,
                      color: Color(0xFF999999),
                    ),
                  ),
                ],
              ),
            ),
            const Icon(Icons.chevron_right,
                color: Color(0xFFCCCCCC), size: 20),
          ],
        ),
      ),
    );
  }
}
