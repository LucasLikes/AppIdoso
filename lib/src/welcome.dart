import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../utils/font_size_provider.dart';  // Importe o FontSizeProvider
import 'home_screen.dart';  // Importe a HomeScreen para navegar

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Obtendo o tamanho atual da fonte
    double fontSize = Provider.of<FontSizeProvider>(context).fontSize;

    return Scaffold(
      appBar: AppBar(
        title: Text('Ajustar Tamanho da Fonte'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Texto com tamanho ajustado
            Text(
              'Texto com o tamanho ajustado!',
              style: TextStyle(fontSize: fontSize),
            ),
            SizedBox(height: 20),

            // Botões para aumentar e diminuir o tamanho da fonte
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(Icons.remove),
                  onPressed: () {
                    // Decrementar o tamanho da fonte
                    Provider.of<FontSizeProvider>(context, listen: false)
                        .decreaseFontSize();
                  },
                ),
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    // Incrementar o tamanho da fonte
                    Provider.of<FontSizeProvider>(context, listen: false)
                        .increaseFontSize();
                  },
                ),
              ],
            ),

            SizedBox(height: 20),

            // Botão de "Continuar"
            ElevatedButton(
              onPressed: () {
                // Navega para a HomeScreen e mantém o tamanho da fonte ajustado
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                );
              },
              child: Text('Continuar'),
            ),
          ],
        ),
      ),
    );
  }
}
