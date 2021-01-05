import 'package:equatable/equatable.dart';
import 'package:database_repository/database_repository.dart';
import 'package:meta/meta.dart';

/// {@template user}
/// FamilyTree model
///
/// [FamilyTree.empty] represents an uninitialized FamilyTree.
/// {@endtemplate}
class FamilyTree extends Equatable {
  /// {@macro FamilyTree}
  const FamilyTree({
    @required this.id,
    @required this.people,
  }) : assert(id != null);

  /// The FamilyTrees's unique identifier.
  final String id;

  /// List of people belonging to the family tree.
  final List<Person> people;

  /// Empty person which represents an uninitialized Person.
  static FamilyTree empty = FamilyTree(
    id: '',
    people: null
  );

  @override
  List<Object> get props => [id, people];
}
