import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'metadata.dart';

part 'uploaded_file.g.dart';

@JsonSerializable()
class UploadedFile extends Equatable {
  final String key;
  final String acceptRanges;
  final String lastModified;
  final int contentLength;
  final String eTag;
  final String contentType;
  final Metadata metadata;

  UploadedFile({
    this.key,
    this.acceptRanges,
    this.lastModified,
    this.contentLength,
    this.eTag,
    this.contentType,
    this.metadata,
  });

  Map<String, dynamic> toJson() => _$UploadedFileToJson(this);
  factory UploadedFile.fromJson(Map<String, dynamic> json) =>
      _$UploadedFileFromJson(json);

  @override
  List<Object> get props {
    return [
      key,
      acceptRanges,
      lastModified,
      contentLength,
      eTag,
      contentType,
      metadata,
    ];
  }

  @override
  bool get stringify => true;
}
