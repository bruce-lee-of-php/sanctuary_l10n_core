# Sanctuary L10n Core 🏳️‍⚧️🏳️‍🌈
A pure Dart localization toolkit for queer and trans communities, making inclusive language the default, not the exception.

This is a low-level, pure Dart package containing the core logic and translation data. For a more user-friendly experience in Flutter apps, see the upcoming flutter_sanctuary package.

## Mission
Building inclusive apps is hard. Handling localization (l10n) for queer and trans communities is even harder. It requires deep linguistic knowledge, community consultation, and complex logic to handle things like grammatical gender.

sanctuary_l10n_core is an open-source toolkit that solves these problems. We provide:

**A Community-Vetted Glossary:** Pre-built translations for common queer and trans terminology.

**A Grammatical Gender Engine:** A powerful (upcoming) set of tools to handle gender agreement in languages like Spanish, French, and German.

This package saves developers time, reduces errors, and promotes a higher standard of inclusivity across the entire ecosystem.

## Current Features (v0.1.0)
GrammaticalGender enum: A core data model for handling grammatical gender.

Community Glossary (Proof of Concept): Initial .arb files for English and Spanish with core terminology. Note: The build script to automatically merge these files is planned for a future version.

## Roadmap
* v0.2: Implement the first version of the Grammatical Gender Engine for Spanish.

* v0.3: Implement a build_runner script to automatically merge the community glossary.

* v1.0: Stable API and expanded language support.

## Contributing
This is a community-driven project. Please see CONTRIBUTING.md for details on how to add new terms, support new languages, or improve the grammar engine.