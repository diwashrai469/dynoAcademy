class CoursesModel {
  String? sId;
  MentorId? mentorId;
  String? courseName;
  int? courseDuration;
  String? courseInfo;
  String? courseDescription;
  int? studentsEnrolled;
  double? rating;
  int? raters;
  int? cost;
  int? lessons;
  String? skillLevel;
  String? language;
  bool? active;
  bool? approved;
  String? courseCreated;
  String? createdAt;
  String? updatedAt;
  int? iV;
  String? thumbnail;
  String? courseSlug;
  int? views;
  String? certificateLearning;
  int? highCost;
  String? discountPriceEnds;

  CoursesModel(
      {this.sId,
      this.mentorId,
      this.courseName,
      this.courseDuration,
      this.courseInfo,
      this.courseDescription,
      this.studentsEnrolled,
      this.rating,
      this.raters,
      this.cost,
      this.lessons,
      this.skillLevel,
      this.language,
      this.active,
      this.approved,
      this.courseCreated,
      this.createdAt,
      this.updatedAt,
      this.iV,
      this.thumbnail,
      this.courseSlug,
      this.views,
      this.certificateLearning,
      this.highCost,
      this.discountPriceEnds});

  CoursesModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    mentorId = json['mentor_id'] != null
        ?  MentorId.fromJson(json['mentor_id'])
        : null;
    courseName = json['course_name'];
    courseDuration = json['course_duration'];
    courseInfo = json['course_info'];
    courseDescription = json['course_description'];
    studentsEnrolled = json['students_enrolled'];
    rating = json['rating'].toDouble();
    raters = json['raters'];
    cost = json['cost'];
    lessons = json['lessons'];
    skillLevel = json['skill_level'];
    language = json['language'];
    active = json['active'];
    approved = json['approved'];
    courseCreated = json['course_created'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    thumbnail = json['thumbnail'];
    courseSlug = json['course_slug'];
    views = json['views'];
    certificateLearning = json['certificate_learning'];
    highCost = json['high_cost'];
    discountPriceEnds = json['discount_price_ends'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> CoursesModel = new Map<String, dynamic>();
    CoursesModel['_id'] = this.sId;
    if (this.mentorId != null) {
      CoursesModel['mentor_id'] = this.mentorId!.toJson();
    }
    CoursesModel['course_name'] = this.courseName;
    CoursesModel['course_duration'] = this.courseDuration;
    CoursesModel['course_info'] = this.courseInfo;
    CoursesModel['course_description'] = this.courseDescription;
    CoursesModel['students_enrolled'] = this.studentsEnrolled;
    CoursesModel['rating'] = this.rating;
    CoursesModel['raters'] = this.raters;
    CoursesModel['cost'] = this.cost;
    CoursesModel['lessons'] = this.lessons;
    CoursesModel['skill_level'] = this.skillLevel;
    CoursesModel['language'] = this.language;
    CoursesModel['active'] = this.active;
    CoursesModel['approved'] = this.approved;
    CoursesModel['course_created'] = this.courseCreated;
    CoursesModel['createdAt'] = this.createdAt;
    CoursesModel['updatedAt'] = this.updatedAt;
    CoursesModel['__v'] = this.iV;
    CoursesModel['thumbnail'] = this.thumbnail;
    CoursesModel['course_slug'] = this.courseSlug;
    CoursesModel['views'] = this.views;
    CoursesModel['certificate_learning'] = this.certificateLearning;
    CoursesModel['high_cost'] = this.highCost;
    CoursesModel['discount_price_ends'] = this.discountPriceEnds;
    return CoursesModel;
  }
}

class MentorId {
  String? sId;
  String? name;

  MentorId({this.sId, this.name});

  MentorId.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> CoursesModel = new Map<String, dynamic>();
    CoursesModel['_id'] = this.sId;
    CoursesModel['name'] = this.name;
    return CoursesModel;
  }
}
