import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'metadata.g.dart';

@JsonSerializable()
class Metadata extends Equatable {
  final String token;

  Metadata({
    this.token,
  });

  Metadata copyWith({
    String token,
  }) {
    return Metadata(
      token: token ?? this.token,
    );
  }

  Map<String, dynamic> toJson() => _$MetadataToJson(this);
  factory Metadata.fromJson(Map<String, dynamic> json) =>
      _$MetadataFromJson(json);

  @override
  List<Object> get props => [token];

  @override
  bool get stringify => true;
}
