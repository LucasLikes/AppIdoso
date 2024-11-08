import 'package:flutter/material.dart';

class TestimonialsScreen extends StatelessWidget {
  final List<String> testimonials = [
    '“Este app mudou minha vida!” - Maria, 68 anos',
    '“Fácil de usar e muito útil.” - João, 72 anos',
    '“Adoro as dicas e tutoriais.” - Ana, 65 anos',
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Depoimentos de Usuários',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Column(
            children: testimonials
                .map((testimonial) => Card(
                      margin: EdgeInsets.symmetric(vertical: 5),
                      child: ListTile(
                        title: Text(testimonial, style: TextStyle(fontSize: 16)),
                      ),
                    ))
                .toList(),
          ),
        ],
      ),
    );
  }
}
