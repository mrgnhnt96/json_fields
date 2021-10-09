// Copyright (c) 2021, the Dart project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:analyzer/dart/element/element.dart';
import 'package:meta/meta.dart';
import 'package:source_helper/source_helper.dart';

import 'json_key_utils.dart';
import 'type_helpers/config_types.dart';

abstract class HelperCore {
  final ClassElement element;
  final ClassConfig config;

  HelperCore(this.element, this.config);

  @protected
  String nameAccess(FieldElement field) => jsonKeyFor(field).name;

  @protected
  String safeNameAccess(FieldElement field) =>
      escapeDartString(nameAccess(field));

  @protected
  String get prefix => '_\$${element.name.nonPrivate}';

  @protected
  KeyConfig jsonKeyFor(FieldElement field) => jsonKeyForField(field, config);
}
