// Copyright (c) 2015, Google Inc. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

library serializers;

import 'package:example/010_address/models/committee.dart';
import 'package:example/010_address/models/models.dart';
import 'package:example/030_image/models/image_api.dart';
import 'package:built_value/serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:built_value/iso_8601_date_time_serializer.dart';
import 'package:example/700_initiatives/models/models.dart';

part 'serializers.g.dart';

///kod koji mozda bude trebao jednom
///  T deserialize<T>(dynamic value) => standardSerializers.deserializeWith<T>(
//   standardSerializers.serializerForType(T), value);

// BuiltList<T> deserializeListOf<T>(dynamic value) => BuiltList.from(
//   value.map((value) => deserialize<T>(value)).toList(growable: false));
//   // BuiltList<Initiative> _initiativeList =
//   //     deserializeListOf(_restApiPagination.pagination.data.value);

/// Example of how to use built_value serialization.
///
/// Declare a top level [Serializers] field called serializers. Annotate it
/// with [SerializersFor] and provide a `const` `List` of types you want to
/// be serializable.
///
/// The built_value code generator will provide the implementation. It will
/// contain serializers for all the types asked for explicitly plus all the
/// types needed transitively via fields.
///
/// You usually only need to do this once per project.
///
@SerializersFor(const [
  Address,
  InitiativeReadSuccess,
  Initiative,
  InitiativeComment,
  InitiativeCommentSuccess,
  InitiativePost,
  InitiativePostSuccess,
  Committee,
  ImageApi,
  CommitteesSuccess,
])
final Serializers serializers = _$serializers;

final standardSerializers = (serializers.toBuilder()
      ..add(Iso8601DateTimeSerializer())
      ..addPlugin(StandardJsonPlugin()))
    .build();
