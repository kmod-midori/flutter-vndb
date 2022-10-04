import 'package:json_annotation/json_annotation.dart';

part 'response.g.dart';

@JsonSerializable()
class GetResponse {
  final List<Map<String, dynamic>> items;

  final int num;

  final bool more;

  GetResponse(
    this.items,
    this.num,
    this.more,
  );

  factory GetResponse.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$GetResponseFromJson(json);

  ItemList<T> toItemList<T>(
    T Function(Map<String, dynamic>) fromJson,
  ) =>
      ItemList<T>(
        items.map(fromJson).toList(),
        num,
        more,
      );
}

class ItemList<T> {
  final List<T> items;

  final int num;

  final bool more;

  ItemList(
    this.items,
    this.num,
    this.more,
  );
}
