import 'package:covid19_api_app/view/world_states.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatefulWidget {
  String image;
  String name;
  int totalCases,totalRecovered,totalDeaths,active,cirtical,test,todayrecovered,todayDeaths,todayCases;
   DetailsScreen({
     required this.image,
     required this.name,
     required this.totalCases,
     required this.todayrecovered,
     required this.totalDeaths,
     required this.active,
     required this.cirtical,
     required this.totalRecovered,
     required this.test,
     required this.todayDeaths,
     required this.todayCases
});

  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.topCenter,
            children: [
              Padding(
                padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*.067),
                child: Card(
                  child: Column(
                    children: [
                      SizedBox(height: MediaQuery.of(context).size.height*.06,),
                      ReusableRow(title: 'Total Cases', value: widget.totalCases.toString()),
                      ReusableRow(title: 'Recovered', value: widget.totalRecovered.toString()),
                      ReusableRow(title: 'Deaths', value: widget.totalDeaths.toString()),
                      ReusableRow(title: 'Tests', value: widget.test.toString()),
                      ReusableRow(title: 'Active', value: widget.active.toString()),
                      ReusableRow(title: 'Critical', value: widget.cirtical.toString()),
                      ReusableRow(title: 'TodayCases', value: widget.todayCases.toString()),
                      ReusableRow(title: 'TodayRecovered', value: widget.todayrecovered.toString()),
                      ReusableRow(title: 'TodayDeaths', value: widget.todayDeaths.toString()),

                    ],
                  ),
                ),
              ),
              CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(widget.image),
              )
            ],
          )
        ],
      ),
    );
  }
}
