// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'show_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ShowResponseImpl _$$ShowResponseImplFromJson(Map<String, dynamic> json) =>
    _$ShowResponseImpl(
      shows: (json['shows'] as List<dynamic>)
          .map((e) => Show.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ShowResponseImplToJson(_$ShowResponseImpl instance) =>
    <String, dynamic>{
      'shows': instance.shows,
    };

_$ShowImpl _$$ShowImplFromJson(Map<String, dynamic> json) => _$ShowImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      language: json['language'] as String,
      genres:
          (json['genres'] as List<dynamic>).map((e) => e as String).toList(),
      status: json['status'] as String,
      premiered: json['premiered'] as String,
      rating: Rating.fromJson(json['rating'] as Map<String, dynamic>),
      image: Image.fromJson(json['image'] as Map<String, dynamic>),
      summary: json['summary'] as String,
    );

Map<String, dynamic> _$$ShowImplToJson(_$ShowImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'language': instance.language,
      'genres': instance.genres,
      'status': instance.status,
      'premiered': instance.premiered,
      'rating': instance.rating,
      'image': instance.image,
      'summary': instance.summary,
    };

_$RatingImpl _$$RatingImplFromJson(Map<String, dynamic> json) => _$RatingImpl(
      average: (json['average'] as num).toDouble(),
    );

Map<String, dynamic> _$$RatingImplToJson(_$RatingImpl instance) =>
    <String, dynamic>{
      'average': instance.average,
    };

_$ImageImpl _$$ImageImplFromJson(Map<String, dynamic> json) => _$ImageImpl(
      medium: json['medium'] as String,
      original: json['original'] as String,
    );

Map<String, dynamic> _$$ImageImplToJson(_$ImageImpl instance) =>
    <String, dynamic>{
      'medium': instance.medium,
      'original': instance.original,
    };
