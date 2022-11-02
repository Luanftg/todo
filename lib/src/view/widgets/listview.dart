import 'package:flutter/material.dart';

final lis = ListView.builder(
    shrinkWrap: true,
    itemCount: 1,
    itemBuilder: ((context, index) {
      return ListTile(
        title: const Text('Titulo teste'),
        subtitle: const Text('descrição'),
        trailing: Checkbox(onChanged: (bool? value) {}, value: false),
      );
    }));
