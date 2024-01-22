import 'package:equatable/equatable.dart';

class HabitModel with EquatableMixin {
  String? titleText;
  String? subtitleText;
  String? trailingText;
  String? habitText;
  String? imageText;
  int? containerColor;

  HabitModel({
    this.titleText,
    this.subtitleText,
    this.trailingText,
    this.habitText,
    this.imageText,
    this.containerColor,
  });

  @override
  List<Object?> get props => [
        titleText,
        subtitleText,
        trailingText,
        habitText,
        imageText,
        containerColor
      ];

  HabitModel copyWith({
    String? titleText,
    String? subtitleText,
    String? trailingText,
    String? habitText,
    String? imageText,
    int? containerColor,
  }) {
    return HabitModel(
      titleText: titleText ?? this.titleText,
      subtitleText: subtitleText ?? this.subtitleText,
      trailingText: trailingText ?? this.trailingText,
      habitText: habitText ?? this.habitText,
      imageText: imageText ?? this.imageText,
      containerColor: containerColor ?? this.containerColor,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'titleText': titleText,
      'subtitleText': subtitleText,
      'trailingText': trailingText,
      'habitText': habitText,
      'imageText': imageText,
      'containerColor': containerColor,
    };
  }

  factory HabitModel.fromJson(Map<String, dynamic> json) {
    return HabitModel(
      titleText: json['titleText'] as String?,
      subtitleText: json['subtitleText'] as String?,
      trailingText: json['trailingText'] as String?,
      habitText: json['habitText'] as String?,
      imageText: json['imageText'] as String?,
      containerColor: json['containerColor'] as int?,
    );
  }
}
