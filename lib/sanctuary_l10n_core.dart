/// A pure Dart localization toolkit for queer and trans communities.
///
/// This core package provides the foundational logic and data for handling
/// inclusive language, including a community-vetted glossary and a future
/// grammatical gender engine.
library sanctuary_l10n_core;

// Export the public-facing models of the package.
export 'src/models/grammatical_gender.dart';
export 'src/models/grammatical_number.dart';
export 'src/models/pronoun_set.dart';

// Export the new Grammar Engine.
export 'src/grammar_engine.dart';

// Export the new Vocabulary accessor.
export 'src/vocabulary.dart';
