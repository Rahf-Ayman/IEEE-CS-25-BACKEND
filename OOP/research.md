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
### Late static binding & how it works
In PHP, programs are saved and then directly run on the browser, the script is executed through a web server and we get the output. We don’t compile PHP programs manually but that does not mean it is never compiled. The PHP interpreter does that for you and runs it. So there are two phases, first, compile-time and second run time. During the compile time, the normal variables are replaced with their values but the static keywords are replaced only in the run time. Overriding a property in child class and creating the instance of the child class, so to get the overridden output, the late static binding concept is used by writing static keyword before using the property. Whenever a PHP interpreter gets the request to compile a function. If it sees any static property, then it leaves the property pending for run time and the property gets its value during runtime from the function it is being called. This is called late static binding.

Program: One thing we can do is that copy the getOwner() function from the Car class to newCar class but it can be done for small programs. What if your program contains 100 to 1000 functions. To solve this, the static keyword can be used instead of the self. The newCar class doesnot contains getOwner() function but still it inherits getCar() function of newCar. This happened because the getOwner() is calling getCar() in runtime instead of compile time. Runtime access of getOwner() function in Car class and not the compile or early access. In this way, we can get getOwner() function in newCar() class without creating an object.
```php
<?php 

// Car function 
class Car 
{ 
	public static $name = 'Tesla'; 
	public static function getCar() 
	{ 
		return "The car name is : " . self::$name; 
	} 
	public static function getOwner() 
	{ 
		echo static::getCar(); 
	} 
} 
class newCar extends Car 
{ 

	public static function getCar() 
	{ 

		return "The car name is : " . self::$name . 
						" and owner is Anshu."; 
	} 

} 
Car::getOwner(); //output: The car name is : Tesla
echo "\n"; 
newCar::getOwner(); //output: The car name is : Tesla and owner is Anshu.

?> 

```
### Using OOP with MySQL (PDO & MySQLi)
Both MySQLi and PDO have their advantages:

PDO will work on 12 different database systems, whereas MySQLi will only work with MySQL databases.

So, if you have to switch your project to use another database, PDO makes the process easy. You only have to change the connection string and a few queries. With MySQLi, you will need to rewrite the entire code - queries included.

Both are object-oriented, but MySQLi also offers a procedural API.

Both support Prepared Statements. Prepared Statements protect from SQL injection, and are very important for web application security.

Open a Connection to MySQL
example MySQLi:
```php
<?php
$servername = "localhost";
$username = "username";
$password = "password";

// Create connection
$conn = new mysqli($servername, $username, $password);

// Check connection
if ($conn->connect_error) {
  die("Connection failed: " . $conn->connect_error);
}
echo "Connected successfully";
?>
```
example PDO:
```php
<?php
$servername = "localhost";
$username = "username";
$password = "password";

try {
  $conn = new PDO("mysql:host=$servername;dbname=myDB", $username, $password);
  // set the PDO error mode to exception
  $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
  echo "Connected successfully";
} catch(PDOException $e) {
  echo "Connection failed: " . $e->getMessage();
}
?>
```
### Factory Pattern with Anonymous Classes
**Factory Pattern**: The Factory Pattern is a creational design pattern that provides an interface for creating objects but lets subclasses or methods decide which class to instantiate. Instead of using the new keyword directly in your code, you use a factory method to create objects.

Anonymous classes are useful when you need lightweight, one-time-use objects without creating a separate class file.
```php
<?php

// Factory class
class AnimalFactory {
    public static function createAnimal($type) {
        switch ($type) {
            case 'dog':
                return new class {
                    public function speak() {
                        return "Woof! Woof!";
                    }
                };
            case 'cat':
                return new class {
                    public function speak() {
                        return "Meow!";
                    }
                };
            default:
                throw new Exception("Unknown animal type");
        }
    }
}

// Usage
$dog = AnimalFactory::createAnimal('dog');
echo $dog->speak(); // Output: Woof! Woof!

$cat = AnimalFactory::createAnimal('cat');
echo $cat->speak(); // Output: Meow!

?>

``` 
### Anonymous Classes
As the term "anonymous" suggests, it is a class without a (programmer declared) name. The usual practice is to define a class with a certain identifier, so that it can be used repeatedly. The anonymous class, on the other hand is for one-time use only.

Example
In the following code, an anonymous class is instantiated and stored in $obj object. The class includes definitions of addition() and division() methods, which are called with the $obj object.
```php
<?php
   $obj = new class(10) {
      private int $x;
      function __construct($x) {
         $this->x = $x;
      }

      public function addition($x) {
         return $this->x+$x;
      }
      public function division($x) {
         return $this->x/$x;
      }
   };

   echo "Addition: " . $obj->addition(20) . PHP_EOL; // Addition: 30
   echo "Division: " . $obj->division(20) . PHP_EOL; // Division: 0.5
?>
```

### MVC Architecture
MVC (Model-View-Controller) architecture is a universal pattern of a structure in which an application is divided into three parts which are all dedicated to certain parts of the whole application. This pattern is normally used in software development to create organized and easy-to-maintain code.
![](https://media.geeksforgeeks.org/wp-content/uploads/20240704102850/MVC-Architecture.webp)

Key Components of MVC Architecture
Here are detailed explanations and examples for each of the key components of the MVC architecture:Here are detailed explanations and examples for each of the key components of the MVC architecture:

- **Model**: The Model component brings together all the core details and business knowledge. Therefore, it is concerned with the management of data, states and rules of the application. For example, in a booking system the Model might deal with user data, booking details and with calculations of prices.
- **View**: The View component is responsible for the presentation layer. It takes the data provided by the Model and presents it to the user in a readable format.
- **Controller**: The Controller component handles user input and interactions. It processes the input, interacts with the Model, and updates the View accordingly.



##### resources
- [medium](https://medium.com/javascript-scene/the-forgotten-history-of-oop-88d71b9b2d9f)
- [geeksforgeeks](https://www.geeksforgeeks.org/difference-between-abstraction-and-encapsulation-in-java-with-examples/)
- [geeksforgeeks_inheritance](https://www.geeksforgeeks.org/what-is-inheritance-1/)
- [geeksforgeeks_Polymorphism](https://www.geeksforgeeks.org/how-to-implement-polymorphism-in-php/)
- [w3schools_traits](https://www.w3schools.com/php/php_oop_traits.asp)
- [geeksforgeeks_static-bindings](https://www.geeksforgeeks.org/what-is-late-static-bindings-in-php/)
- [geeksforgeeks_mvc](https://www.geeksforgeeks.org/mvc-architecture-system-design/)
- [tutorialspoint_anonymous](https://www.tutorialspoint.com/php/php_anonymous_classes.htm)
- [medium_factory](https://medium.com/@kishor10d/understanding-the-factory-pattern-in-php-aa51550b79d5)
- [w3schools](https://www.w3schools.com/php/php_mysql_connect.asp?utm_source=chatgpt.com)