import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(GameApp());
}

class GameApp extends StatefulWidget {
  @override
  State<GameApp> createState() => _GameAppState();
}

class _GameAppState extends State<GameApp> {
  final textStyle = TextStyle(color: Colors.white, fontSize: 32);
  final statusTextStyle = TextStyle(color: Colors.white, fontSize: 18);

  String status = "";
  String statusAppended = "";

  void play(String userChoise) {
    const options = ["pedra", "papel", "tesoura"];
    int oponentNumber = Random().nextInt(3);
    var oponentChoice = options[oponentNumber];

    String result = "";
    String resultAppended = "";

    if (userChoise == oponentChoice) {
      result = "Empate!";
      resultAppended = "Ambos jogaram $userChoise";
    }

    if (userChoise == "pedra" && oponentChoice == "tesoura" ||
        userChoise == "tesoura" && oponentChoice == "papel" ||
        userChoise == "papel" && oponentChoice == "pedra") {
      result = "Você ganhou!";
      resultAppended = "Você jogou: $userChoise | contra: $oponentChoice ";
    }

    if (userChoise == "tesoura" && oponentChoice == "pedra" ||
        userChoise == "papel" && oponentChoice == "tesoura" ||
        userChoise == "pedra" && oponentChoice == "papel") {
      result = "Você perdeu!";
      resultAppended = "Você jogou: $userChoise | contra: $oponentChoice ";
    }

    setState(() {
      status = result;
      statusAppended = resultAppended;
    });
  }

  @override
  build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 44, 41, 41),
        body: Column(
          children: [
            Text(
              status,
              style: statusTextStyle,
            ),
            Text(
              statusAppended,
              style: statusTextStyle,
            ),
            Expanded(
                child: GestureDetector(
              onTap: () => play("pedra"),
              child: Container(
                width: double.infinity,
                margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: Center(
                  child: Text(
                    "Pedra",
                    style: textStyle,
                  ),
                ),
                decoration: BoxDecoration(
                    color: Colors.red, borderRadius: BorderRadius.circular(10)),
              ),
            )),
            Expanded(
                child: GestureDetector(
              onTap: () => play("papel"),
              child: Container(
                width: double.infinity,
                margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: Center(
                  child: Text(
                    "Papel",
                    style: textStyle,
                  ),
                ),
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(10)),
              ),
            )),
            Expanded(
              child: GestureDetector(
                onTap: () => play("tesoura"),
                child: Container(
                  width: double.infinity,
                  margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
                  child: Center(
                      child: Text(
                    "Tesoura",
                    style: textStyle,
                  )),
                  decoration: BoxDecoration(
                      color: Colors.cyan,
                      borderRadius: BorderRadius.circular(10)),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
