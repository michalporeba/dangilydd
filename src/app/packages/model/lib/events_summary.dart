library model;

class EventsSummary {
  final int count;
  final int duration;

  const EventsSummary({
    required this.count,
    required this.duration,
  });

  const EventsSummary.empty():
        count = 0,
        duration = 0;
}