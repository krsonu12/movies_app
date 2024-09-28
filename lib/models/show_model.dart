import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'show_model.freezed.dart';
part 'show_model.g.dart';

@freezed
class ShowResponse with _$ShowResponse {
  const factory ShowResponse({
    required List<Show> shows,
  }) = _ShowResponse;

  factory ShowResponse.fromJson(Map<String, dynamic> json) =>
      _$ShowResponseFromJson(json);
}

@freezed
class Show with _$Show {
  const factory Show({
    required int id,
    required String name,
    required String language,
    required List<String> genres,
    required String status,
    required String premiered,
    required Rating rating,
    required Image image,
    required String summary,
  }) = _Show;

  factory Show.fromJson(Map<String, dynamic> json) => _$ShowFromJson(json);
}

@freezed
class Rating with _$Rating {
  const factory Rating({
    required double average,
  }) = _Rating;

  factory Rating.fromJson(Map<String, dynamic> json) => _$RatingFromJson(json);
}

@freezed
class Image with _$Image {
  const factory Image({
    required String medium,
    required String original,
  }) = _Image;

  factory Image.fromJson(Map<String, dynamic> json) => _$ImageFromJson(json);
}
