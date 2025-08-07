/// Represents the grammatical number (singular or plural).
///
/// This enum is used by the grammar engine to select the correct
/// form of a word.
enum GrammaticalNumber {
  /// Represents a single entity.
  singular,

  /// Represents multiple entities.
  plural,
}
