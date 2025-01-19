
// Model Classes
class QuizModel {
  List<Question>? questions;

  QuizModel({this.questions});

  QuizModel.fromJson(Map<String, dynamic> json) {
    if (json['questions'] != null) {
      questions = <Question>[];
      json['questions'].forEach((v) {
        questions!.add(Question.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (questions != null) {
      data['questions'] = questions!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Question {
  String? description;
  String? detailedSolution;
  List<Option>? options;
  int? score;

  Question({this.description, this.detailedSolution, this.options, this.score});

  Question.fromJson(Map<String, dynamic> json) {
    description = json['description'];
    detailedSolution = json['detailed_solution'];
    if (json['options'] != null) {
      options = <Option>[];
      json['options'].forEach((v) {
        options!.add(Option.fromJson(v));
      });
    }
    score = json['score'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['description'] = description;
    data['detailed_solution'] = detailedSolution;
    if (options != null) {
      data['options'] = options!.map((v) => v.toJson()).toList();
    }
    data['score'] = score;
    return data;
  }
}

class Option {
  String? description;
  bool? isCorrect;

  Option({this.description, this.isCorrect});

  Option.fromJson(Map<String, dynamic> json) {
    description = json['description'];
    isCorrect = json['is_correct'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['description'] = description;
    data['is_correct'] = isCorrect;
    return data;
  }
}