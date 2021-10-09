// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:json_annotation/json_annotation.dart';

import 'type_helpers/config_types.dart';

class Settings {
  final JsonSerializable _config;

  // #CHANGE WHEN UPDATING json_annotation
  ClassConfig get config => ClassConfig(
        checked: _config.checked ?? ClassConfig.defaults.checked,
        anyMap: _config.anyMap ?? ClassConfig.defaults.anyMap,
        createFactory:
            _config.createFactory ?? ClassConfig.defaults.createFactory,
        createToJson: _config.createToJson ?? ClassConfig.defaults.createToJson,
        ignoreUnannotated:
            _config.ignoreUnannotated ?? ClassConfig.defaults.ignoreUnannotated,
        explicitToJson:
            _config.explicitToJson ?? ClassConfig.defaults.explicitToJson,
        includeIfNull:
            _config.includeIfNull ?? ClassConfig.defaults.includeIfNull,
        genericArgumentFactories: _config.genericArgumentFactories ??
            ClassConfig.defaults.genericArgumentFactories,
        fieldRename: _config.fieldRename ?? ClassConfig.defaults.fieldRename,
        disallowUnrecognizedKeys: _config.disallowUnrecognizedKeys ??
            ClassConfig.defaults.disallowUnrecognizedKeys,
      );

  /// Creates an instance of [Settings].
  const Settings({
    JsonSerializable? config,
  }) : _config = config ?? ClassConfig.defaults;
}
