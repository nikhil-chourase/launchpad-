
class Program {
  final String name;
  final List<Exercise> exercises;

  Program({required this.name, this.exercises = const []});
}

class Exercise {
  final String name;

  Exercise({required this.name});
}

