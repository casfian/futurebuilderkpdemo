import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:futurebuilderkpdemo/post.dart';
import 'package:http/http.dart' as http;
//kita jadikan sebagai object supaya mudah guna

void main() => runApp(MyApp());

//root class
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Home(),
    );
  }
}

//secondary class
class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<dynamic> posts = []; //tiada data

  var url = Uri.parse('https://jsonplaceholder.typicode.com/photos');

  Future<List<dynamic>> getPosts() async {
    var data = await http.get(url);
    var jsonData = json.decode(data.body); //data akan diterjemah ke JSON

    print(posts);

    //loop utk masukkan data ke dalam Posts
    for (var u in jsonData) {
      //kita masukkan data yg dari Internet ke posts
      Post post = Post(u!['index'], u['albumid'], u['id'], u['title'], u['url'],
          u['thumbnailUrl']);
      posts.add(post);
    }
    posts = jsonData;
    print(posts);
    return posts; //return value dalam List<Post>
  }

  //guna initState
  @override
  void initState() {
    getPosts(); //tambah ne, kita
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Material App Bar'),
      ),
      body: FutureBuilder(
        future: getPosts(), //ambil data dari function getPost yg memulangkan data Post
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            //papar data
            //builder akan buat 
          return ListView.builder(
            //kalau data sifar maka kosong, kalau tak paparkan data seterusnya
              itemCount: snapshot.data == null
                  ? 0
                  : snapshot.data.length, //asal dia tiada data
              itemBuilder: (context, index) {
                //paparkan data
                return ListTile(
                  leading: Image.network(snapshot.data[index]['thumbnailUrl']),
                  title: Text(snapshot.data[index]['title']),
                  subtitle: Text(snapshot.data[index]['url']),
                );
              });
          } else {
            //data tengah loading
            return Center(child: CircularProgressIndicator()   );
          }
          
        },
      ),
    );
  }
}
