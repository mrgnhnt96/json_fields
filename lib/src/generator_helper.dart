// Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';

import 'field_helpers.dart';
import 'helper_core.dart';
import 'properties_helper.dart';
import 'settings.dart';
import 'utils.dart';

class GeneratorHelper extends HelperCore with PropertiesHelper {
  final _addedMembers = <String>{};

  GeneratorHelper(
    Settings generator,
    ClassElement element,
    ConstantReader annotation,
  ) : super(
            element,
            mergeConfig(
              generator.config,
              annotation,
              classElement: element,
            ));

  @override
  void addMember(String memberContent) {
    _addedMembers.add(memberContent);
  }

  Iterable<String> generate() sync* {
    assert(_addedMembers.isEmpty);

    final sortedFields = createSortedFieldSet(element);

    // Used to keep track of why a field is ignored. Useful for providing
    // helpful errors when generating constructor calls that try to use one of
    // these fields.
    final unavailableReasons = <String, String>{};

    final accessibleFields = sortedFields.fold<Map<String, FieldElement>>(
      <String, FieldElement>{},
      (map, field) {
        if (!field.isPublic) {
          unavailableReasons[field.name] = 'It is assigned to a private field.';
        } else if (field.getter == null) {
          assert(field.setter != null);
          unavailableReasons[field.name] =
              'Setter-only properties are not supported.';
          log.warning('Setters are ignored: ${element.name}.${field.name}');
        } else if (jsonKeyFor(field).ignore) {
          unavailableReasons[field.name] =
              'It is assigned to an ignored field.';
        } else {
          assert(!map.containsKey(field.name));
          map[field.name] = field;
        }

        return map;
      },
    );

    final accessibleFieldSet = accessibleFields.values.toSet();

    yield* createFields(accessibleFieldSet);

    yield* _addedMembers;
  }
}
