library api_serializers;

import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:built_value/iso_8601_date_time_serializer.dart';
import 'rest_api_model.dart';
import 'rest_api_fail.dart';

part 'api_serializers.g.dart';

@SerializersFor(const [
  RestApiFail,
  RestApiModel,
])
final Serializers serializers = _$serializers;

final apiSerializers = (serializers.toBuilder()
      ..add(Iso8601DateTimeSerializer())
      ..addPlugin(StandardJsonPlugin()))
    .build();
