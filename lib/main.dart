import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Monthly List Search',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MonthlyListSearch(),
    );
  }
}

class MonthlyListSearch extends StatefulWidget {
  @override
  _MonthlyListSearchState createState() => _MonthlyListSearchState();
}

class _MonthlyListSearchState extends State<MonthlyListSearch> {
  TextEditingController _searchController = TextEditingController();
  List<String> months = [
    "January",
    "February",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "October",
    "November",
    "December"
  ];
  List<String> filteredMonths = [];

  @override
  void initState() {
    super.initState();
    filteredMonths.addAll(months);
  }

  void filterMonths(String query) {
    setState(() {
      filteredMonths = months
          .where((month) => month.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading:  Icon(Icons.search),
        backgroundColor: Colors.cyan,
        title: TextField(
          controller: _searchController,
          onChanged: filterMonths,
          decoration: const InputDecoration(
            hintText: 'Search...',
            border: InputBorder.none,
            hintStyle: TextStyle(color: Colors.white),
          ),
          style: const TextStyle(color: Colors.white),
        ),
      ),
      body: ListView.builder(
        itemCount: filteredMonths.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(filteredMonths[index]),
          );
        },
      ),
    );
  }
}
