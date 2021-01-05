part of 'edit_person_cubit.dart';

class EditPersonState extends Equatable {
  const EditPersonState({
    this.firstNames = const FirstNames.pure(),
    this.lastNames = const LastNames.pure(),
    this.status = FormzStatus.pure,
  });

  final FirstNames firstNames;
  final LastNames lastNames;
  final FormzStatus status;

  @override
  List<Object> get props => [firstNames, lastNames];

  EditPersonState copyWith({
    FirstNames firstNames,
    LastNames lastNames,
    FormzStatus status,
  }) {
    return EditPersonState(
      firstNames: firstNames ?? this.firstNames,
      lastNames: lastNames ?? this.lastNames,
      status: status ?? this.status,
    );
  }
}
