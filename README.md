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
  sanctuary_l10n_core: ^0.4.0 # Or the latest version
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
* **Verbs:** `{verb:be:present}`
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

At its heart, `sanctuary_l10n_core` is a pure Dart library that provides a **curated vocabulary** and a **grammar engine**.

* **The Vocabulary (`SanctuaryVocabulary`):** A read-only database of community-vetted, inclusive terminology. It provides structured `PronounSet` objects (containing all grammatical forms), simple `List<String>` collections for gender identities and sexualities, and helper functions for random data generation.

* **The Grammar Engine (`SanctuaryL10n`):** The logic engine for handling grammatically gendered languages. It provides a `GrammaticalGender` enum and a powerful `format()` function that returns correctly inflected sentences based on a given locale, gender, number, and pronoun context.

### What It Can't Do: Current Limitations & Edge Cases

This package is a powerful tool, but it is not a full natural language processing engine. It's important to understand its current limitations.

* **No UI:** This package contains **zero** Flutter widgets. The UI toolkit will be a separate package (`flutter_sanctuary_ui`).
* **Grammar Engine is a Proof-of-Concept:** It currently only supports a limited set of words in **Spanish** (for gendered nouns/adjectives) and **English** (for verb conjugations). More languages and words will be added in future versions.
* **Handling Combined Pronouns (e.g., 'she/they'):** A person's pronouns describe who they are. Our `PronounSet` model cannot represent multiple pronouns in a single object. The responsibility for handling this lies with the app developer, but our package provides the necessary tools.
    * **Recommendation:** The app should store a `List<PronounSet>` for the user. The developer can then decide which pronoun to use in which context (e.g., alternating). To ensure correct grammar, they can use the `gender` override in the `format()` function. For example, to use "they" with feminine grammar: `SanctuaryL10n.format(template, pronoun: pronounThey, gender: GrammaticalGender.feminine)`.
* **Adjective/Noun Agreement:** The engine currently genders adjectives based on the **subject's gender**, not the gender of the noun they are describing. For now, only use the engine for adjectives that describe the user directly.
* **Vocabulary is Static:** The lists of terms are hardcoded. The planned feature to automatically merge a developer's own `.arb` files is not yet implemented.

---

## Roadmap

* **v0.6:** Implement a `build_runner` script to automatically merge the community glossary with user-defined `.arb` files.
* **v0.8:** Expand the Grammar Engine to support more languages (e.g., French, German) and parts of speech.
* **v1.0:** Stable API and comprehensive documentation.

## Contributing

This is a community-driven project. Please see `CONTRIBUTING.md` for details on how to add new terms, support new languages, or improve the grammar engine.