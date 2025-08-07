```markdown
# Sanctuary L10n Core 🏳️‍⚧️🏳️‍🌈

A pure Dart localization toolkit for queer and trans communities, making inclusive language the default, not the exception.

This is a low-level, pure Dart package containing the core logic and translation data. For a more user-friendly experience in Flutter apps, see the upcoming `flutter_sanctuary` package.

## Mission

Building inclusive apps is hard. Handling localization (l10n) for queer and trans communities is even harder. It requires deep linguistic knowledge, community consultation, and complex logic to handle things like grammatical gender.

`sanctuary_l10n_core` is an open-source toolkit that solves these problems. We provide:

* **A Community-Vetted Vocabulary:** Curated lists of pronouns, gender identities, and sexualities.
* **A Grammatical Gender Engine:** A powerful set of tools to handle gender agreement in languages like Spanish, French, and German.

This package saves developers time, reduces errors, and promotes a higher standard of inclusivity across the entire ecosystem.

## Features

* **Curated Vocabulary:** Access lists of pronouns (`PronounSet`), gender identities, and sexualities.
* **Random Data Generation:** Easily generate random data for testing and mockups.
* **Intelligent String Formatting:** Use template strings to generate grammatically correct, gender-affirming sentences in both singular and plural forms.

## Getting Started

Add the dependency to your `pubspec.yaml`:
```yaml
dependencies:
  sanctuary_l10n_core: ^0.3.0 # Or the latest version
```

## Usage

### 1. Accessing Vocabulary

The `SanctuaryVocabulary` class provides access to the package's curated lists of terms.

```dart
import 'package:sanctuary_l10n_core/sanctuary_l10n_core.dart';

void main() {
  final vocabulary = SanctuaryVocabulary();

  // Get a list of all pronoun sets
  final pronouns = vocabulary.pronouns.all();
  print(pronouns.first.subjective); // "she"

  // Get a random gender identity
  final gender = vocabulary.randomGender();
  print(gender); // e.g., "Non-binary"
}
```

### 2. Using the Grammar Engine with `format()`

The `SanctuaryL10n.format()` function is the most powerful feature of the package. It allows you to generate grammatically correct sentences using a simple template syntax.

**Template Syntax:**
Placeholders in the template should follow the format `{type:base_word}` or `{type}` for articles.
* **Nouns:** `{noun:friend}`
* **Adjectives:** `{adj:happy}`
* **Articles:** `{def_article}` (for "the") and `{indef_article}` (for "a/an").

**Example:**

```dart
import 'package:sanctuary_l10n_core/sanctuary_l10n_core.dart';

void main() {
  final locale = 'es'; // Set the language to Spanish

  // --- Singular Example ---
  final singularTemplate = '{def_article} {noun:developer} está {adj:happy}.';
  final singularResult = SanctuaryL10n.format(
    singularTemplate,
    locale: locale,
    gender: GrammaticalGender.feminine,
    number: GrammaticalNumber.singular,
  );
  print(singularResult); // Prints: "la desarrolladora está contenta."

  // --- Plural Example ---
  final pluralTemplate = '{def_article} {noun:friend} son {adj:happy}.';
  final pluralResult = SanctuaryL10n.format(
    pluralTemplate,
    locale: locale,
    gender: GrammaticalGender.masculine,
    number: GrammaticalNumber.plural,
  );
  print(pluralResult); // Prints: "los amigos son contentos."
}
```

---

## Details: A Deeper Look

### What It Does: Core Functionality

At its heart, `sanctuary_l10n_core` is a pure Dart library that provides two key pieces of functionality: a **curated vocabulary** and a **basic grammar engine**.

* **The Vocabulary (`SanctuaryVocabulary`):** A read-only database of community-vetted, inclusive terminology. It provides structured `PronounSet` objects (containing all 5 grammatical forms), simple `List<String>` collections for gender identities and sexualities, and helper functions for random data generation.

* **The Grammar Engine (`SanctuaryL10n`):** The logic engine for handling grammatically gendered languages. It provides a `GrammaticalGender` enum and a `getAdjective()` function that returns a correctly inflected word based on a given locale, gender, and base adjective.

### What You Can Do With It: Practical Use Cases

* **Populate UI Components:** Use the vocabulary lists to easily populate pronoun selectors or identity tags.
* **Generate Realistic Test Data:** Power a package like `queer_faker` to create diverse and realistic user profiles for testing.
* **Create Affirming User Experiences:** Use the grammar engine to build personalized, grammatically correct welcome messages and notifications.
* **Build Backend Tools:** Because it's a pure Dart package, the logic can be used to build tools like inclusive Discord moderation bots.

### What It Can't Do: Current Limitations

This is an MVP, and it's important to be clear about its current limitations.

* **No UI:** This package contains **zero** Flutter widgets. The UI toolkit will be a separate package (`flutter_sanctuary_ui`).
* **Grammar Engine is a Proof-of-Concept:** It currently only supports a few adjectives in **Spanish**. More languages and parts of speech will be added in future versions.
* **Vocabulary is Static:** The lists of terms are hardcoded. The planned feature to automatically merge a developer's own `.arb` files is not yet implemented.
* **Not Context-Aware:** As a pure Dart package, it cannot access Flutter's `BuildContext`. Developers must manually provide the `locale` to the grammar engine in every call. This will be simplified in the `flutter_sanctuary_ui` companion package.

---

## Roadmap

* **v0.4:** Implement a `build_runner` script to automatically merge the community glossary with user-defined `.arb` files.
* **v0.5:** Expand the Grammar Engine to support more languages (e.g., French, German) and parts of speech.
* **v1.0:** Stable API and comprehensive documentation.

## Contributing

This is a community-driven project. Please see `CONTRIBUTING.md` for details on how to add new terms, support new languages, or improve the grammar engine.