import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculadora de Médias',
      home: FormMedia(),
    );
  }
}

class FormMedia extends StatefulWidget {
  @override
  createState() => _FormMediaState();
}

class _FormMediaState extends State<FormMedia> {
  var media = "";
  // Controladores das caixas de texto:
  TextEditingController ctrNome = TextEditingController();
  TextEditingController ctrEmail = TextEditingController();
  TextEditingController ctrNota1 = TextEditingController();
  TextEditingController ctrNota2 = TextEditingController();
  TextEditingController ctrNota3 = TextEditingController();
  @override
  Widget build(BuildContext formContext) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tarefa Final DPM 2021.2"),
      ),
      body: Column(
        children: <Widget>[
          txtField(ctrNome, "Nome", "Digite o Nome", TextInputType.name),
          txtField(ctrEmail, "E-mail", "Digite o E-mail",
              TextInputType.emailAddress),
          txtNotas(),
          cmdCalcular(),
          resultados(
              ctrNome.text,
              ctrEmail.text,
              ctrNota1.text + " - " + ctrNota2.text + " - " + ctrNota3.text,
              media),
          cmdApagar(),
        ],
      ),
    );
  }

  // Função que Calcula Média:
  String calculaMedia() {
// Aqui criamos variáveis pegando os valores digitados
    // nas caixas de texto (através dos controllers),
    // e convertemos para double.
    double nota1 = double.parse(ctrNota1.text);
    double nota2 = double.parse(ctrNota2.text);
    double nota3 = double.parse(ctrNota3.text);
    // O cálculo...
    double soma = nota1 + nota2 + nota3;
    double media = 0.0;
    if (soma > 0) {
      media = soma / 3;
    }
    return media.toStringAsFixed(1);
  }

  // Função que Limpa os Campos:

  // Campo de Texto
  Widget txtField(TextEditingController controller, String titulo, String hint,
      TextInputType tiType) {
    return Padding(
      padding: EdgeInsets.only(left: 8, right: 8, top: 4, bottom: 4),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: titulo,
          hintText: hint,
          labelStyle: Theme.of(context).textTheme.bodyText2,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4.0),
          ),
        ),
        keyboardType: tiType,
      ),
    );
  }

  // Conjunto de Notas
  Widget txtNotas() {
    return Padding(
      padding: EdgeInsets.only(left: 8, right: 8, top: 4, bottom: 4),
      child: Row(
        children: <Widget>[
          Expanded(
            child: TextField(
              controller: ctrNota1,
              decoration: InputDecoration(
                labelText: 'Nota 1',
                labelStyle: Theme.of(context).textTheme.bodyText2,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4.0),
                ),
              ),
              keyboardType: TextInputType.number,
            ),
          ),
          Container(width: 8),
          Expanded(
            child: TextField(
              controller: ctrNota2,
              decoration: InputDecoration(
                labelText: 'Nota 2',
                hintText: 'Nota 2',
                labelStyle: Theme.of(context).textTheme.bodyText2,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4.0),
                ),
              ),
              keyboardType: TextInputType.number,
            ),
          ),
          Container(width: 8),
          Expanded(
            child: TextField(
              controller: ctrNota3,
              decoration: InputDecoration(
                labelText: 'Nota 3',
                hintText: 'Nota 3',
                labelStyle: Theme.of(context).textTheme.bodyText2,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4.0),
                ),
              ),
              keyboardType: TextInputType.number,
            ),
          ),
        ],
      ),
    );
  }

  // Botões de Ação
  Widget cmdCalcular() {
    return Padding(
      padding: EdgeInsets.only(left: 4, right: 4),
      child: Row(
        children: <Widget>[
          Expanded(
            child: ElevatedButton(
              child: Text(
                "Calcula Média",
                textScaleFactor: 1.25,
              ),
              onPressed: () {
                setState(
                  () {
                    media = calculaMedia();
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  // Botões de Ação
  Widget cmdApagar() {
    return Padding(
      padding: EdgeInsets.only(left: 4, right: 4),
      child: Row(
        children: <Widget>[
          Expanded(
            child: ElevatedButton(
              child: Text(
                "Limpa Campos",
                textScaleFactor: 1.25,
              ),
              onPressed: () {
                ctrNome.text = '';
                ctrEmail.text = '';
                ctrNota1.text = '';
                ctrNota2.text = '';
                ctrNota3.text = '';
                setState(
                  () {},
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget resultados(String nome, String email, String notas, String media) {
    return Padding(
      padding: EdgeInsets.all(4),
      child: Column(
        children: <Widget>[
          linhaRes("Resultados: ", ""),
          linhaRes("Nome: ", nome),
          linhaRes("EMail: ", email),
          linhaRes("Notas: ", notas),
          linhaRes("Média: ", media),
        ],
      ),
    );
  }

  // Linha dos Resultados
  Widget linhaRes(String item, String valor) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: Row(children: <Widget>[
        Expanded(child: Text(item)),
        Flexible(child: Text(valor)),
      ]),
    );
  }
}
