import 'dart:math';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ResultScreen extends StatelessWidget {
  ResultScreen({super.key, required this.choice});

  final String? choice;
  late final String _computerChoice = _generateComputerChoice();
  late final String _result = _compareChoices();

  String _generateComputerChoice() {
    final random = Random();
    final choices = ['rock', 'paper', 'scissors'];
    return choices[random.nextInt(choices.length)];
  }

  String _compareChoices() {
    if (choice == _computerChoice) {
      return 'It\'s a TIE';
    } else if (choice == 'rock' && _computerChoice == 'scissors' ||
        choice == 'paper' && _computerChoice == 'rock' ||
        choice == 'scissors' && _computerChoice == 'paper') {
      return 'YOU WIN!';
    } else {
      return 'YOU LOSE!';
    }
  }

  Widget _displayChoice() {
    switch (choice) {
      case 'rock':
        return Image.asset('images/rock.png', height: 100);
      case 'paper':
        return Image.asset('images/paper.png', height: 100);
      case 'scissors':
        return Image.asset('images/scissors.png', height: 100);
      default:
        return const SizedBox.shrink();
    }
  }

  Widget _displayComputerChoice() {
    switch (_computerChoice) {
      case 'rock':
        return Image.asset('images/rock.png', height: 100);
      case 'paper':
        return Image.asset('images/paper.png', height: 100);
      case 'scissors':
        return Image.asset('images/scissors.png', height: 100);
      default:
        return const SizedBox.shrink();
    }
  }

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
            width: 600,
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
                  'THE RESULT IS:',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
                Text(
                  _result,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 50,
                  children: [
                    Column(
                      children: [
                        Text(
                          "You",
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                            color: Colors.black87,
                          ),
                        ),
                        _displayChoice(),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          "Computer",
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                            color: Colors.black87,
                          ),
                        ),
                        _displayComputerChoice(),
                      ],
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 10,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        context.go('/game');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 30,
                          vertical: 14,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text('PLAY AGAIN'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        context.go('/');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 30,
                          vertical: 14,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text('LEAVE'),
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
