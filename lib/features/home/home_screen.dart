import 'package:flutter/material.dart';
import 'package:word_game/features/features.dart';

class HomeScreen extends StatelessWidget {
  static const id = '/home';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              Row(
                children: [
                  const Icon(
                    Icons.favorite,
                    color: Colors.red,
                  ),
                  const SizedBox(width: 8),
                  const Text('5 lives'),
                  const Spacer(),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.settings),
                  ),
                ],
              ),
              const Spacer(),
              FilledButton(
                onPressed: () => Navigator.pushNamed(context, GameScreen.id),
                child: const Text('Start Game'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
