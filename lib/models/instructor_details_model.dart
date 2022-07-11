class InstructorDetailsModel {
  String fullName;
  String mobile;
  String email;
  String address;
  String socialProfile;
  String companyOrInstructor;
  String registerNumber;
  String companyWebsite;
  String introduction;
  String experience;
  List<String> teachingArea;

  InstructorDetailsModel({
    required this.fullName,
    required this.mobile,
    required this.email,
    required this.address,
    required this.socialProfile,
    required this.companyOrInstructor,
    required this.registerNumber,
    required this.companyWebsite,
    required this.introduction,
    required this.experience,
    required this.teachingArea,
  });

  factory InstructorDetailsModel.fromJson(Map<String, dynamic> json) {
    return InstructorDetailsModel(
      fullName: json['fullName'],
      mobile: json['mobile'],
      email: json['email'],
      address: json['address'],
      socialProfile: json['socialProfile'],
      companyOrInstructor: json['companyOrInstructor'],
      registerNumber: json['registerNumber'],
      companyWebsite: json['companyWebsite'],
      introduction: json['introduction'],
      experience: json['experience'],
      teachingArea: json['teachingArea'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['fullName'] = this.fullName;
    data['mobile'] = this.mobile;
    data['email'] = this.email;
    data['address'] = this.address;
    data['socialProfile'] = this.socialProfile;
    data['companyOrInstructor'] = this.companyOrInstructor;
    data['registerNumber'] = this.registerNumber;
    data['companyWebsite'] = this.companyWebsite;
    data['introduction'] = this.introduction;
    data['experience'] = this.experience;
    data['teachingArea'] = this.teachingArea;
    return data;
  }

}
