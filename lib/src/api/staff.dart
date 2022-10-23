import 'package:json_annotation/json_annotation.dart';

part 'staff.g.dart';

@JsonSerializable()
class VisualNovelStaff {
  /// Staff ID
  final int sid;

  /// Alias ID
  final int aid;

  final String name;

  /// original name
  final String? original;

  /// original/official title
  final String role;

  final String? note;

  VisualNovelStaff({
    required this.sid,
    required this.aid,
    required this.name,
    this.original,
    required this.role,
    this.note,
  });

  factory VisualNovelStaff.fromJson(Map<String, dynamic> json) =>
      _$VisualNovelStaffFromJson(json);

  Map<String, dynamic> toJson() => _$VisualNovelStaffToJson(this);
}
