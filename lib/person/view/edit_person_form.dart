import 'package:family_tree/person/cubit/edit_person_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditPersonForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10.0),
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              color: Colors.grey.withAlpha(40),
              child: Row(
                children: [
                  Flexible(
                    flex: 2,
                    fit: FlexFit.tight,
                    child: CircleAvatar(
                      radius: 40,
                      backgroundColor: Colors.grey,
                    ),
                  ),
                  Flexible(
                    flex: 6,
                    fit: FlexFit.tight,
                    child: Container(
                      color: Colors.grey.withAlpha(40),
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _FirstNamesInput(),
                          _LastNamesInput(),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 15),
              color: Colors.grey.withAlpha(40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('Birthdate'),
                  Text(' ->'),
                  Text('Deathdate'),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 15),
              color: Colors.grey.withAlpha(40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('Add Mother'),
                  Text('Add Father'),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 15),
              color: Colors.grey.withAlpha(40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('Add Spouses'),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 15),
              color: Colors.grey.withAlpha(40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('Add Children'),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 15),
              color: Colors.grey.withAlpha(40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: TextField(
                      keyboardType: TextInputType.multiline,
                      maxLines: 10,
                      decoration: InputDecoration(
                        alignLabelWithHint: true,
                        hintText: 'Description',
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _FirstNamesInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EditPersonCubit, EditPersonState>(
      buildWhen: (prev, current) => prev.firstNames != current.firstNames,
      builder: (context, state) {
        return TextField(
          key: const Key('editPersonForm_firstNameInput_textField'),
          onChanged: (firstNames) =>
              context.read<EditPersonCubit>().firstNamesChanged(firstNames),
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(horizontal: 8),
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            hintText: 'First Names',
            errorText: state.firstNames.invalid ? 'Invalid First Names' : null,
          ),
        );
      },
    );
  }
}

class _LastNamesInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EditPersonCubit, EditPersonState>(
      buildWhen: (prev, current) => prev.lastNames != current.lastNames,
      builder: (context, state) {
        return TextField(
          key: const Key('editPersonForm_lastNameInput_textField'),
          onChanged: (lastNames) =>
              context.read<EditPersonCubit>().lastNamesChanged(lastNames),
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(horizontal: 8),
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            hintText: 'Last Names',
            labelStyle: TextStyle(color: Colors.red),
            errorText: state.lastNames.invalid ? 'Invalid Last Names' : null,
          ),
        );
      },
    );
  }
}
