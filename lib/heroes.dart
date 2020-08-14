class Heroes {
  Heroes({
    this.id,
    this.name,
    this.localizedName,
    this.primaryAttr,
    this.attackType,
    this.roles,
    this.legs,
  });

  int id;
  String name;
  String localizedName;
  String primaryAttr;
  String attackType;
  List<String> roles;
  int legs;

  factory Heroes.fromJson(Map<String, dynamic> json) {
    return Heroes(
    id:json['id'],
    name: json['name'],
    localizedName: json['localized_name'],
    primaryAttr: json['primary_attr'],
    attackType:json["attack_type"],
    roles:json['roles'],
    legs: int.parse(json['legs']),
  );}}
