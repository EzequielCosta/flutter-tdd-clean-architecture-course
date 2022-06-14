import 'package:news/features/top_headlines/domain/entities/source.dart';

class SourceModel extends Source {
  late String? id;
  late String name;

  SourceModel({required this.id, required this.name})
      : super(id: id, name: name);

  factory SourceModel.toJson(Map<String, dynamic> json) {
    return SourceModel(
      id: json["id"],
      name: json["name"],
    );
  }
}
