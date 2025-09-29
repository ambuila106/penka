import 'package:flutter/material.dart';

class ScoreCard extends StatelessWidget {
  final String leftTeamSrc;
  final String rightTeamSrc;
  final int leftScore;
  final int rightScore;

  const ScoreCard({
    Key? key,
    required this.leftTeamSrc,
    required this.rightTeamSrc,
    required this.leftScore,
    required this.rightScore,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 120,
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(15),
      ),
      child: Align(
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(leftTeamSrc, width: 70),
            const SizedBox(width: 20),
            _buildScoreBox(leftScore),
            SizedBox(
              width: 30,
              child: Text(
                textAlign: TextAlign.center,  
                'vs',
                style: TextStyle(color: Colors.white, fontSize: 12)
              ),
            ),

            _buildScoreBox(rightScore),
            const SizedBox(width: 20),
            Image.asset(rightTeamSrc, width: 70),
          ],
        ),
      ),
    );
  }

  // 🔧 Método privado para no repetir el container de los puntajes
  Widget _buildScoreBox(int score) {
    return Container(
      width: 50,
      height: 53,
      decoration: BoxDecoration(
        color: Colors.deepPurple,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Center(
        child: Text(
          '$score',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold
          ),
        ),
      ),
    );
  }

Widget _buildInputScore(int score) {
    return SizedBox(
      width: 50,
      height: 53,
      child: TextField(
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold
        ),
        decoration: InputDecoration(
          isDense: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(
              color: Colors.deepPurple, // borde cuando no está enfocado
              width: 1.5,
            ),
          ),
        ),
      ),
    );
  }
}
