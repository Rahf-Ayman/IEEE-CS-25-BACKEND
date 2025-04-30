# Laravel Research

### Request Lifecycle
First Steps
- The entry point for all requests to a Laravel application is the public/index.php file.

HTTP / Console Kernels
- Next, the incoming request is sent to either the HTTP kernel or the console kernel, using the <code>handleRequest</code> or <code>handleCommand</code> methods of the application instance, depending on the type of request entering the application. 

- The HTTP kernel defines an array of <code>bootstrappers</code>  that will be run before the request is executed. These <code>bootstrappers</code> configure error handling, configure logging, detect the application environment, and perform other tasks that need to be done before the request is actually handled.

Routing
- Once the application has been bootstrapped and all service providers have been registered, the  <code>Request</code> will be handed off to the router for dispatching. The router will dispatch the request to a route or controller, as well as run any route specific middleware.

- Middleware provide a convenient mechanism for filtering or examining HTTP requests entering your application. For example, Laravel includes a middleware that verifies if the user of your application is authenticated. If the user is not authenticated, the middleware will redirect the user to the login screen. However, if the user is authenticated, the middleware will allow the request to proceed further into the application.

- Once the route or controller method returns a response, the response will travel back outward through the route's middleware, giving the application a chance to modify or examine the outgoing response.

Finishing Up
- Finally, once the response travels back through the middleware, the HTTP kernel's handle method   returns the response object to the handleRequest of the application instance, and this method calls the send method on the returned response. The send method sends the response content to the user's web browser. We've now completed our journey through the entire Laravel request lifecycle!

### Routing in Laravel
Basic Routing
- The most basic Laravel routes accept a URI and a closure, providing a very simple and expressive method of defining routes and behavior without complicated routing configuration files:
```PHP
use Illuminate\Support\Facades\Route;

Route::get('/greeting', function () {
    return 'Hello World';
});
```
The Default Route Files

- All Laravel routes are defined in your route files, which are located in the routes directory. These files are automatically loaded by Laravel using the configuration specified in your application's bootstrap/app.php file. The routes/web.php file defines routes that are for your web interface. These routes are assigned the web middleware group, which provides features like session state and CSRF protection.

- For most applications, you will begin by defining routes in your routes/web.php file. The routes defined in routes/web.php may be accessed by entering the defined route's URL in your browser. For example, you may access the following route by navigating to http://example.com/user in your browser:
```PHP
use App\Http\Controllers\UserController;

Route::get('/user', [UserController::class, 'index']);
```

### Facades
Throughout the Laravel documentation, you will see examples of code that interacts with Laravel's features via "facades". Facades provide a "static" interface to classes that are available in the application's service container. Laravel ships with many facades which provide access to almost all of Laravel's features.

Laravel facades serve as "static proxies" to underlying classes in the service container, providing the benefit of a terse, expressive syntax while maintaining more testability and flexibility than traditional static methods. It's perfectly fine if you don't totally understand how facades work - just go with the flow and continue learning about Laravel.

All of Laravel's facades are defined in the Illuminate\Support\Facades namespace. So, we can easily access a facade like so:
```PHP
use Illuminate\Support\Facades\Cache;
use Illuminate\Support\Facades\Route;

Route::get('/cache', function () {
    return Cache::get('key');
});
```
When to Utilize Facades

- Facades have many benefits. They provide a terse, memorable syntax that allows you to use Laravel's features without remembering long class names that must be injected or configured manually. Furthermore, because of their unique usage of PHP's dynamic methods, they are easy to test.

- However, some care must be taken when using facades. The primary danger of facades is class "scope creep". Since facades are so easy to use and do not require injection, it can be easy to let your classes continue to grow and use many facades in a single class. Using dependency injection, this potential is mitigated by the visual feedback a large constructor gives you that your class is growing too large. So, when using facades, pay special attention to the size of your class so that its scope of responsibility stays narrow. If your class is getting too large, consider splitting it into multiple smaller classes.

### Blade Templates and how it works
Introduction
- Blade is the simple, yet powerful templating engine that is included with Laravel. Unlike some PHP templating engines, Blade does not restrict you from using plain PHP code in your templates. In fact, all Blade templates are compiled into plain PHP code and cached until they are modified, meaning Blade adds essentially zero overhead to your application. Blade template files use the .blade.php file extension and are typically stored in the resources/views directory.

- Blade views may be returned from routes or controllers using the global view helper. Of course, as mentioned in the documentation on views, data may be passed to the Blade view using the view helper's second argument:

```PHP
Route::get('/', function () {

    return view('greeting', ['name' => 'Finn']);

});
```
Displaying Data
- You may display data that is passed to your Blade views by wrapping the variable in curly braces. For example, given the following route:
```PHP
Route::get('/', function () {

    return view('welcome', ['name' => 'Samantha']);

});
```
- You may display the contents of the name variable like so:
```PHP
Hello, {{ $name }}.
```
Blade Directives
- In addition to template inheritance and displaying data, Blade also provides convenient shortcuts for common PHP control structures, such as conditional statements and loops. These shortcuts provide a very clean, terse way of working with PHP control structures while also remaining familiar to their PHP counterparts:
1. If Statements
1. Switch Statements
1. Loops
1. The Loop Variable

Building Layouts
- Layouts Using Components:
Most web applications maintain the same general layout across various pages. It would be incredibly cumbersome and hard to maintain our application if we had to repeat the entire layout HTML in every view we create. Thankfully, it's convenient to define this layout as a single Blade component and then use it throughout our application.

### What is the ORM? ,why it is so useful?
Object Relational Mapping (ORM) is a technique used in creating a "bridge" between object-oriented programs and, relational databases.

Advantages:
1. we can use the backend’s own language to code all data access.
1. It makes reference to a class (namely Person) that defines the attributes and business-related methods. Classes that deal with object-relational mappings are called Models. Those classes use as, a template, a class from the ORM’s library of model classes. That way, it inherits all methods needed to create, retrieve, update, and delete from the database.

#### Resourses
- [Laravel-request](https://laravel.com/docs/12.x/lifecycle)
- [Laravel-routing](https://laravel.com/docs/12.x/routing)
- [Laravel-Facades](https://laravel.com/docs/12.x/facades)
- [Laravel-Blade](https://laravel.com/docs/12.x/blade#rendering-inline-blade-templates)
- [ORM](https://www.baeldung.com/cs/object-relational-mapping)