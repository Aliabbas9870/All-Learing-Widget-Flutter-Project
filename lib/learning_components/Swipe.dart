import 'package:flutter/material.dart';

class Swape extends StatelessWidget {
  const Swape({super.key});

  @override
  Widget build(BuildContext context) {

            
              




    PageController controller = PageController(initialPage: 0);
    List<Widget> reel = [
      Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Color.fromARGB(255, 35, 11, 145),
        child: Center(
            child: Text(
          "Welcome!",
          style: TextStyle(
              fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
        )),
      ),
      Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: const Color.fromARGB(255, 72, 84, 121),
      ),
      Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: const Color.fromARGB(255, 85, 72, 121),
      ),
      Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.brown,
      ),
      Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: const Color.fromARGB(255, 76, 121, 72),
      ),
      Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: const Color.fromARGB(255, 17, 118, 136),
        child: Text("Welcome Back"),
      ),
    ];
    bool is_checked = false;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: InkWell(
            onDoubleTap: () {},
            child: Text(
              "Reels",
              style: TextStyle(fontSize: 44),
            )),
        actions: [
          // CheckboxListTile(
          //     title: Text("Hello"),
          //     value: is_checked,
          //     onChanged: (val) {
          //       setState(() {
          //         is_checked = val!;
          //       });
          //     })
        ],
      ),
      body: Container(
        child: PageView(
          scrollDirection: Axis.vertical,
          children: reel,
          controller: controller,
        ),
      ),
    );
  }
}
