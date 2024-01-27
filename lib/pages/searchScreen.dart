import 'package:cw1_news_api/services/searching.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  final NewsService newsService;

  SearchScreen({required this.newsService});

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController _searchController = TextEditingController();
  List<Map<String, dynamic>> _searchResults = [];

  void _performSearch() async {
    String query = _searchController.text.trim();
    if (query.isNotEmpty) {
      try {
        List<Map<String, dynamic>> results = await widget.newsService.searchNews(query);
        setState(() {
          _searchResults = results;
        });
      } catch (e) {
        print('Error fetching news: $e');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search News'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Enter your search query',
                suffixIcon: IconButton(
                  icon: Icon(Icons.search),
                  onPressed: _performSearch,
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _searchResults.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_searchResults[index]['title']),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

