void main() {
  Person gloire = Person("Gloire", 27);
  gloire.sayHello();
}

void myFunction({required String name, required int age}) {
  if (name.contains("i")) {
    print("Your name: $name is Golden and you are $age years old");
  } else {
    print("You are $name and you are $age years old");
  }
}

class Person {
  String name;
  int age;

  // Constructeur
  Person(this.name, this.age);
  factory Person.something(Map<String, int> data){
    return Person(data['name']! as String, data['age']!);
  }

  // Méthode
  void sayHello() {
    print('Hello, my name is $name and I am $age years old.');
  }
}
