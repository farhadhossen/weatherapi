
import 'package:flutter/material.dart';




import 'package:http/http.dart' as http;
import 'package:weatherapi/api_model.dart';
import 'package:weatherapi/api_response.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  // ResponseRepository repository = ResponseRepository();

  late List<ApiModel> response;



  // Future<List<UserlistModel>> getUsers() async {
  //   var apiUrl = Uri.parse('http://172.16.153.3:8000/api/v1/user/search');
  //
  //   final response = await http.get(apiUrl);
  //
  //   print(response.statusCode);
  //
  //   return userlistModelFromJson(response.body);
  // }




  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body: FutureBuilder<ApiModel>(
        future: ApiResponse().getApiData(),
        builder: (context, snapshot){
          if(snapshot.hasData){
            return Container(
              child: ListView.builder(
                  itemCount: snapshot.data?.weather.length,
                  itemBuilder: (context, index) =>
                      MyCardList(id: "${snapshot.data?.weather[index].id}",
                          name: "${snapshot.data?.weather[index].description}")
              ),

              // child: Text(""+snapshot.data?.weather.),
            );

          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),

    );
  }
}


class MyCardList extends StatefulWidget {

  final String id;
  final String name;


  //final Function function;

  MyCardList({
    required this.id,
    required this.name,

  });


  //const MyCardList({Key? key}) : super(key: key);

  @override
  _MyCardListState createState() => _MyCardListState();
}

class _MyCardListState extends State<MyCardList> {
  @override
  Widget build(BuildContext context) {
    return Container(

      child: Column(
        children:  [

          Text(widget.id),
          Text(widget.name),


        ],

      ),

    );
  }
}

