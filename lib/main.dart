import 'package:flutter/material.dart';
import 'package:excel/excel.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

void main() {
  runApp(PunchInOutApp());
}

class PunchInOutApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Punch In/Out',
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.blue,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
          ),
        ),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.teal,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
          ),
        ),
      ),
      themeMode: ThemeMode.system,
      home: PunchInOutScreen(),
    );
  }
}

class PunchInOutScreen extends StatefulWidget {
  @override
  _PunchInOutScreenState createState() => _PunchInOutScreenState();
}

class _PunchInOutScreenState extends State<PunchInOutScreen> {
  List<Map<String, String>> records = [];
  bool isPunchedIn = false;

  void _punchInOut(String type) {
    if (type == 'Punch In' && isPunchedIn) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('You must punch out before punching in again.')),
      );
      return;
    }

    if (type == 'Punch Out' && !isPunchedIn) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('You must punch in before punching out.')),
      );
      return;
    }

    setState(() {
      records.add({
        'Type': type,
        'Time': DateTime.now().toString(),
      });
      isPunchedIn = type == 'Punch In';
    });
  }

  Future<void> _exportToExcel() async {
    var excel = Excel.createExcel();
    Sheet sheet = excel["PunchRecords"];

    // Adding headers
    sheet.appendRow(["Type", "Time"]);

    // Adding records
    for (var record in records) {
      sheet.appendRow([record['Type'], record['Time']]);
    }

    // Save to file
    Directory? directory = await getExternalStorageDirectory();
    String filePath = "${directory?.path}/PunchRecords.xlsx";
    File(filePath)
      ..createSync(recursive: true)
      ..writeAsBytesSync(excel.encode()!);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Exported to $filePath")),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Punch In/Out'),
        actions: [
          IconButton(
            icon: Icon(Icons.download),
            onPressed: _exportToExcel,
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: records.length,
                itemBuilder: (context, index) {
                  var record = records[index];
                  return Card(
                    elevation: 4,
                    margin: EdgeInsets.symmetric(vertical: 8),
                    child: ListTile(
                      leading: Icon(
                        record['Type'] == 'Punch In'
                            ? Icons.login
                            : Icons.logout,
                        color: Theme.of(context).primaryColor,
                      ),
                      title: Text(record['Type']!),
                      subtitle: Text(record['Time']!),
                    ),
                  );
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () => _punchInOut('Punch In'),
                  child: Text('Punch In'),
                ),
                ElevatedButton(
                  onPressed: () => _punchInOut('Punch Out'),
                  child: Text('Punch Out'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
