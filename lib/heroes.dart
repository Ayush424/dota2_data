class Heroes {
  Heroes({
    this.id,
    this.name,
    this.localizedName,
    this.primaryAttr,
    this.attackType,
    this.roles,
    this.img,
    this.icon,
    this.baseHealth,
    this.baseHealthRegen,
    this.baseMana,
    this.baseManaRegen,
    this.baseArmor,
    this.baseMr,
    this.baseAttackMin,
    this.baseAttackMax,
    this.baseStr,
    this.baseAgi,
    this.baseInt,
    this.strGain,
    this.agiGain,
    this.intGain,
    this.attackRange,
    this.projectileSpeed,
    this.attackRate,
    this.moveSpeed,
    this.turnRate,
  });

  int id;
  String name;
  String localizedName;
  String primaryAttr;
  String attackType;
  List<String> roles;
  String img;
  String icon;
  int baseHealth;
  double baseHealthRegen;
  int baseMana;
  double baseManaRegen;
  double baseArmor;
  int baseMr;
  int baseAttackMin;
  int baseAttackMax;
  int baseStr;
  int baseAgi;
  int baseInt;
  double strGain;
  double agiGain;
  double intGain;
  int attackRange;
  int projectileSpeed;
  double attackRate;
  int moveSpeed;
  double turnRate;

  factory Heroes.fromJson(Map<String, dynamic> json) {
    return Heroes(
      id: json["id"],
      name: json["name"],
      localizedName: json["localized_name"],
      primaryAttr: json["primary_attr"],
      attackType: json["attack_type"],
      roles: List<String>.from(json["roles"]),
      img: json["img"],
      icon: json["icon"],
      baseHealth: json["base_health"],
      baseHealthRegen: json["base_health_regen"] == null ? null : json["base_health_regen"].toDouble(),
      baseMana: json["base_mana"],
      baseManaRegen: json["base_mana_regen"].toDouble(),
      baseArmor: json["base_armor"].toDouble(),
      baseMr: json["base_mr"],
      baseAttackMin: json["base_attack_min"],
      baseAttackMax: json["base_attack_max"],
      baseStr: json["base_str"],
      baseAgi: json["base_agi"],
      baseInt: json["base_int"],
      strGain: json["str_gain"].toDouble(),
      agiGain: json["agi_gain"].toDouble(),
      intGain: json["int_gain"].toDouble(),
      attackRange: json["attack_range"],
      projectileSpeed: json["projectile_speed"],
      attackRate: json["attack_rate"].toDouble(),
      moveSpeed: json["move_speed"],
      turnRate: json["turn_rate"].toDouble(),
    );}}
