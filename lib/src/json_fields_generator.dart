// Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:source_gen/source_gen.dart';

import 'generator_helper.dart';
import 'settings.dart';

class JsonFieldsGenerator extends GeneratorForAnnotation<JsonSerializable> {
  final Settings _settings;

  JsonSerializable get config => _settings.config;

  JsonFieldsGenerator.fromSettings(this._settings);

  /// Creates an instance of [JsonFieldsGenerator].
  factory JsonFieldsGenerator({
    JsonSerializable? config,
  }) =>
      JsonFieldsGenerator.fromSettings(Settings(
        config: config,
      ));

  @override
  Iterable<String> generateForAnnotatedElement(
    Element element,
    ConstantReader annotation,
    BuildStep buildStep,
  ) {
    if (!element.library!.isNonNullableByDefault) {
      throw InvalidGenerationSourceError(
        'Generator cannot target libraries that have not been migrated to '
        'null-safety.',
        element: element,
      );
    }

    if (element is! ClassElement || element.isEnum) {
      throw InvalidGenerationSourceError(
        '`@JsonSerializable` can only be used on classes.',
        element: element,
      );
    }

    final helper = GeneratorHelper(_settings, element, annotation);
    return helper.generate();
  }
}
