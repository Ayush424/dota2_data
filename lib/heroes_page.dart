import 'package:dota2_data/heroes.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
class HeroesPage extends StatefulWidget {
  @override
  _HeroesPageState createState() => _HeroesPageState();
}

class _HeroesPageState extends State<HeroesPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Heroes"),
          leading: IconButton(icon: Icon(Icons.arrow_back), onPressed: null),
          actions: [
            IconButton(icon: Icon(Icons.search), onPressed: null),
          ],
        ),
        body: FutureBuilder(
          future: getJson(),
          builder: (BuildContext context,AsyncSnapshot snapshot){
            debugPrint('${snapshot.hasData}');
            if(snapshot.hasData)
              debugPrint(snapshot.data);
            if(snapshot.data==null){
              return Container(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }
            else{
            return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context,index){
                  return ListTile(
                    title: Text("${snapshot.data[index].localizedName}"),
                  );
                }
            );}
          },
        ),
      ),
    );
  }
}
Future <List<Heroes>> getJson() async {
  String apiUrl = "https://api.opendota.com/api/heroes";
  http.Response response = await http.get(apiUrl);
  List <dynamic> data = jsonDecode(response.body).toList();
  List <Heroes> heroes = data.map<Heroes>((data)=>Heroes.fromJson(data)).toList();
  debugPrint('$heroes');
  return heroes;
}