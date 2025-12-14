enum BookStatus { toBeRead, read }

class Book {
  final String title;
  final String author;
  final String isbn;
  final String olid;
  String description;
  BookStatus status;

  Book({required this.title, required this.author, required this.isbn, this.olid = '', this.description = '', this.status = BookStatus.toBeRead});

  String get coverUrl => 'https://covers.openlibrary.org/b/isbn/$isbn-M.jpg';
}
