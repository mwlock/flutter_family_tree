import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

/// {@template user}
/// Person model
///
/// [Person.empty] represents an uninitialized Person.
/// {@endtemplate}

class Person extends Equatable {
  /// {@macro person}
  const Person(
      {@required this.id,
      @required this.familyTreeId,
      @required this.firstNames,
      @required this.surname,
      @required this.birthDate,
      @required this.deathDate,
      @required this.description,
      @required this.mother,
      @required this.father,
      @required this.spouses,
      @required this.children})
      : assert(id != null),
        assert(familyTreeId != null),
        assert(firstNames != null),
        assert(surname != null),
        assert(birthDate != null),
        assert(description != null);

  /// The person's first name unique identifier.
  final String id;

  /// The unique identifier of the family tree to which the person belongs.
  final String familyTreeId;

  /// The person's first names (includes "middle names").
  final String firstNames;

  /// The person's last name (family name).
  final String surname;

  /// The person's date of birth.
  final DateTime birthDate;

  /// The person's date of death.
  final DateTime deathDate;

  /// General description of who the person is, what they achieved during their lifetime, where they lived, how they died, etc.
  final String description;

  /// Biological mother of the person.
  final Person mother;

  /// Biological father of the person.
  final Person father;

  /// List of spouses to whom the person was commited.
  final List<Person> spouses;

  /// List of children reared by the person.
  final List<Person> children;

  /// Empty person which represents an uninitialized Person.
  static Person empty = Person(
    id: '',
    familyTreeId: '',
    firstNames: '',
    surname: '',
    birthDate: DateTime.now(),
    deathDate: null,
    description: '',
    mother: null,
    father: null,
    spouses: null,
    children: null,
  );

  @override
  List<Object> get props => [
        id,
        familyTreeId,
        firstNames,
        surname,
        birthDate,
        deathDate,
        description,
        mother,
        father,
        spouses,
        children
      ];
}
