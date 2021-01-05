import 'package:family_tree/family_tree/family_tree.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

part 'edit_person_state.dart';

class EditPersonCubit extends Cubit<EditPersonState> {
  EditPersonCubit() : super(const EditPersonState());

  void firstNamesChanged(String value) {
    final firstNames = FirstNames.dirty(value);
    emit(state.copyWith(
      firstNames: firstNames,
      status: Formz.validate([
        firstNames,
      ]),
    ));
  }

  void lastNamesChanged(String value) {
    print("test");
    final lastNames = LastNames.dirty(value);
    print(
      Formz.validate([
        lastNames,
      ]),
    );
    emit(state.copyWith(
      lastNames: lastNames,
      status: Formz.validate([
        lastNames,
        state.firstNames,
      ]),
    ));
  }
}
