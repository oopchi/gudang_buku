import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class EventModel extends Equatable {
  const EventModel({
    required this.id,
    required this.name,
    this.description,
    this.dateTimeRange,
    required this.imageUrl,
  });

  final String id;
  final String name;
  final String? description;
  final DateTimeRange? dateTimeRange;
  final String imageUrl;

  @override
  List<Object?> get props => <Object?>[
        id,
        name,
        description,
        dateTimeRange,
        imageUrl,
      ];
}
