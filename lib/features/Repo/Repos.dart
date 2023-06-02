import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Repos extends StatelessWidget {
  Repos({required this.s});
  String s;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GitHub Repo App',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: GitHubRepoScreen(
        usnm: s,
      ),
    );
  }
}

class GitHubRepoScreen extends StatefulWidget {
  GitHubRepoScreen({required this.usnm});
  String usnm;
  @override
  _GitHubRepoScreenState createState() => _GitHubRepoScreenState();
}

class _GitHubRepoScreenState extends State<GitHubRepoScreen> {
  List<dynamic> repositories = [];

  @override
  void initState() {
    super.initState();
    fetchRepositories();
  }

  Future<void> fetchRepositories() async {
    String username = widget.usnm;
    // var url = Uri.https('api.github.com', '/users/$username/repos');
    var url = Uri.https('api.github.com', '/users/$username/repos', {
      'type': 'public', // Add query parameter to fetch only public repositories
    });

    var response = await http.get(url);

// var r=Uri.https('api.github.com','/users/freeCodeCamp/repos');
//     var find= await http.get(r);

    if (response.statusCode == 200) {
      setState(() {
        repositories = jsonDecode(response.body);
      });
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Public Repository'),
      ),
      body: ListView.builder(
        itemCount: repositories.length,
        itemBuilder: (context, index) {
          var repo = repositories[index];
          return ListTile(
            title: Text(repo['name']),
            subtitle: Text(repo['description'] ?? 'No description'),
            onTap: () {
              // Add any additional action when a repository is tapped
            },
          );
        },
      ),
    );
  }
}
