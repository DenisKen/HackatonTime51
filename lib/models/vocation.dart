class Vocation {
  static final Vocation _instance = Vocation._internal();

  int adaptation;
  int agility;
  int selfDevelopment;
  int solveProblems;
  int resilience;
  int extroversion;
  int introversion;
  int responsibility;
  int creative;
  int kindness;

  factory Vocation.fromJson(Map<String, dynamic> json) {
    
    _instance.adaptation = 1;
    _instance.agility = 1;
    _instance.selfDevelopment = 1;
    _instance.solveProblems = 1;
    _instance.resilience = 1;
    _instance.extroversion = 1;
    _instance.introversion = 1;
    _instance.responsibility = 1;
    _instance.creative = 1;
    _instance.kindness = 1;


    return _instance;
  }

  Vocation._internal();
}
