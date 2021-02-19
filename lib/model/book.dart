class Book {
  final String title;
  final String author;
  final String description;
  final String frontCoverUrl;
  final String bookUrl;

  Book({
    this.title,
    this.author,
    this.description,
    this.frontCoverUrl,
    this.bookUrl,
  });

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      title: json["book_title"],
      author: json["book_author"],
      description: json["book_description"],
      frontCoverUrl: json["front_cover"],
      bookUrl: json["download_link"],
    );
  }
}
