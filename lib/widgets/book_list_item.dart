import 'package:flutter/material.dart';
import 'package:myapp/book_model.dart';

class BookListItem extends StatelessWidget {
  final Book book;
  final VoidCallback onDelete;
  final Function(BookStatus) onStatusChanged;

  const BookListItem({super.key, required this.book, required this.onDelete, required this.onStatusChanged});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(book.title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  Text(book.author, style: const TextStyle(fontSize: 14, color: Colors.grey)),
                ],
              ),
            ),
            DropdownButton<BookStatus>(
              value: book.status,
              onChanged: (value) => onStatusChanged(value!),
              items: BookStatus.values.map((status) {
                return DropdownMenuItem(value: status, child: Text(status.toString().split('.').last));
              }).toList(),
            ),
            IconButton(icon: const Icon(Icons.delete, color: Colors.red), onPressed: onDelete),
          ],
        ),
      ),
    );
  }
}
