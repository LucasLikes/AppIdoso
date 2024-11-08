import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart'; // Para obter o FontSizeProvider
import '../widgets/floating_chat_button.dart';
import 'news_screen.dart';
import 'tutorials_screen.dart';
import 'testimonials_screen.dart';
import '../utils/font_size_provider.dart';  // Importe o FontSizeProvider

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Obtendo o tamanho da fonte globalmente
    double fontSize = Provider.of<FontSizeProvider>(context).fontSize;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'App para Idosos',
          style: GoogleFonts.raleway(fontSize: fontSize), // Aplica o tamanho de fonte ajustado
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            NewsScreen(),
            SizedBox(height: 20),
            TutorialsScreen(),
            SizedBox(height: 20),
            TestimonialsScreen(),
          ],
        ),
      ),
      floatingActionButton: FloatingChatButton(),
    );
  }
}
