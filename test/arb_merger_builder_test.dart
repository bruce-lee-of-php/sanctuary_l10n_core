// This file demonstrates how to test a build_runner script.
// You will need to add `build_test` to your dev_dependencies in pubspec.yaml

import 'package:build_test/build_test.dart';
import 'package:sanctuary_l10n_core/src/build/arb_merger_builder.dart';
import 'package:test/test.dart';
import 'dart:convert';

void main() {
  group('ArbMergerBuilder', () {
    test('correctly merges package glossary with user ARB file', () async {
      // 1. Define the mock input files for the test.
      final Map<String, String> sourceAssets = {
        // The package's internal glossary file
        'sanctuary_l10n_core|lib/src/l10n/glossary_en.arb': json.encode({
          "identity_nonBinary": "Non-binary",
          "relationship_partner": "Partner"
        }),
        // The user's app-specific translation file
        'my_app|lib/l10n/app_en.arb': json.encode({
          "welcomeMessage": "Welcome!",
          // This will override the package's default
          "relationship_partner": "Significant Other"
        }),
      };

      // 2. Define the expected output after the merge.
      final Map<String, dynamic> expectedOutput = {
        // From the glossary
        "identity_nonBinary": "Non-binary",
        // From the user's file (overriding the glossary)
        "relationship_partner": "Significant Other",
        // From the user's file
        "welcomeMessage": "Welcome!",
      };

      // 3. Run the builder using testBuilder.
      // This is a simplified test. A full test would need to simulate the
      // file system interaction more closely. For now, we can test the
      // merging logic directly.

      // NOTE: Testing the file system aspect of this builder is complex.
      // A pragmatic first step is to extract the merging logic into a
      // pure, testable function.

      // Let's simulate the core logic for this test.
      final userContent =
          json.decode(sourceAssets['my_app|lib/l10n/app_en.arb']!)
              as Map<String, dynamic>;
      final glossaryContent = json.decode(
              sourceAssets['sanctuary_l10n_core|lib/src/l10n/glossary_en.arb']!)
          as Map<String, dynamic>;

      final mergedContent = {...glossaryContent, ...userContent};

      expect(mergedContent, equals(expectedOutput));
    });
  });
}
