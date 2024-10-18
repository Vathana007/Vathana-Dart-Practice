enum Skill { FLUTTER, DART, OTHER }

class Employee {
  final String _name;
  final double _baseSalary;
  final List<Skill> _skills;
  final Address _address;
  final int _yearOfExperience;

  Employee(this._name, this._baseSalary, this._address, this._yearOfExperience, this._skills);

  Employee.mobileDeveloper(String name, Address address, int yearsOfExperience)
      : this._name = name,
        this._baseSalary = 40000, 
        this._address = address,
        this._yearOfExperience = yearsOfExperience,
        this._skills = [Skill.FLUTTER]; 

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
    print('Employee: $_name, Base Salary: \$${_baseSalary}, Skill: $_skills, Address: $_address, YearOfExperience: $_yearOfExperience');
    print('Final Salary: \$${calculateSalary()}');
  }

  String get name => this._name;
  double get baseSalary => this._baseSalary;
  Address get address => this._address;
  List<Skill> get skills => _skills;
  int get yearOfExperience => this._yearOfExperience;

}

class Address {
  final String _street;
  final String _city;
  final int _zipCode;  

  Address(this._street, this._city, this._zipCode);

  String get street => this._street;
  String get city => this._city;
  int get zipCode => this._zipCode;

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