class MyDuration {
  final int _milliseconds;

  MyDuration(this._milliseconds) {
    if (_milliseconds < 0) {
      throw Exception("Duration shall always be greater or equal to 0 ");
    }
  }

  MyDuration.fromHours(int hours) 
      : _milliseconds = hours * 60 * 60 * 1000 {
    if (hours < 0) {
    throw Exception("Duration shall always be greater or equal to 0 ");
    }
  }

  MyDuration.fromMinutes(int minutes) 
      : _milliseconds = minutes * 60 * 1000 {
    if (minutes < 0)  {
    throw Exception("Duration shall always be greater or equal to 0 ");
    }
  }

  MyDuration.fromSeconds(int seconds) 
      : _milliseconds = seconds * 1000 {
    if (seconds < 0)  {
    throw Exception("Duration shall always be greater or equal to 0 ");
    }
  }

  int get milliseconds {
    return _milliseconds;
  }

  bool operator > (MyDuration other) {
    return _milliseconds > other._milliseconds;
  }

  MyDuration operator + (MyDuration other) {
    return MyDuration(_milliseconds + other._milliseconds);
  }

  MyDuration operator - (MyDuration other) {
    int result = _milliseconds - other._milliseconds;
    if (result < 0) {
      throw Exception('Duration cannot be negative');
    }
    return MyDuration(result);
  }

  // Display the duration in a readable format
  @override
  String toString() {
    int seconds = (_milliseconds / 1000).round();
    int minutes = (seconds / 60).floor();
    seconds = seconds % 60;
    int hours = (minutes / 60).floor();
    minutes = minutes % 60;
    return '$hours hours, $minutes minutes, $seconds seconds';
  }
}

void main() {
  MyDuration duration1 = MyDuration.fromHours(3); // 3 hours
  MyDuration duration2 = MyDuration.fromMinutes(45); // 45 minutes
  print(duration1 + duration2); // 3 hours, 45 minutes, 0 seconds
  print(duration1 > duration2); // true

  try {
    print(duration2 - duration1); // This will throw an exception
  } catch (e) {
    print(e);
  }
}
