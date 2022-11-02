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
            const SizedBox(
              height: 50,
            ),
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
                setState(() {
                  _homeController.createTodo(
                    TodoModel(
                        title: _titleEditingController.text,
                        description: _descriptionEditingController.text),
                  );
                });
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
                          Text todoTitle = Text(snapshot.data![index].title);

                          return ListTile(
                            title: todoTitle,
                            subtitle: Text(
                              snapshot.data![index].description,
                            ),
                            trailing: Checkbox(
                              onChanged: (value) {
                                value = true;
                                if (value == true) {
                                  todoTitle.style?.color?.withGreen(240);
                                } else {
                                  todoTitle.style?.color?.withGreen(0);

                                  value = false;
                                }
                                print('check!');
                                value = true;
                                setState(() {});
                              },
                              value: snapshot.data![index].isDone ?? false,
                            ),
                          );
                        })
                  ];
                } else if (snapshot.hasError) {
                  children = <Widget>[
                    const Text("Erro ao ler as tarefas!"),
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
                      child: Text('Aguardando Resultado...'),
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
