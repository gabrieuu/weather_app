import 'package:flutter/material.dart';
import 'package:weather_app/utils/colors.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  bool onVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blue,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                Container(
                  constraints: const BoxConstraints(
                    maxWidth: 200,
                    maxHeight: 200
                  ),
                  child: Image.asset('assets/clima/29.png')
                  ),
                _title(),
              ],
            ),
            onVisible ? searchCity() : _buttonStart()
          ],
        ),
      ),
    );
  }

  Widget _buttonStart() {
    return Column(
      children: [
        const SizedBox(height: 30,),
        ElevatedButton(
          onPressed: () {
            setState(() {
              onVisible = true;
            });
          },
          style: ElevatedButton.styleFrom(
              fixedSize: const Size.fromWidth(200),
              padding: const EdgeInsets.symmetric(vertical: 20),
              backgroundColor: Colors.orange[400],
              ),
          child: const Text(
            "Get Start",
            style: TextStyle(
                fontSize: 20, color: darkBlue, fontWeight: FontWeight.bold),

          ),
              
        ),
      ],
    );
  }

  Widget searchCity() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: white, style: BorderStyle.solid)
                ),
                hintText: "Digite o nome de uma Cidade",
                hintStyle: const TextStyle(color: white, fontWeight: FontWeight.w300),
                
            ),
            style: const TextStyle(
              color: white
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, "/homepage");
              
            },
            style: ElevatedButton.styleFrom(
              fixedSize: const Size.fromWidth(180),
              padding: const EdgeInsets.symmetric(vertical: 20),
              backgroundColor: Colors.orange[400],
            ),
            child: const Text(
              "Get Forecast",
              style: TextStyle(
                  fontSize: 15, color: darkBlue, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }

  Widget _title() {
    return Wrap(
      spacing: -20,
      direction: Axis.vertical,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        const Text(
          "Weather",
          style: TextStyle(
              color: white, fontSize: 50, fontWeight: FontWeight.w700),
        ),
        Text(
          "ForeCasts",
          style: TextStyle(
              color: Colors.orange[400],
              fontSize: 55,
              fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}
