import 'package:flutter/material.dart';
import 'dart:math';

class Jogo extends StatefulWidget {
  const Jogo({Key? key}) : super(key: key);
  @override
  State<Jogo> createState() => _JogoState();
}

class _JogoState extends State<Jogo> {
  var _imagemApp = const AssetImage("images/padrao.png");
  var _resultadoFinal = "Boa sorte!!!";
  int _pontuacaoJogador = 0;
  int _pontuacaoApp = 0;

  void _opcaoSelecionada(String escolhaUsuario) {
    var opcoes = ["pedra", "papel", "tesoura"];
    var numero = Random().nextInt(3);
    var escolhaApp = opcoes[numero];
    print("Escolha do App: " + escolhaApp);
    print("Escolha do Usuário: " + escolhaUsuario);

    setState(() {
      switch (escolhaApp) {
        case "pedra":
          _imagemApp = const AssetImage("images/pedra.png");
          break;
        case "papel":
          _imagemApp = const AssetImage("images/papel.png");
          break;
        case "tesoura":
          _imagemApp = const AssetImage("images/tesoura.png");
          break;
      }

      if ((escolhaUsuario == "pedra" && escolhaApp == "tesoura") ||
          (escolhaUsuario == "tesoura" && escolhaApp == "papel") ||
          (escolhaUsuario == "papel" && escolhaApp == "pedra")) {
        _resultadoFinal = "Parabéns!!! Você ganhou :)";
        _pontuacaoJogador++;
      } else if ((escolhaApp == "pedra" && escolhaUsuario == "tesoura") ||
          (escolhaApp == "tesoura" && escolhaUsuario == "papel") ||
          (escolhaApp == "papel" && escolhaUsuario == "pedra")) {
        _resultadoFinal = "Puxa!!! Você perdeu :(";
        _pontuacaoApp++;
      } else {
        _resultadoFinal = "Empate!!! Tente novamente :/";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        title: const Text('JokenPO'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              "Escolha do App",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Image(image: _imagemApp),
          const Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              "Escolha uma opção abaixo:",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              GestureDetector(
                onTap: () => _opcaoSelecionada("pedra"),
                child: const Column(
                  children: [
                    Image(
                      image: AssetImage('images/pedra.png'),
                      height: 100,
                    ),
                    Text('Pedra'),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () => _opcaoSelecionada("papel"),
                child: const Column(
                  children: [
                    Image(
                      image: AssetImage('images/papel.png'),
                      height: 100,
                    ),
                    Text('Papel'),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () => _opcaoSelecionada("tesoura"),
                child: const Column(
                  children: [
                    Image(
                      image: AssetImage('images/tesoura.png'),
                      height: 100,
                    ),
                    Text('Tesoura'),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              _resultadoFinal,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: _resultadoFinal == "Parabéns!!! Você ganhou :)"
                    ? Colors.blue
                    : _resultadoFinal == "Puxa!!! Você perdeu :("
                        ? Colors.red
                        : Colors.yellow,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 32),
            child: Text(
              "Jogador: $_pontuacaoJogador  |  App: $_pontuacaoApp",
              style: const TextStyle(fontSize: 18),
            ),
          ),
        ],
      ),
    );
  }
}
