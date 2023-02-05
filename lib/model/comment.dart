class Article {

  final int id;
  final String? comment;


  const Article ({
    required this.id,
     this.comment,

  });

  Map<String, dynamic> toMap(){
    return{
      'id' : id,
      'comment': comment,
    };
  }

  @override
  String toString() {
    return 'Article{ id: $id, comment: $comment}';
  }
}