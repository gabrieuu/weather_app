import 'package:flutter/material.dart';
import 'package:weather_app/utils/colors.dart';

class ViewForecast extends StatelessWidget {
  const ViewForecast({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blue,
        body: NestedScrollView(
      headerSliverBuilder: (context, innerBoxIsScrolled) => [
        SliverAppBar(
          pinned: true,
          snap: true,
          floating: true,
          backgroundColor: blue,
          expandedHeight: 200,
          flexibleSpace: Container(
            decoration: BoxDecoration(
              color: darkBlue,
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20))
            ),
            child: FlexibleSpaceBar(

              centerTitle: true,
              title: Text("data"),
            ),
          ),
          
        )
      ],
      body: ListView.separated(
        itemBuilder: (context, index) {
          return ListTile(
            title: Text("$index"),
          );
        },
        separatorBuilder: (context, index) => SizedBox(
          height: 20,
        ),
        itemCount: 30,
      ),
    ));
  }

  _appbar() {
    return AppBar(
      title: Text("teste"),
      flexibleSpace: Container(
        height: 100,
        color: darkBlue,
      ),
    );
  }
}
