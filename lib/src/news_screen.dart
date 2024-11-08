import 'package:flutter/material.dart';
import '../services/news_service.dart';
import '../models/news_model.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsScreen extends StatefulWidget {
  @override
  _NewsScreenState createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  final NewsService _newsService = NewsService();
  List<NewsModel> _newsList = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchNews();
  }

  Future<void> fetchNews() async {
    try {
      final articles = await _newsService.fetchNews();
      setState(() {
        // Limita a lista a 5 notícias
        _newsList = articles
            .take(5)  // Limita a 5 artigos
            .map((article) => NewsModel.fromJson(article))
            .toList();
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      print('Erro ao carregar notícias: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Notícias para Você',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          _isLoading
              ? Center(child: CircularProgressIndicator())
              : _newsList.isEmpty
                  ? Text('Nenhuma notícia disponível no momento')
                  : Expanded(
                      child: ListView.builder(
                        itemCount: _newsList.length,
                        itemBuilder: (context, index) {
                          return newsCard(_newsList[index]);
                        },
                      ),
                    ),
        ],
      ),
    );
  }

  Widget newsCard(NewsModel news) {
    return Card(
      margin: EdgeInsets.only(bottom: 10),
      child: ListTile(
        leading: news.imageUrl.isNotEmpty
            ? Image.network(news.imageUrl, width: 100, fit: BoxFit.cover)
            : null,
        title: Text(news.title, style: TextStyle(fontSize: 16)),
        subtitle: Text(news.description, maxLines: 2, overflow: TextOverflow.ellipsis),
        onTap: () => openNewsUrl(news.url),
      ),
    );
  }

  void openNewsUrl(String url) {
    if (url.isNotEmpty) {
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: Text('Notícia Completa'),
          content: Text('Clique abaixo para abrir a notícia.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Fechar'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                launchURL(url);
              },
              child: Text('Abrir'),
            ),
          ],
        ),
      );
    }
  }

  void launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunch(uri.toString())) {
      await launch(uri.toString(), forceWebView: true, forceSafariVC: true);
    } else {
      print('Não foi possível abrir o link');
    }
  }
}
