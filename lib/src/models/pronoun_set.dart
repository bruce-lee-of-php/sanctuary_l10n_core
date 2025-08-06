/// Represents a set of grammatical pronouns.
///
/// This class provides a structured way to handle different pronoun forms
/// (e.g., subjective, objective, possessive).
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

  const PronounSet({
    required this.subjective,
    required this.objective,
    required this.possessiveAdjective,
    required this.possessivePronoun,
    required this.reflexive,
  });

  /// A common string representation, e.g., "she/her".
  @override
  String toString() => '$subjective/$objective';
}
