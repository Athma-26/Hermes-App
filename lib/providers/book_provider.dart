import 'package:flutter/material.dart';
import 'package:myapp/book_model.dart';

class BookProvider with ChangeNotifier {
  final List<Book> _books = [
    Book(title: 'The Hitchhiker\'s Guide to the Galaxy', author: 'Douglas Adams', isbn: '9780345391803'),
    Book(title: 'The Lord of the Rings', author: 'J.R.R. Tolkien', isbn: '9780618640157'),
    Book(title: 'To Kill a Mockingbird', author: 'Harper Lee', isbn: '9780061120084'),
    Book(title: 'The Great Gatsby', author: 'F. Scott Fitzgerald', isbn: '9780743273565'),
    Book(title: 'Moby Dick', author: 'Herman Melville', isbn: '9781503280786'),
  ];

  List<Book> get books => _books;
  List<Book> get toBeReadBooks => _books.where((book) => book.status == BookStatus.toBeRead).toList();
  List<Book> get readBooks => _books.where((book) => book.status == BookStatus.read).toList();

  void addBook(Book book) {
    _books.add(book);
    notifyListeners();
  }

  void removeBook(Book book) {
    _books.remove(book);
    notifyListeners();
  }

  void updateBookStatus(Book book, BookStatus status) {
    book.status = status;
    notifyListeners();
  }
}
