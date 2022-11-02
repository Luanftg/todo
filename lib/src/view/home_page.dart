import 'package:flutter/material.dart';
import 'package:todo/src/controller/home_controller.dart';

import '../model/todo_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeController _homeController = HomeController();
  final TextEditingController _titleEditingController = TextEditingController();
  final TextEditingController _descriptionEditingController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Form(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              controller: _titleEditingController,
              decoration: const InputDecoration(
                  hintText: 'Informe o título da tarefa:'),
            ),
            TextFormField(
              controller: _descriptionEditingController,
              decoration: const InputDecoration(
                  hintText: 'Informe a descrição da tarefa:'),
            ),
            ElevatedButton(
              onPressed: () {
                _homeController.createTodo(
                  TodoModel(
                      title: _titleEditingController.text,
                      description: _descriptionEditingController.text),
                );
                setState(() {});
              },
              child: const Text('Cadastrar'),
            ),
            const SizedBox(
              height: 50,
            ),
            FutureBuilder(
              future: _homeController.getList(),
              builder: ((context, snapshot) {
                List<Widget> children;

                if (snapshot.hasData) {
                  children = <Widget>[
                    ListView.builder(
                        shrinkWrap: true,
                        itemCount: snapshot.data!.length,
                        itemBuilder: (BuildContext context, int index) {
                          return ListTile(
                            title: Text(snapshot.data![index].title),
                            subtitle: Text(
                              snapshot.data![index].description,
                            ),
                            trailing: Checkbox(
                              onChanged: (value) {},
                              value: snapshot.data![index].isDone ?? false,
                            ),
                          );
                        })
                  ];
                } else if (snapshot.hasError) {
                  children = <Widget>[
                    const Text("error"),
                  ];
                } else {
                  children = const <Widget>[
                    SizedBox(
                      width: 60,
                      height: 60,
                      child: CircularProgressIndicator(),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 16),
                      child: Text('Awaiting result...'),
                    ),
                  ];
                }
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: children,
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
