library model;

class EventsSummary {
  final int count;

  const EventsSummary({
    required this.count
  });

  const EventsSummary.empty(): count = 0;

  EventsSummary copyWith({
    int? count
  }) => EventsSummary(
    count: count ?? this.count
  );
}