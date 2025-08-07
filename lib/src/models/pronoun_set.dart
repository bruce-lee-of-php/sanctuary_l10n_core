import 'package:sanctuary_l10n_core/sanctuary_l10n_core.dart';

/// Represents a set of grammatical pronouns.
///
/// This class provides a structured way to handle different pronoun forms
/// and includes metadata for verb conjugation and default gender agreement.
class PronounSet {
  /// The subjective form (e.g., "she", "he", "they").
  final String subjective;

  /// The objective form (e.g., "her", "him", "them").
  final String objective;

  /// The possessive adjective form (e.g., "her", "his", "their").
  final String possessiveAdjective;

  /// The possessive pronoun form (e.g., "hers", "his", "theirs").
  final String possessivePronoun;

  /// The reflexive form (e.g., "herself", "himself", "themself").
  final String reflexive;

  /// A key that points to the correct verb conjugation rules for this pronoun.
  /// e.g., '3rd-person-singular' or '3rd-person-plural'.
  final String conjugationKey;

  /// The default grammatical gender associated with this pronoun, used for
  /// adjective and noun agreement.
  final GrammaticalGender defaultGender;

  const PronounSet({
    required this.subjective,
    required this.objective,
    required this.possessiveAdjective,
    required this.possessivePronoun,
    required this.reflexive,
    required this.conjugationKey,
    required this.defaultGender,
  });

  /// A common string representation, e.g., "she/her".
  @override
  String toString() => '$subjective/$objective';
}
