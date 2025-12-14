import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:myapp/providers/book_provider.dart';
import 'package:myapp/widgets/book_list_item.dart';

class MyLibraryScreen extends StatelessWidget {
  const MyLibraryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bookProvider = Provider.of<BookProvider>(context);

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('My Library'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'To Be Read'),
              Tab(text: 'Read'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            ListView.builder(
              itemCount: bookProvider.toBeReadBooks.length,
              itemBuilder: (context, index) {
                final book = bookProvider.toBeReadBooks[index];
                return BookListItem(
                  book: book,
                  onDelete: () => bookProvider.removeBook(book),
                  onStatusChanged: (status) => bookProvider.updateBookStatus(book, status),
                );
              },
            ),
            ListView.builder(
              itemCount: bookProvider.readBooks.length,
              itemBuilder: (context, index) {
                final book = bookProvider.readBooks[index];
                return BookListItem(
                  book: book,
                  onDelete: () => bookProvider.removeBook(book),
                  onStatusChanged: (status) => bookProvider.updateBookStatus(book, status),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
