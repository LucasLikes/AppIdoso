import 'package:flutter/material.dart';

class TutorialsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Tutoriais para Auxiliar',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          tutorialCard('Como usar o WhatsApp', 'Passo a passo simples'),
          tutorialCard('Dicas de segurança no celular', 'Proteja suas informações'),
        ],
      ),
    );
  }

  Widget tutorialCard(String title, String description) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        title: Text(title, style: TextStyle(fontSize: 18)),
        subtitle: Text(description),
      ),
    );
  }
}
