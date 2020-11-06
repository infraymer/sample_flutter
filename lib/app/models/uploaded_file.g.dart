// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'uploaded_file.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UploadedFile _$UploadedFileFromJson(Map<String, dynamic> json) {
  return UploadedFile(
    key: json['key'] as String,
    acceptRanges: json['acceptRanges'] as String,
    lastModified: json['lastModified'] as String,
    contentLength: json['contentLength'] as int,
    eTag: json['eTag'] as String,
    contentType: json['contentType'] as String,
    metadata: json['metadata'] == null
        ? null
        : Metadata.fromJson(json['metadata'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$UploadedFileToJson(UploadedFile instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('key', instance.key);
  writeNotNull('acceptRanges', instance.acceptRanges);
  writeNotNull('lastModified', instance.lastModified);
  writeNotNull('contentLength', instance.contentLength);
  writeNotNull('eTag', instance.eTag);
  writeNotNull('contentType', instance.contentType);
  writeNotNull('metadata', instance.metadata);
  return val;
}
