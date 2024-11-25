
import 'package:flutter/material.dart';
import 'package:mid_flutter/data/data.dart';
import 'package:mid_flutter/main.dart';
import 'package:mid_flutter/screen/new_studant.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Studant app"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Studant list :"),
                ElevatedButton(
                    onPressed: () {
                      setState(() {});
                    },
                    child: const Text("updata list"))
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            studantList.length != 0
                ? Expanded(
                    child: ListView.builder(
                      itemCount: studantList.length,
                      itemBuilder: (context, index) => Container(
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.all(5),
                        decoration: BoxDecoration(color: Colors.blue),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ElevatedButton(
                                onPressed: () {
                                  TextEditingController markControoler =
                                      TextEditingController();
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        title: Text("Add new mark"),
                                        content: TextField(
                                          controller: markControoler,
                                          decoration: const InputDecoration(
                                              labelText: "mark"),
                                        ),
                                        actions: [
                                          ElevatedButton(
                                              onPressed: () {
                                                if (markControoler
                                                    .text.isNotEmpty) {
                                                  setState(() {
                                                    studantList[index]
                                                        .marks
                                                        .add(int.parse(
                                                            markControoler
                                                                .text));
                                                  });
                                                }
                                              },
                                              child: const Text("add"))
                                        ],
                                      );
                                    },
                                  );
                                },
                                child: const Text("Add mark")),
                            GestureDetector(
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: Text("Studant info"),
                                      content:
                                          Text(studantList[index].toString()),
                                          actions: [ElevatedButton(onPressed: (){
                                            Navigator.of(context).pop();
                                          }, child: Text("Close"))],
                                    );
                                  },
                                );
                              },
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(studantList[index].name),
                                  Text("ID: ${studantList[index].id}"),
                                  SizedBox(
                                    width: 200,
                                    child: Row(
                                      children: [
                                        const Text("Marks: "),
                                        for (int i = 0;
                                            i < studantList[index].marks.length;
                                            i++)
                                          Text(
                                              " ${studantList[index].marks[i]} "),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            IconButton(
                                onPressed: () {
                                  setState(() {
                                    studantList.removeAt(index);
                                  });
                                },
                                icon: Icon(Icons.delete))
                          ],
                        ),
                      ),
                    ),
                  )
                : Text("no studant in the live")
          ],
        ),
      ),
      floatingActionButton: Align(
          alignment: Alignment.bottomCenter,
          child: ElevatedButton(
            onPressed: () {
              Navigator.of(context)
                  .pushNamed("/addStudant")
                  .then<bool>(
                (value) {
                  if (value == true) {
                    setState(() {});
                  }
                  return false;
                },
              );
            },
            child: const Text("add studant"),
          )),
    );
  }
}
