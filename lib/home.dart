import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Home extends StatelessWidget {
  final bool isDark;
  final VoidCallback onThemeToggle;

  const Home({Key? key, required this.isDark, required this.onThemeToggle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mobile Tips and Tricks'),
      ),
      drawer: Drawer(
        child: Column(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Theme.of(context).primaryColor),
              child: const Text(
                'Menu',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            ListTile(
              title: const Text('Dark Mode'),
              trailing: CupertinoSwitch(
                value: isDark,
                onChanged: (value) => onThemeToggle(),
                activeColor: Colors.green,
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Let's Test your",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const Text(
              "Mobile step by step.",
              style: TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Simulate download action
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content: Text('Download started (simulated)')),
                  );
                },
                child: const Text('Download Now'),
              ),
            ),
            const SizedBox(height: 30),
            const Text(
              'Categories',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            _buildCategoryItem(
              context,
              'Flutter',
              '📚 11 Lectures',
              () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const FlutterPage()),
              ),
            ),
            _buildCategoryItem(
              context,
              'Dart and OOP',
              '📚 37 Lectures',
              () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const DartPage()),
              ),
            ),
            _buildCategoryItem(
              context,
              'Interview Question',
              '📚 99 questions',
              () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const InterviewPage()),
              ),
            ),
            const Spacer(),
            Center(
              child: Container(
                padding: const EdgeInsets.all(16),
                color: Colors.grey.shade200,
                child: const Text(
                  'Test Ad',
                  style: TextStyle(fontSize: 18, color: Colors.grey),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryItem(
      BuildContext context, String title, String subtitle, VoidCallback onTap) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(subtitle),
        trailing: Text(
          'Let\'s Start →',
          style: TextStyle(color: Theme.of(context).primaryColor),
        ),
        onTap: onTap,
      ),
    );
  }
}

// Simple placeholder pages for each category
class FlutterPage extends StatelessWidget {
  const FlutterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Flutter')),
      body: const Center(
        child: Text('Flutter content goes here'),
      ),
    );
  }
}

class DartPage extends StatelessWidget {
  const DartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Dart and OOP')),
      body: const Center(
        child: Text('Dart and OOP content goes here'),
      ),
    );
  }
}

class InterviewPage extends StatelessWidget {
  const InterviewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Interview Questions')),
      body: const Center(
        child: Text('99 Interview questions – coming soon'),
      ),
    );
  }
}