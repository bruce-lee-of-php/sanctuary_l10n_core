# 0.1.0
* Initial release of the sanctuary_l10n_core package.

* Added GrammaticalGender enum (masculine, feminine, neutral).

* Included proof-of-concept community glossary .arb files for English and Spanish.

# 0.2.0

* **Major Feature:** Added the first version of the SanctuaryL10n grammar engine.

 * Implemented the getAdjective function with initial rules for Spanish.

# 0.3.0

* **Major Feature:** Added the SanctuaryVocabulary class to provide access to curated lists of terminology.

 * Added the PronounSet model for structured handling of pronouns.
 * The grammar engine now supports nouns and articles in addition to adjectives.
 * Added `getNoun()`, `getDefiniteArticle()`, and `getIndefiniteArticle()` functions.
 * Expanded the Spanish rule set to include nouns and articles.

# 0.3.1

* **Major Feature: Intelligent String Formatter**
    * Added the `SanctuaryL10n.format()` function to generate grammatically correct sentences from a template string.
    * Introduced a simple placeholder syntax (e.g., `{noun:friend}`, `{adj:happy}`).
* **Major Feature: Pluralization Support**
    * The grammar engine now supports singular and plural forms.
    * Added `GrammaticalNumber` enum (`singular`, `plural`).
    * The `format()` function now accepts a `number` parameter.
    * Updated all internal rule sets to include plural inflections.
