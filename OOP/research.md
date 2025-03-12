# OOP Research
### Who invented OOP and Why?
- Object-Oriented Programming (OOP) was first introduced by Alan Kay in the late 1960s and early 1970s while working on the Smalltalk programming language at Xerox PARC. However, the core ideas of OOP were inspired by Simula (1967), a programming language created by Ole-Johan Dahl and Kristen Nygaard in Norway. Simula was the first language to introduce the concept of classes and objects.
- Before OOP, procedural programming (like C) was the dominant paradigm, but it had limitations in handling complex software systems. OOP was invented to solve these problems

### Encapsulation & Abstraction
 Abstraction | Encapsulation
 |:------- |:-------
 Abstraction is process of hiding the implementation details and showing only the functionality to the users. |Encapsulation is a process of binding data and methods together in a single unit, providing controlled access to data.
 Main feature: reduce complexity, promote maintainability, and also provide clear separation between the interface and its concrete implementation. | Main feature: data hiding, providing access control and modularity.
 In abstraction, problems are solved at the design or interface level. | While in encapsulation, problems are solved at the implementation level.
 We can implement abstraction using abstract class and interfaces. | Whereas encapsulation can be implemented using by access modifier i.e. private, protected and public and nested classes.
 In abstraction, implementation complexities are hidden using abstract classes and interfaces. | While encapsulation uses private access modifier to hide the data and use getter and setter to provide controlled access to data.

 ### Inheritance
 Inheritance is a feature or a process in which, new classes are created from the existing classes. The new class created is called “derived class” or “child class” and the existing class is known as the “base class” or “parent class”. The derived class now is said to be inherited from the base class.

When we say derived class inherits the base class, it means that the derived class inherits all the properties of the base class, without changing the properties of base class and may add new features to its own. These new features in the derived class will not affect the base class. The derived class is the specialized class for the base class.

- Sub Class: The class that inherits properties from another class is called Subclass or Derived Class.
- Super Class: The class whose properties are inherited by a subclass is called Base Class or Superclass.

### PHP Interfaces & Polymorphism
Polymorphism is a core principle of object-oriented programming (OOP) where objects of different classes can be treated as objects of a common superclass. It allows methods to perform different actions based on the object they are called upon, enhancing code flexibility and reusability.
- Method Overriding:
We can implement polymorphism in PHP by overriding methods defined in the parent class within the child class.
Child classes provide their own implementation of the method with the same name and signature as the parent class method.
- Dynamic Binding:
PHP uses dynamic binding to determine which method implementation to execute at runtime based on the object type.
When a method is called on an object, PHP resolves the method implementation based on the object's actual class type. 
- Interfaces and Abstract Classes:
Interfaces and abstract classes can also facilitate polymorphism in PHP by defining a common set of method signatures that concrete classes must implement.
Objects of different classes implementing the same interface can be treated interchangeably.
### PHP Traits
PHP only supports single inheritance: a child class can inherit only from one single parent.

So, what if a class needs to inherit multiple behaviors? OOP traits solve this problem.

Traits are used to declare methods that can be used in multiple classes. Traits can have methods and abstract methods that can be used in multiple classes, and the methods can have any access modifier (public, private, or protected).
```php
<?php
trait message1 {
public function msg1() {
    echo "OOP is fun! ";
  }
}

class Welcome {
  use message1;
}

$obj = new Welcome();
$obj->msg1();
?>
```


##### resources
- [medium](https://medium.com/javascript-scene/the-forgotten-history-of-oop-88d71b9b2d9f)
- [geeksforgeeks](https://www.geeksforgeeks.org/difference-between-abstraction-and-encapsulation-in-java-with-examples/)
- [geeksforgeeks_inheritance](https://www.geeksforgeeks.org/what-is-inheritance-1/)
- [geeksforgeeks_Polymorphism](https://www.geeksforgeeks.org/how-to-implement-polymorphism-in-php/)
- [w3schools_traits](https://www.w3schools.com/php/php_oop_traits.asp)