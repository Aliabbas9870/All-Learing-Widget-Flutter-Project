// ignore_for_file: unnecessary_this

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:ui';

class validationform extends StatelessWidget {
  //const validationform({super.key});

  @override
  final GlobalKey<FormState> _formeKey = GlobalKey<FormState>();
//////////////////
  ///
  ///
  void _submitForm() {
    if (_formeKey.currentState!.validate()) {
      ScaffoldMessenger.of(_formeKey.currentContext!).showSnackBar(
          const SnackBar(content: Text("Form Successful Submit")));
    }
  }

///////////
  ///
  ///
  String? _validateEmail(value) {
    if (value!.isEmpty) {
      return "Please Enter Email";
    }
    RegExp emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}');
    if (!emailRegExp.hasMatch(value)) {
      return "please Enter Valid Email";
    }
    return null;
  }

///////////////
  ///
  ///
  ///
  String? _validPhone(value) {
    if (value!.isEmpty) {
      return "Please Enter a Phone Number ";
    }
    if (value.length != 11) {
      return "Please Enter 11 Digits";
    }
    return null;
  }

  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color.fromARGB(95, 224, 52, 52), ///////////////0xff
            Color.fromARGB(255, 129, 182, 219),
            const Color.fromARGB(179, 230, 202, 202)
          ],
        )),
        width: 600,
        height: 500,
        child: Center(
          child: Form(
              key: _formeKey,
              child: Column(children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                      child: Text(
                    "Welcome!",
                    style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
                  )),
                ),
                SizedBox(
                  height: 12,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 9.0),
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    validator: _validateEmail,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    // validator: (value) {
                    //   if (value!.isEmpty) {
                    //     return "Please Enter Email";
                    //   }
                    //   return null;
                    // },
                    decoration: InputDecoration(
                        labelText: "Email",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(11))),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 9.0),
                  child: TextFormField(
                    obscureText: true,
                    keyboardType: TextInputType.visiblePassword,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please Enter Password";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        labelText: "Password",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(11))),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 9.0),
                  child: TextFormField(
                    validator: _validPhone,
                    // validator: (value) {
                    //   if (value!.isEmpty) {
                    //     return "Please Enter Phone Number";
                    //   }
                    //   return null;
                    // },
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                        labelText: "Phone",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(11))),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal:9.0),
                      child: ElevatedButton(
                          onPressed: _submitForm, child: Text("Ali Abbas")),
                    )),
                TextButton(onPressed: _submitForm, child: Text("Ali"))
              ])),
        ),
      ),
    ));
  }
}

class ListVBS extends StatelessWidget {
  var arrname = [
    'ali ',
    'saba',
    'suriya',
    'saba sani',
    'hoor',
    'junid',
    'abbas',
    'khan ali'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("DeshBor    hgghhgjh  d "), actions: [
        Padding(padding: EdgeInsets.only(top: 15, right: 19)),
        Icon(
          Icons.person,
          size: 26,
          color: Colors.white,
        ),
        SizedBox(
          width: 19,
        ),
        Icon(
          Icons.search,
          size: 26,
          color: Colors.white,
        ),
        PopupMenuButton(
            color: Colors.white,
            //return => /////
            itemBuilder: (context) {
              return [
                //=> /////////////////////////////
                PopupMenuItem(value: 2, child: InkWell(child: Text("Account"))),
                PopupMenuItem(value: 3, child: Text("Linked Device ")),
                PopupMenuItem(value: 4, child: Text("Chate")),
                PopupMenuItem(
                    value: 5, child: InkWell(child: Text("App Language"))),
                PopupMenuItem(value: 6, child: Text("Backup")),
                PopupMenuItem(
                    value: 7, child: InkWell(child: Text("Sitting "))),
                PopupMenuItem(
                    value: 8,
                    child: InkWell(
                        onTap: () {
                          print("Invit Friends Tap");
                        },
                        child: Text("Invite a friend"))),
                PopupMenuItem(
                  child: Text("Helps Action"),
                  value: 9,
                ),
              ];
            }),
        Icon(Icons.offline_bolt),
        Icon(Icons.airline_seat_flat_sharp),
      ]),
      body: Column(
        children: [
          //listview //////////////

          ListView(
            scrollDirection: Axis.horizontal,
            reverse: true,
            children: [
              Text("data"),
              Text("1"),
              Text("cs"),
              Text("2"),
              Text("info"),
              Text("3"),
            ],
          ), //for differet

//ListView.builder   for same design///////////////////////////////////
          ListView.builder(
            itemBuilder: (context, index) {
              return Text(arrname[index]);
            },
            itemCount: arrname.length,
            itemExtent: 20,
            scrollDirection: Axis.vertical,
          ),

//lisrview separat///////////////////////////////
          //
          ListView.separated(
              itemBuilder: (context, index) {
                return Text(arrname[index]);
              },
              separatorBuilder: (context, index) {
                return Divider(
                  height: 5,
                  thickness: 2,
                );
              },
              itemCount: arrname.length)
        ],
      ),
    );
  }
}

class RichTextC extends StatelessWidget {
  const RichTextC({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RichText(
          text: TextSpan(children: [
        TextSpan(text: "Ali Abbas"),
        TextSpan(
            text: "Ali Abbas",
            style: TextStyle(color: Colors.green, fontSize: 20)),
        TextSpan(text: "Ali Abbas"),
      ])),
    );
  }
}

//3 D list Wheel/////////////////////////////////////
class ListScrollW extends StatelessWidget {
  var arrindex = [
    1,
    2,
    3,
    4,
    5,
    6,
    6,
    7,
    7,
    8,
    8,
    9,
    10,
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListWheelScrollView(
          itemExtent: 200,
          children: arrindex
              .map((e) => Container(
                    width: 100,
                  ))
              .toList(),
        ),
      ),
    );
  }
}

//0xff for color //////////////////////
//Gradient Color ////////////////////////////////////
class backgroundGradient extends StatelessWidget {
//  const backgroundGradient({super.key});

  var arrname = [
    "ali saad",
    'dil',
    'sdsds',
    'sba',
    'rubi',
    'ali',
    'rania',
    'ashraf',
    'dasa',
  ];

  var subtile = [
    'kia hall hn',
    'how are you ',
    'ali abbas ',
    'what do u do',
    'okay nice',
    'done',
    'well done ali'
  ];
  var iconsA = [
    Icon(Icons.mobile_friendly),
    Icon(Icons.delete),
    Icon(Icons.shop),
    Icon(Icons.update),
    Icon(Icons.person),
    Icon(Icons.message),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ListView.separated(
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Text("${index + 1}"),
                  title: Text(arrname[index]),
                  subtitle: Text(subtile[index]),
                  // trailing: iconsA[index],
                  trailing: Icon(Icons.add),
                );
              },
              separatorBuilder: (context, index) {
                return Divider(
                  thickness: 1,
                );
              },
              itemCount: arrname.length),
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Colors.black38, ///////////////0xff
                Colors.blue,
              ],
              //   begin: FractionalOffset(0.1, 1.1),
              // end: FractionalOffset(1.1, 0.1),
            )),
          ),
        ],
      ),
    );
  }
}

///Stack Widget ///////////////////////////////////
///
///

class StackC extends StatelessWidget {
  const StackC({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
        image: AssetImage('assets/images/whitflow.jpeg'),
        fit: BoxFit.cover,
      )),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(children: [
          Container(
            padding: EdgeInsets.only(left: 12, top: 13),
            child: Text("Welcome\nBack"),
          ),
          Container(
            //mediaQuery For According Your Mobile Size Select
            padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.3, left: 25),
            child: Form(
              child: Column(
                children: <Widget>[
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,

                    // validator: (String msg){
                    //   if(msg.isEmpty){
                    //     return "Please Enter ";
                    //   }
                    //   if(msg.length!=15){
                    //     return "Only 15 ";
                    //   }
                    //   return null;
                    // },

                    decoration: InputDecoration(
                        hintText: "Email",
                        label: Text("Email"),
                        suffixIcon: IconButton(
                          icon: Icon(Icons.visibility),
                          onPressed: () {},
                        ),
                        fillColor: Colors.grey,
                        filled: true,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(11),
                          borderSide: BorderSide(color: Colors.green, width: 2),
                        ),
                        border: OutlineInputBorder()),
                  ),
                  TextField(
                    obscureText: true,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        hintText: "Password",
                        label: Text("Password"),
                        suffixIcon: IconButton(
                          icon: Icon(Icons.visibility),
                          onPressed: () {},
                        ),
                        fillColor: Colors.grey,
                        filled: true,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(11),
                          borderSide: BorderSide(color: Colors.green, width: 2),
                        ),
                        border: OutlineInputBorder()),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Login",
                  style: TextStyle(
                    fontSize: 40,
                  ),
                ),
                CircleAvatar(
                  backgroundColor: Colors.black,
                  child: Icon(Icons.arrow_forward),
                )
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(onPressed: () {}, child: Text("Register Account")),
                TextButton(onPressed: () {}, child: Text("Forget Password"))
              ],
            ),
          )
        ]),
      ),
    );
  }
}

// Expannd Widget

class ExpandedC extends StatelessWidget {
  const ExpandedC({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Container(
              width: 200,
              height: 200,
              color: Colors.black,
            ),
          ),
          Container(
            width: 100,
            height: 100,
            color: Colors.green,
          ),
          Expanded(
            flex: 2,
            child: Container(
              width: 100,
              height: 100,
              color: Colors.green,
            ),
          ),
          Container(
            width: 100,
            height: 100,
            color: Colors.green,
          ),
        ],
      ),
    );
  }
}

// inkwell //////////////////////////////////////////
//
//

class InkWellC extends StatelessWidget {
  const InkWellC({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          InkWell(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => ButtonsA()));
            },
            child: Hero(
                tag: 'Background',
                child: Image.asset('assets/images/whitflow.jpeg')),
          ),
          Container(
            width: 100,
            height: 99,
            child: InkWell(
                onDoubleTap: () {
                  print("Double Tap");
                },
                onLongPress: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ListScrollW()));
                },
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => StackC()));
                },
                child: Image.asset('assets/images/whit.jpeg')),
          ),
        ],
      ),
    );
  }
}

///alll tyype of button 3 button
///
///

class ButtonsA extends StatefulWidget {
  @override
  State<ButtonsA> createState() => _ButtonsAState();
}

class _ButtonsAState extends State<ButtonsA> {
  String curitemSelect = 'Sada';
  //String newValueSelect='';

  var names = [
    'ali abbas',
    'rshfjd',
    'sfsfsfsf',
    'bcs',
    'fssfsfsf',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Hero(
              tag: 'Background',
              child: Image.asset('assets/images/whitflow.jppeg')),
          TextButton(onPressed: () {}, child: Text("Text Button ")),
          ElevatedButton(
              onPressed: () {},
              child: Text(
                "Elevated Button",
                style: TextStyle(color: Colors.green),
              )),
          OutlinedButton(
              onPressed: () {},
              child: Text(
                "OutlineButton Button",
                style: TextStyle(color: Colors.black),
              )),

          ///////// drop down menu item
          //drop
          DropdownButton<String>(
            items: names.map((String dropDownStringItem) {
              return DropdownMenuItem<String>(
                value: dropDownStringItem,
                child: Text(dropDownStringItem),
              );
            }).toList(),
            onChanged: (newValueSelect) {
              setState(() {
                this.curitemSelect = newValueSelect!;
              });
            },
            value: curitemSelect,
          ),

          // validated
        ],
      ),

      //floating Actiom Btton
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.account_balance_sharp),
        tooltip: "add Item Ali ",
      ),
    );
  }
}

class Facebok extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: CustomScrollView(
      slivers: [
        SliverAppBar(
          //systemOverlayStyle: SystemUiOverlayStyle.dark,
          title: Text(
            "FaceBook Clone",
            style: TextStyle(
              fontSize: 28.0,
              fontWeight: FontWeight.bold,
              letterSpacing: 2.3,
            ),
          ),
          centerTitle: false, floating: true,
          actions: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.search,
                  size: 30,
                  color: Colors.black,
                )),
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.messenger,
                  size: 30,
                  color: Colors.black,
                )),
          ],
        ),
        SliverToBoxAdapter(
          child: Container(
            height: 100,
            child: Column(
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 20,
                      child: Icon(Icons.person),
                    ),
                    Expanded(
                        child: TextField(
                      decoration: InputDecoration.collapsed(
                          hintText: "Whats on your Mind"),
                    ))
                  ],
                ),
                Row(
                  children: [
                    // FlatButton.Icon(onPressed),
                    //  VerticalDivider(width: 9.3,),
                    /// work  copy past
                  ],
                ),
              ],
            ),
          ),
        ),
        SliverPadding(
          padding: EdgeInsets.all(12),
        ),
        SliverToBoxAdapter()
      ],
    ));
  }
}
