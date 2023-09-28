class Tweetos {
  final int id;
  final String author;
  final String message;

  const Tweetos({
    required this.id,
    required this.author,
    required this.message,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'author': this.author,
      'message': this.message,
    };
  }

  factory Tweetos.fromMap(Map<String, dynamic> map) {
    return Tweetos(
      id: map['id'] as int,
      author: map['author'] as String,
      message: map['message'] as String,
    );
  }
}
