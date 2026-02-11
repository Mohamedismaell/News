// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_response_dto.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class NewsResponseDtoAdapter extends TypeAdapter<NewsResponseDto> {
  @override
  final typeId = 0;

  @override
  NewsResponseDto read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return NewsResponseDto(
      status: fields[0] as String,
      totalResults: (fields[1] as num).toInt(),
      articles: (fields[2] as List).cast<ArticleDto>(),
    );
  }

  @override
  void write(BinaryWriter writer, NewsResponseDto obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.status)
      ..writeByte(1)
      ..write(obj.totalResults)
      ..writeByte(2)
      ..write(obj.articles);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NewsResponseDtoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
