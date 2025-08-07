import 'dart:convert';
import 'package:build/build.dart';

Builder arbMergerBuilder(BuilderOptions options) => ArbMergerBuilder();

class ArbMergerBuilder implements Builder {
  @override
  Map<String, List<String>> get buildExtensions => {
        // This builder reads a user's .arb file and outputs a merged .arb file.
        'lib/l10n/{{}}.arb': ['lib/l10n/{{}}.merged.arb'],
      };

  @override
  Future<void> build(BuildStep buildStep) async {
    // Get the user's input .arb file.
    final userInputId = buildStep.inputId;
    final userContent = json.decode(await buildStep.readAsString(userInputId))
        as Map<String, dynamic>;

    // Determine the locale from the input file name.
    final locale =
        userInputId.pathSegments.last.split('_').last.split('.').first;

    // Find the corresponding glossary file from our package.
    final glossaryAssetId = AssetId(
      'sanctuary_l10n_core',
      'lib/src/l10n/glossary_$locale.arb',
    );

    Map<String, dynamic> mergedContent = {};

    // Start with the package glossary if it exists.
    if (await buildStep.canRead(glossaryAssetId)) {
      final glossaryContent = await buildStep.readAsString(glossaryAssetId);
      mergedContent.addAll(json.decode(glossaryContent));
    }

    // Add the user's translations, which will override any duplicates.
    mergedContent.addAll(userContent);

    // Write the final merged content to the output file.
    final outputId = userInputId.changeExtension('.merged.arb');
    await buildStep.writeAsString(
        outputId, JsonEncoder.withIndent('  ').convert(mergedContent));
  }
}
