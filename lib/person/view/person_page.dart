import 'package:family_tree/person/cubit/edit_person_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:family_tree/person/person.dart';
import 'edit_person_form.dart';

class PersonPage extends StatelessWidget {
  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => PersonPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Person'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: BlocProvider<EditPersonCubit>(
          // One time lookup, similar to "listen:false" for provider
          create: (_) => EditPersonCubit(),
          child: EditPersonForm(),
        ),
      ),
    );

    // EditPersonForm(),
  }
}
