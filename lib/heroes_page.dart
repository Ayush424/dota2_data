import 'package:dota2_data/heroes.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'package:cached_network_image/cached_network_image.dart';

class HeroesPage extends StatefulWidget {
  @override
  _HeroesPageState createState() => _HeroesPageState();
}
String imgUrl ="http://cdn.dota2.com";
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
                    leading: CircleAvatar(child:CachedNetworkImage(
                      imageUrl: "http://cdn.dota2.com/apps/dota2/images/heroes/antimage_icon.png",
                      progressIndicatorBuilder: (context, url, downloadProgress) =>
                          CircularProgressIndicator(value: downloadProgress.progress),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ), ),
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
  String apiUrl = "https://api.opendota.com/api/heroStats";
  http.Response response = await http.get(apiUrl);
  List <dynamic> data = jsonDecode(response.body);
  List <Heroes> heroes= data.map((e) => Heroes.fromJson(e)).toList();
  return heroes;
}


