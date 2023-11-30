import 'package:flutter/material.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

class Animal {
  final int id;
  final String name;

  Animal({
    required this.id,
    required this.name,
  });
}

class selectOpetion extends StatefulWidget {
  @override
  _selectOpetionState createState() => _selectOpetionState();
}

class _selectOpetionState extends State<selectOpetion> {
  static List<Animal> _animals = [
    Animal(id: 1, name: "Lion"),
    Animal(id: 2, name: "Flamingo"),
    // ... (your animal list)
  ];

  final _items = _animals
      .map((animal) => MultiSelectItem<Animal>(animal, animal.name))
      .toList();

  List<Animal> _selectedAnimals2 = [];
  List<Animal> _selectedAnimals3 = [];
  List<Animal> _selectedAnimals5 = [];

  final _multiSelectKey = GlobalKey<FormFieldState>();
  final _multiSelectKey2 = GlobalKey<FormFieldState>();
  final _multiSelectKey3 = GlobalKey<FormFieldState>();

  @override
  void initState() {
    _selectedAnimals5 = _animals;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome"),
      ),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              SizedBox(height: 40),

              MultiSelectDialogField(
                key: _multiSelectKey,
                items: _items,
                title: Text("Animals"),
                selectedColor: Colors.blue,
                decoration: BoxDecoration(
                  color: Colors.blue.withOpacity(0.1),
                  borderRadius: BorderRadius.all(Radius.circular(40)),
                  border: Border.all(
                    color: Colors.blue,
                    width: 2,
                  ),
                ),
                buttonIcon: Icon(
                  Icons.pets,
                  color: Colors.blue,
                ),
                buttonText: Text(
                  "Favorite Animals",
                  style: TextStyle(
                    color: Colors.blue[800],
                    fontSize: 16,
                  ),
                ),
                onConfirm: (results) {
                  // Handle confirmed results if needed
                },
              ),
              SizedBox(height: 50),

              Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor.withOpacity(.4),
                  border: Border.all(
                    color: Theme.of(context).primaryColor,
                    width: 2,
                  ),
                ),
                child: Column(
                  children: <Widget>[
                    MultiSelectBottomSheetField(
                      key: _multiSelectKey2,
                      initialChildSize: 0.4,
                      listType: MultiSelectListType.CHIP,
                      searchable: true,
                      buttonText: Text("Favorite Animals"),
                      title: Text("Animals"),
                      items: _items,
                      onConfirm: (values) {
                        // setState(() {
                        //   _selectedAnimals2 = values;
                        // });
                      },
                      chipDisplay: MultiSelectChipDisplay(
                        onTap: (value) {
                          setState(() {
                            _selectedAnimals2.remove(value);
                          });
                        },
                      ),
                    ),
                    _selectedAnimals2 == null || _selectedAnimals2.isEmpty
                        ? Container(
                            padding: EdgeInsets.all(10),
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "None selected",
                              style: TextStyle(color: Colors.black54),
                            ))
                        : Container(),
                  ],
                ),
              ),
              SizedBox(height: 40),

              MultiSelectBottomSheetField<Animal>(
                key: _multiSelectKey3,
                initialChildSize: 0.7,
                maxChildSize: 0.95,
                title: Text("Animals"),
                buttonText: Text("Favorite Animals"),
                items: _items,
                searchable: true,
                validator: (values) {
                  if (values == null || values.isEmpty) {
                    return "Required";
                  }
                  List<String> names = values.map((e) => e.name).toList();
                  if (names.contains("Frog")) {
                    return "Frogs are weird!";
                  }
                  return null;
                },
                onConfirm: (values) {
                  setState(() {
                    _selectedAnimals3 = values;
                  });
                  _multiSelectKey3.currentState?.validate();
                },
                chipDisplay: MultiSelectChipDisplay(
                  onTap: (item) {
                    setState(() {
                      _selectedAnimals3.remove(item);
                    });
                    _multiSelectKey3.currentState?.validate();
                  },
                ),
              ),
              SizedBox(height: 40),

              MultiSelectChipField(
                items: _items,
                initialValue: [_animals[4], _animals[7], _animals[9]],
                title: Text("Animals"),
                headerColor: Colors.blue.withOpacity(0.5),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 1.8),
                ),
                selectedChipColor: Colors.blue.withOpacity(0.5),
                selectedTextStyle: TextStyle(color: Colors.blue[800]),
                onTap: (values) {
                  // Handle chip field tap if needed
                },
              ),
              SizedBox(height: 40),

              MultiSelectDialogField(
                key: _multiSelectKey,
                onConfirm: (val) {
                  setState(() {
                    _selectedAnimals5 = val;
                  });
                },
                dialogWidth: MediaQuery.of(context).size.width * 0.7,
                items: _items,
                initialValue: _selectedAnimals5,
              ),
            ],
          ),
        ),
      ),
    );
  }
}


