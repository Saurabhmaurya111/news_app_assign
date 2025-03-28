import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:news_app/providers/theme_provider.dart';
import 'package:news_app/screens/webview_page.dart';

class NewsFeedPage extends StatefulWidget {
  const NewsFeedPage({super.key});

  @override
  _NewsFeedPageState createState() => _NewsFeedPageState();
}

class _NewsFeedPageState extends State<NewsFeedPage> {
  List articles = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchNews();
  }

  Future<void> fetchNews() async {
    const apiKey = '780044392f7e48d29d76322478850068';
    const url = 'https://newsapi.org/v2/top-headlines?country=us&apiKey=$apiKey';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      setState(() {
        articles = data['articles'];
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('News Feed'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: fetchNews,
          ),
          IconButton(
            icon: Icon(
              Provider.of<ThemeProvider>(context).themeMode == ThemeMode.dark
                  ? Icons.dark_mode
                  : Icons.light_mode,
            ),
            onPressed: () {
              Provider.of<ThemeProvider>(context, listen: false).toggleTheme();
            },
          ),
        ],
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : RefreshIndicator(
              onRefresh: fetchNews,
              child: ListView.builder(
                itemCount: articles.length,
                itemBuilder: (context, index) {
                  final article = articles[index];
                  return ListTile(
                    leading: article['urlToImage'] != null
                        ? Image.network(article['urlToImage'], width: 80, height: 80, fit: BoxFit.cover)
                        : const Icon(Icons.image),
                    title: Text(article['title'] ?? 'No Title'),
                    subtitle: Text(article['source']['name'] ?? 'Unknown'),
                    onTap: () {
                      if (article['url'] != null) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => WebViewPage(url: article['url']),
                          ),
                        );
                      }
                    },
                  );
                },
              ),
            ),
    );
  }
}
