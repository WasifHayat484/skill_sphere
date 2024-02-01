import 'package:flutter/material.dart';
import 'package:skill_sphere/db_handler.dart';
import 'package:skill_sphere/notes.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DBHelper? dbHelper;
  late Future<List<NotesModel>> notesList;

  @override
  void initState() {
    super.initState();
    dbHelper = DBHelper();
    loadData();
  }

  loadData() async {
    notesList = dbHelper!.getNotesList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notes SQL'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder<List<NotesModel>>(
              future: notesList,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(child: Text('No Notes Available'));
                } else {
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    reverse: false,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      final note = snapshot.data![index];
                      return InkWell(
                        onTap: () {
                          dbHelper!.update(
                            NotesModel(
                              id: snapshot.data![index].id,
                              title: 'First Flutter Note',
                              age: 11,
                              description: 'let me talk to you tomorrow',
                              email: 'abcde',
                            ),
                          );
                          setState(() {
                            notesList = dbHelper!.getNotesList();
                          });
                        },
                        child: Dismissible(
                          direction: DismissDirection.endToStart,
                          background: Container(
                            color: Colors.red,
                            child: const Icon(Icons.delete_forever),
                          ),
                          onDismissed: (DismissDirection direction) {
                            setState(() {
                              // Remove the note from the list
                              dbHelper!.delete(snapshot.data![index].id!);
                              // Refresh the list
                              notesList = dbHelper!.getNotesList();
                              snapshot.data!.remove(snapshot.data![index]);
                            });
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Note deleted'),
                              ),
                            );
                          },
                          key: ValueKey<int>(snapshot.data![index].id!),
                          child: ListTile(
                            title: Text(note.title.toString()),
                            subtitle: Text(note.description.toString()),
                            trailing: Text(note.age.toString()),
                          ),
                        ),
                      );
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          dbHelper!.insert(
            NotesModel(
              title: 'Second Note',
              age: 22,
              description: 'This is My First SQL app',
              email: 'malikwasifwww@gmail.com',
            ),
          ).then((value) {
            print('Data added');
            setState(() {
              notesList = dbHelper!.getNotesList();
            });
          }).catchError((error) {
            print(error.toString());
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
