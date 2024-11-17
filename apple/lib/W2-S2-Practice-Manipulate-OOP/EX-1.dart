enum Skill { FLUTTER, DART, OTHER }

class Employee {
  final String _name;
  final double _baseSalary;
  final List<Skill> _skills;
  final Address _address;
  final int _yearOfExperience;

  Employee(this._name, this._baseSalary, this._address, this._yearOfExperience, this._skills);

  Employee.mobileDeveloper(String name, Address address, int yearsOfExperience)
      : _name = name,
        _baseSalary = 40000, 
        _address = address,
        _yearOfExperience = yearsOfExperience,
        _skills = [Skill.FLUTTER]; 

  double calculateSalary() {
    double salary = _baseSalary;
    salary += _yearOfExperience * 2000;

    for(var skills in _skills) {
      switch(skills) {
        case Skill.FLUTTER:
          salary += 5000;
          break;
        case Skill.DART:
          salary += 3000;
          break;
        case Skill.OTHER:
          salary += 1000;
      }
    }
    return salary;
  }

  void printDetails() {
    print('Employee: $_name, Base Salary: \$$_baseSalary, Skill: $_skills, Address: $_address, YearOfExperience: $_yearOfExperience');
    print('Final Salary: \$${calculateSalary()}');
  }

  String get name => _name;
  double get baseSalary => _baseSalary;
  Address get address => _address;
  List<Skill> get skills => _skills;
  int get yearOfExperience => _yearOfExperience;

}

class Address {
  final String _street;
  final String _city;
  final int _zipCode;  

  Address(this._street, this._city, this._zipCode);

  String get street => _street;
  String get city => _city;
  int get zipCode => _zipCode;

  @override
  String toString() {
    return 'Street: $_street City: $_city ZipCode: $_zipCode';
  }
}


void main() {

  Address address1 = Address('124 High St', 'Phnom Penh', 22000);
  var emp1 = Employee.mobileDeveloper('Vathana', address1, 3);
  emp1.printDetails();
}