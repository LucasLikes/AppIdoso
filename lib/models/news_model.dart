class NewsModel {
  final String title;
  final String description;
  final String url;
  final String imageUrl;
  final String publishedAt;

  NewsModel({
    required this.title,
    required this.description,
    required this.url,
    required this.imageUrl,
    required this.publishedAt,
  });

  factory NewsModel.fromJson(Map<String, dynamic> json) {
    return NewsModel(
      title: json['title'] ?? 'Título não disponível',
      description: json['description'] ?? 'Descrição não disponível',
      url: json['url'] ?? '',
      imageUrl: json['image'] ?? '',
      publishedAt: json['publishedAt'] ?? '',
    );
  }
}
