import 'package:covid19_api_app/services/state_services.dart';
import 'package:covid19_api_app/view/details_screen.dart';
import 'package:covid19_api_app/view/world_states.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CountriesListScreen extends StatefulWidget {
  const CountriesListScreen({Key? key}) : super(key: key);

  @override
  _CountriesListScreenState createState() => _CountriesListScreenState();
}

class _CountriesListScreenState extends State<CountriesListScreen> {

  TextEditingController searchController=TextEditingController();

  @override
  Widget build(BuildContext context) {

    StateServices stateServices=StateServices();

    return Scaffold(
        backgroundColor: Colors.grey,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.black38

      ),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
              controller: searchController,
                onChanged: (value){
                setState(() {

                });
                },
                decoration: InputDecoration(
                  contentPadding:const EdgeInsets.symmetric(horizontal: 20),
                   hintText: "Search with country name",
                   border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50.0)
                   )
                ),
              ),
            ),
            Expanded(
                child: FutureBuilder(
                  future: stateServices.countrylistRecord(),
                  builder: (context,AsyncSnapshot<List<dynamic>> snapshot){

                   print("Kawchar"+snapshot.data.toString());

                    if(!snapshot.hasData){
                      return ListView.builder(
                          itemCount: 15,
                          itemBuilder: (context,index){
                            return Shimmer.fromColors(
                                baseColor: Colors.grey.shade700,
                                highlightColor: Colors.grey.shade100,
                                child: Column(
                                  children: [
                                    ListTile(
                                      title: Container(height: 10,width: 80,color: Colors.white,),
                                      subtitle: Container(height: 10,width: 80,color: Colors.white,),
                                      leading: Container(height: 50,width: 50,color: Colors.white,),
                                    )
                                  ],
                                ),
                            );

                          });
                    }else{
                      return ListView.builder(
                        itemCount: snapshot.data!.length,
                          itemBuilder: (context,index){

                          String name=snapshot.data![index]['country'];

                         if(searchController.text.isEmpty){
                           return InkWell(
                             onTap: (){
                               Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailsScreen(

                                 image: snapshot.data![index]['countryInfo']['flag'],
                                 name:snapshot.data![index]['country'],
                                 totalCases: snapshot.data![index]['cases'],
                                 totalRecovered: snapshot.data![index]['recovered'],
                                 totalDeaths: snapshot.data![index]['deaths'],
                                 test: snapshot.data![index]['tests'],
                                 active: snapshot.data![index]['active'],
                                 cirtical: snapshot.data![index]['critical'],
                                 todayCases: snapshot.data![index]['todayCases'],
                                 todayrecovered: snapshot.data![index]['todayRecovered'],
                                 todayDeaths: snapshot.data![index]['todayDeaths'],



                               )));
                             },
                             child: Column(
                               children: [
                                 ListTile(
                                   title: Text(snapshot.data![index]['country']),
                                   subtitle: Row(
                                     children: [
                                       Text("Total infected :"),
                                       Text(snapshot.data![index]['cases'].toString()),
                                     ],
                                   ),
                                   leading: Image(
                                       height: 50,
                                       width: 50,
                                       image: NetworkImage(
                                           snapshot.data![index]['countryInfo']['flag']
                                       )),
                                 )
                               ],
                             ),
                           );
                         }else if(name.toLowerCase().contains(searchController.text.toLowerCase())){
                            return Column(
                              children: [
                                InkWell(
                                  onTap: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailsScreen(

                                      image: snapshot.data![index]['countryInfo']['flag'],
                                      name:snapshot.data![index]['country'],
                                      totalCases: snapshot.data![index]['cases'],
                                      totalRecovered: snapshot.data![index]['recovered'],
                                      totalDeaths: snapshot.data![index]['deaths'],
                                      test: snapshot.data![index]['tests'],
                                      active: snapshot.data![index]['active'],
                                      cirtical: snapshot.data![index]['critical'],
                                      todayCases: snapshot.data![index]['todayCases'],
                                      todayrecovered: snapshot.data![index]['todayRecovered'],
                                      todayDeaths: snapshot.data![index]['todayDeaths'],



                                    )));
                                  },
                                  child: ListTile(
                                    title: Text(snapshot.data![index]['country']),
                                    subtitle: Row(
                                      children: [
                                        Text("Total infected :"),
                                        Text(snapshot.data![index]['cases'].toString()),
                                      ],
                                    ),
                                    leading: Image(
                                        height: 50,
                                        width: 50,
                                        image: NetworkImage(
                                            snapshot.data![index]['countryInfo']['flag']
                                        )),
                                  ),
                                )
                              ],
                            );
                          }else{
                            return Container();
                          }

                          });
                    }

                  },
                )
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: Text('State Details'),
          onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>WorldStates()));
          }
      ),
    );
  }
}
