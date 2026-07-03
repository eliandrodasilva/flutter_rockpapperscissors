import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class GameScreen extends StatelessWidget {
  const GameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Card(
          elevation: 8,
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Container(
            width: 320,
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              spacing: 15,
              children: [
                const Text(
                  'Rock Paper & Scissors',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const Text(
                  'Chose your weapon:',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
                IconButton(
                  onPressed: () => context.go('/result/rock'),
                  icon: Image.asset('images/rock.png', height: 100),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () => context.go('/result/paper'),
                      icon: Image.asset('images/paper.png', height: 100),
                    ),
                    IconButton(
                      onPressed: () => context.go('/result/scissors'),
                      icon: Image.asset('images/scissors.png', height: 100),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
