import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

enum Relationship {
  Friend,
  OneDate,
  Ongoing,
  Committed,
  Marriage,
  Single,
  Divorced,
}

Map<Relationship, String> show = {
  Relationship.Friend: "Friend",
  Relationship.OneDate: "One date",
  Relationship.Ongoing: "Ongoing relationship",
  Relationship.Committed: "Committed relationship",
  Relationship.Marriage: "Marriage",
  Relationship.Single: "Single",
  Relationship.Divorced: "Divorced",
};

List<DropdownMenuItem<Relationship>> _relationshipsList = [
  DropdownMenuItem(
    value: Relationship.Friend,
    child: Text(show[Relationship.Friend] as String),
  ),
  DropdownMenuItem(
    value: Relationship.OneDate,
    child: Text(show[Relationship.OneDate] as String),
  ),
  DropdownMenuItem(
    value: Relationship.Ongoing,
    child: Text(show[Relationship.Ongoing] as String),
  ),
  DropdownMenuItem(
    value: Relationship.Committed,
    child: Text(show[Relationship.Committed] as String),
  ),
  DropdownMenuItem(
    value: Relationship.Marriage,
    child: Text(show[Relationship.Marriage] as String),
  ),
  DropdownMenuItem(
    value: Relationship.Single,
    child: Text(show[Relationship.Single] as String),
  ),
  DropdownMenuItem(
    value: Relationship.Divorced,
    child: Text(show[Relationship.Divorced] as String),
  ),
];

class DropPage extends StatefulWidget {
  const DropPage({Key? key}) : super(key: key);

  @override
  State<DropPage> createState() => _DropPageState();
}

class _DropPageState extends State<DropPage> {
  Relationship? _relationshipDropdownValue;
// And later in the program ...
  /// Build
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          title: Text(
            'Relationship Status',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: Colors.orange.shade700,
            ),
          ),
          centerTitle: true,
          systemOverlayStyle: SystemUiOverlayStyle.dark,
          elevation: 0.0,
          backgroundColor: Colors.white,
          actions: [
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.tiktok),
              iconSize: 30,
              color: Theme.of(context).primaryColorDark,
            ),
          ]),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 28.0,
        ),
        child: Container(
            margin: const EdgeInsets.all(20),
            padding: const EdgeInsets.only(
              bottom: 1,
              top: 1,
              left: 1,
              right: 1,
            ),
            height: 300,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  offset: Offset(0, 2),
                  blurRadius: 8,
                ),
              ],
            ),
            child: ListView.builder(
              itemCount: 3,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: _buildDropdownButtonRow(),
                    ),
                    _buildResultsImage(),
                  ],
                );
              },
            )),
      ),
    );
  }

  Widget _buildDropdownButtonRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        DropdownButton<Relationship>(
          icon: Icon(Icons.tag_faces),
          items: _relationshipsList,
          onChanged: _updateRelationshipDropdown as dynamic,
          value: _relationshipDropdownValue,
          hint: const Text("Select Your Status"),
        ),
        if (_relationshipDropdownValue != null)
          Flexible(
            child: FlatButton(
              onPressed: _reset,
              child: const Text(
                "Reset",
                style: TextStyle(color: Colors.blue),
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildResultsImage() {
    if (_relationshipDropdownValue != null) {
      return Image.asset((_relationshipDropdownValue!.index >= 3)
          ? "assets/images/Model Man.png"
          : "assets/images/travel-concept-close-up-portrait-young-beautiful-attractive-redhair-girl-wtih-t.png");
    } else {
      return const SizedBox();
    }
  }

  /// Actions
  void _reset() {
    setState(() {
      _relationshipDropdownValue = null as Relationship;
    });
  }

  _updateRelationshipDropdown(Relationship newValue) {
    setState(() {
      _relationshipDropdownValue = newValue;
    });
  }
}
