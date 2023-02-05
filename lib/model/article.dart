class Article {

  final int id;
  final String url;
  final String title;
  final String content;



  const Article ({
    required this.id,
    required this.url,
    required this.title,
    required this.content,


  });

  Map<String, dynamic> toMap(){
    return{
      'id' : id,
      'url': url,
      'title': title,
      'content': content,

    };
  }

  @override
  String toString() {
    return 'Article{ id: $id, url: $url, title: $title, content: $content}';
  }
}