import 'package:flutter/material.dart';

class FilterBottomSheet extends StatefulWidget {
  @override
  _FilterBottomSheetState createState() => _FilterBottomSheetState();
}

class _FilterBottomSheetState extends State<FilterBottomSheet> {
  // Define variables to hold filter options
  bool _filterOption1 = false;
  bool _filterOption2 = false;
  bool _filterOption3 = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Wrap(
        children: <Widget>[
          ListTile(
            title: Text('Filter Option 1'),
            leading: Checkbox(
              value: _filterOption1,
              onChanged: (value) {
                setState(() {
                  _filterOption1 = value!;
                });
              },
            ),
          ),
          ListTile(
            title: Text('Filter Option 2'),
            leading: Checkbox(
              value: _filterOption2,
              onChanged: (value) {
                setState(() {
                  _filterOption2 = value!;
                });
              },
            ),
          ),
          ListTile(
            title: Text('Filter Option 3'),
            leading: Checkbox(
              value: _filterOption3,
              onChanged: (value) {
                setState(() {
                  _filterOption3 = value!;
                });
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                // Apply filters
                Navigator.pop(context);
              },
              child: Text('Apply Filters'),
            ),
          ),
        ],
      ),
    );
  }
}
