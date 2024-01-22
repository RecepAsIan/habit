// ignore_for_file: public_member_api_docs, sort_constructors_first
class DatesModel {
  DatesModel({this.years, this.month, this.days});
  final String? years;
  final String? month;
  final String? days;

  

  

  @override
  bool operator ==(covariant DatesModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.years == years &&
      other.month == month &&
      other.days == days;
  }

  @override
  int get hashCode => years.hashCode ^ month.hashCode ^ days.hashCode;
}
