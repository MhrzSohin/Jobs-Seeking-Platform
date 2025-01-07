// To parse this JSON data, do
//
//     final jobsModel = jobsModelFromJson(jsonString);

import 'dart:convert';

List<JobsModel> jobsModelFromJson(String str) => List<JobsModel>.from(json.decode(str).map((x) => JobsModel.fromJson(x)));

String jobsModelToJson(List<JobsModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class JobsModel {
    String? id;
    String? title;
    String? description;
    String? company;
    String? location;
    int? salaryFrom;
    int? salaryTo;
    EmploymentType? employmentType;
    String? applicationDeadline;
    String? qualifications;
    String? contact;
    JobCategory? jobCategory;
    int? isRemoteWork;
    int? numberOfOpening;
    AtedAt? createdAt;
    AtedAt? updatedAt;

    JobsModel({
        this.id,
        this.title,
        this.description,
        this.company,
        this.location,
        this.salaryFrom,
        this.salaryTo,
        this.employmentType,
        this.applicationDeadline,
        this.qualifications,
        this.contact,
        this.jobCategory,
        this.isRemoteWork,
        this.numberOfOpening,
        this.createdAt,
        this.updatedAt,
    });

    factory JobsModel.fromJson(Map<String, dynamic> json) => JobsModel(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        company: json["company"],
        location: json["location"],
        salaryFrom: json["salary_from"],
        salaryTo: json["salary_to"],
        employmentType: employmentTypeValues.map[json["employment_type"]]!,
        applicationDeadline: json["application_deadline"],
        qualifications: json["qualifications"],
        contact: json["contact"],
        jobCategory: jobCategoryValues.map[json["job_category"]]!,
        isRemoteWork: json["is_remote_work"],
        numberOfOpening: json["number_of_opening"],
        createdAt: atedAtValues.map[json["created_at"]]!,
        updatedAt: atedAtValues.map[json["updated_at"]]!,
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "company": company,
        "location": location,
        "salary_from": salaryFrom,
        "salary_to": salaryTo,
        "employment_type": employmentTypeValues.reverse[employmentType],
        "application_deadline": applicationDeadline,
        "qualifications": qualifications,
        "contact": contact,
        "job_category": jobCategoryValues.reverse[jobCategory],
        "is_remote_work": isRemoteWork,
        "number_of_opening": numberOfOpening,
        "created_at": atedAtValues.reverse[createdAt],
        "updated_at": atedAtValues.reverse[updatedAt],
    };
}

enum AtedAt {
    SUN_10152023
}

final atedAtValues = EnumValues({
    "Sun, 10/15/2023": AtedAt.SUN_10152023
});

enum EmploymentType {
    CONSULTANT,
    CONTRACT_DEVELOPER,
    CO_FOUNDER_TECHNICAL_PARTNER,
    FREELANCE_DEVELOPER,
    FULL_TIME_DEVELOPER,
    INTERN_DEVELOPER,
    IN_HOUSE_DEVELOPER_FOR_NON_TECH_COMPANY,
    PART_TIME_DEVELOPER,
    REMOTE_DEVELOPER,
    TEMPORARY_DEVELOPER
}

final employmentTypeValues = EnumValues({
    "Consultant": EmploymentType.CONSULTANT,
    "Contract Developer": EmploymentType.CONTRACT_DEVELOPER,
    "Co-founder/Technical Partner": EmploymentType.CO_FOUNDER_TECHNICAL_PARTNER,
    "Freelance Developer": EmploymentType.FREELANCE_DEVELOPER,
    "Full-time Developer": EmploymentType.FULL_TIME_DEVELOPER,
    "Intern Developer": EmploymentType.INTERN_DEVELOPER,
    "In-house Developer for Non-Tech Company": EmploymentType.IN_HOUSE_DEVELOPER_FOR_NON_TECH_COMPANY,
    "Part-time Developer": EmploymentType.PART_TIME_DEVELOPER,
    "Remote Developer": EmploymentType.REMOTE_DEVELOPER,
    "Temporary Developer": EmploymentType.TEMPORARY_DEVELOPER
});

enum JobCategory {
    BACK_END_DEVELOPER,
    DATABASE_ADMINISTRATOR,
    DATA_SCIENTIST,
    DEV_OPS_ENGINEER,
    FRONT_END_DEVELOPER,
    FULL_STACK_DEVELOPER,
    MOBILE_APP_DEVELOPER,
    QA_ENGINEER,
    SECURITY_ENGINEER,
    UI_UX_DESIGNER
}

final jobCategoryValues = EnumValues({
    "Back-end Developer": JobCategory.BACK_END_DEVELOPER,
    "Database Administrator": JobCategory.DATABASE_ADMINISTRATOR,
    "Data Scientist": JobCategory.DATA_SCIENTIST,
    "DevOps Engineer": JobCategory.DEV_OPS_ENGINEER,
    "Front-end Developer": JobCategory.FRONT_END_DEVELOPER,
    "Full-stack Developer": JobCategory.FULL_STACK_DEVELOPER,
    "Mobile App Developer": JobCategory.MOBILE_APP_DEVELOPER,
    "QA Engineer": JobCategory.QA_ENGINEER,
    "Security Engineer": JobCategory.SECURITY_ENGINEER,
    "UI/UX Designer": JobCategory.UI_UX_DESIGNER
});

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
            reverseMap = map.map((k, v) => MapEntry(v, k));
            return reverseMap;
    }
}
