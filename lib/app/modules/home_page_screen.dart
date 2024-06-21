import 'package:flutter/material.dart';
import 'package:imc_flutter/app/modules/imc_requires.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _pesoController = TextEditingController();
  final TextEditingController _alturaController = TextEditingController();
  final TextEditingController _resultadoController = TextEditingController();

  String resultado = '';

  void calcularIMC() {
    final String nome = _nomeController.text;
    final double peso = double.tryParse(_pesoController.text) ?? 0.0;
    final double altura = double.tryParse(_alturaController.text) ?? 0.0;

    if (peso > 0 && altura > 0) {
      final imcRequirido = ImcRequires(nome: nome, altura: altura, peso: peso);
      final double imc = imcRequirido.calcularImc();

      _resultadoController.text =
          'olá $nome, seu IMC é ${imc.toStringAsFixed(2)}\n\n- menor que 16 — magreza grave\n- entre 16 e 16,9 — magreza moderada\n- entre 17 e 18,5 — magreza leve\n- entre 18,6 e 24,9 — peso ideal\n- entre 25 e 29,9 — sobrepeso\n- entre 30 e 34,9 — obesidade grau I\n - entre 35 e 39,9 — obesidade grau II\n- maiores do que 40 — obesidade grau III';
    } else {
      _resultadoController.text = 'por favor insira valores validos';
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Center(
          child: Column(
            children: [
              const Text(
                'Calculadora de IMC',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 35,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 24,
              ),
              Expanded(
                child: SizedBox(
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      double widthFactor;
                      if (constraints.maxWidth > 900) {
                        widthFactor = 0.35;
                      } else if (constraints.maxWidth < 500) {
                        widthFactor = 0.65;
                      } else {
                        widthFactor = 0.65;
                      }

                      return SizedBox(
                        width: constraints.maxWidth * widthFactor,
                        child: ListView(
                          children: [
                            SizedBox(
                              child: Flexible(
                                child: TextFormField(
                                  controller: _nomeController,
                                  decoration: InputDecoration(
                                    labelText: 'Digite seu nome',
                                    fillColor: Colors.white,
                                    filled: true,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                      borderSide: const BorderSide(
                                          color: Colors.grey, width: 2.0),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Flexible(
                              child: SizedBox(
                                child: TextFormField(
                                  controller: _pesoController,
                                  decoration: InputDecoration(
                                    labelText: 'Digite seu peso',
                                    fillColor: Colors.white,
                                    filled: true,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                      borderSide: const BorderSide(
                                          color: Colors.grey, width: 2.0),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Flexible(
                              child: SizedBox(
                                child: TextFormField(
                                  controller: _alturaController,
                                  decoration: InputDecoration(
                                    labelText: 'digite sua altura',
                                    fillColor: Colors.white,
                                    filled: true,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                      borderSide: const BorderSide(
                                          color: Colors.grey, width: 2.0),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            SizedBox(
                              height: 46,
                              child: TextButton(
                                onPressed: () {
                                  calcularIMC();
                                },
                                style: const ButtonStyle(
                                  backgroundColor: WidgetStatePropertyAll(
                                    Color(0xff8A19D6),
                                  ),
                                ),
                                child: const Text(
                                  'Calcular',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 100,
                            ),
                            Text(
                              _resultadoController.text,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
