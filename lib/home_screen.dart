import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:myapp/providers/book_provider.dart';
import 'package:myapp/widgets/add_book_dialog.dart';
import 'package:myapp/book_model.dart';
import 'package:myapp/screens/book_details_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bookProvider = Provider.of<BookProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Book Gallery'),
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.7,
        ),
        itemCount: bookProvider.books.length,
        itemBuilder: (context, index) {
          final book = bookProvider.books[index];
          return GestureDetector(
            onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => BookDetailsScreen(book: book))),
            onLongPress: () => _showBookOptions(context, book),
            child: Card(
              child: Column(
                children: [
                  Expanded(
                    child: Image.network(book.coverUrl, fit: BoxFit.cover),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(book.title, style: const TextStyle(fontWeight: FontWeight.bold), textAlign: TextAlign.center),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddBookDialog(context),
        child: const Icon(Icons.add),
      ),
    );
  }

  void _showAddBookDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) {
        return AddBookDialog(
          onAddBook: (title, author, isbn) {
            final newBook = Book(title: title, author: author, isbn: isbn);
            Provider.of<BookProvider>(context, listen: false).addBook(newBook);
          },
        );
      },
    );
  }

  void _showBookOptions(BuildContext context, Book book) {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return Wrap(
          children: [
            ListTile(
              leading: const Icon(Icons.bookmark_border),
              title: const Text('Add to To Be Read'),
              onTap: () {
                Provider.of<BookProvider>(context, listen: false).updateBookStatus(book, BookStatus.toBeRead);
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              leading: const Icon(Icons.check),
              title: const Text('Mark as Read'),
              onTap: () {
                Provider.of<BookProvider>(context, listen: false).updateBookStatus(book, BookStatus.read);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
