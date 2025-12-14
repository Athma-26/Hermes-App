import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:myapp/book_model.dart';

class BookDetailsScreen extends StatefulWidget {
  final Book book;

  const BookDetailsScreen({super.key, required this.book});

  @override
  State<BookDetailsScreen> createState() => _BookDetailsScreenState();
}

class _BookDetailsScreenState extends State<BookDetailsScreen> {
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchBookDescription();
  }

  Future<void> _fetchBookDescription() async {
    if (widget.book.description.isNotEmpty) {
      setState(() => _isLoading = false);
      return;
    }

    try {
      final response = await http.get(Uri.parse('https://openlibrary.org/isbn/${widget.book.isbn}.json'));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final description = data['description'] ?? 'No description available.';
        setState(() {
          widget.book.description = description;
          _isLoading = false;
        });
      } else {
        setState(() {
          widget.book.description = 'Failed to load description.';
          _isLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        widget.book.description = 'Failed to load description.';
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.book.title),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Image.network(widget.book.coverUrl),
              const SizedBox(height: 16.0),
              Text(widget.book.title, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8.0),
              Text(widget.book.author, style: const TextStyle(fontSize: 18, fontStyle: FontStyle.italic)),
              const SizedBox(height: 16.0),
              _isLoading
                  ? const CircularProgressIndicator()
                  : Text(widget.book.description, style: const TextStyle(fontSize: 16)),
            ],
          ),
        ),
      ),
    );
  }
}
