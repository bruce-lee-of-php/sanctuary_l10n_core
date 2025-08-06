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
* **Grammar Engine:** Get correctly inflected, gender-affirming adjectives for grammatically gendered languages.

## Getting Started

Add the dependency to your `pubspec.yaml`:
```yaml
dependencies:
  sanctuary_l10n_core: ^0.2.0 # Or the latest version
```

## Usage

### Accessing Vocabulary

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

### Using the Grammar Engine

The grammar engine allows you to generate grammatically correct sentences that respect a user's gender.

```dart
import 'package:sanctuary_l10n_core/sanctuary_l10n_core.dart';

void main() {
  final locale = 'es'; // Set the language to Spanish
  final userGender = GrammaticalGender.feminine;

  final welcomeAdjective = SanctuaryL10n.getAdjective(
    locale: locale,
    gender: userGender,
    baseAdjective: 'welcome',
  );

  print('¡$welcomeAdjective, user!'); // Prints: "¡Bienvenida, user!"
}
```

## Roadmap

* **v0.3:** Implement a `build_runner` script to automatically merge the community glossary with user-defined `.arb` files.
* **v0.4:** Expand the Grammar Engine to support more languages and parts of speech (e.g., nouns).
* **v1.0:** Stable API and comprehensive documentation.

## Contributing

This is a community-driven project. Please see `CONTRIBUTING.md` for details on how to add new terms, support new languages, or improve the grammar engine.

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

### What It Can't Do: Current Limitations (v0.1.0)

This is an MVP, and it's important to be clear about its current limitations.

* **No UI:** This package contains **zero** Flutter widgets. The UI toolkit will be a separate package (`flutter_sanctuary_ui`).
* **Grammar Engine is a Proof-of-Concept:** It currently only supports a few adjectives in **Spanish**. More languages and parts of speech will be added in future versions.
* **Vocabulary is Static:** The lists of terms are hardcoded. The planned feature to automatically merge a developer's own `.arb` files is not yet implemented.
* **Not Context-Aware:** As a pure Dart package, it cannot access Flutter's `BuildContext`. Developers must manually provide the `locale` to the grammar engine in every call. This will be simplified in the `flutter_sanctuary_ui` companion package.
