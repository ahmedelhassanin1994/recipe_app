// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_entities.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RecipeEntitiesAdapter extends TypeAdapter<Recipe_Entities> {
  @override
  final int typeId = 5;

  @override
  Recipe_Entities read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Recipe_Entities(
      fields[0] as String,
      fields[1] as String,
      fields[2] as String,
      fields[3] as String,
      fields[4] as String,
      (fields[5] as List).cast<String>(),
      fields[6] as String,
      fields[7] as String,
      fields[8] as dynamic,
      fields[9] as String,
      fields[10] as int,
      fields[11] as String,
      fields[12] as String,
      (fields[13] as List).cast<String>(),
      (fields[14] as List).cast<String>(),
      fields[15] as String,
      fields[16] as int,
      fields[17] as int,
      fields[18] as String,
      fields[19] as bool,
      (fields[20] as List).cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, Recipe_Entities obj) {
    writer
      ..writeByte(21)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.fats)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.time)
      ..writeByte(4)
      ..write(obj.image)
      ..writeByte(5)
      ..write(obj.weeks)
      ..writeByte(6)
      ..write(obj.Carbos)
      ..writeByte(7)
      ..write(obj.fibers)
      ..writeByte(8)
      ..write(obj.rating)
      ..writeByte(9)
      ..write(obj.country)
      ..writeByte(10)
      ..write(obj.ratings)
      ..writeByte(11)
      ..write(obj.calories)
      ..writeByte(12)
      ..write(obj.headline)
      ..writeByte(13)
      ..write(obj.keywords)
      ..writeByte(14)
      ..write(obj.products)
      ..writeByte(15)
      ..write(obj.proteins)
      ..writeByte(16)
      ..write(obj.favorites)
      ..writeByte(17)
      ..write(obj.difficulty)
      ..writeByte(18)
      ..write(obj.description)
      ..writeByte(19)
      ..write(obj.highlighted)
      ..writeByte(20)
      ..write(obj.deliverableIngredients);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RecipeEntitiesAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
