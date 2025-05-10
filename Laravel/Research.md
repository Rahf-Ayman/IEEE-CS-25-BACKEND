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

### Defining relationships in Eloquent models
Eloquent relationships are defined as methods on your Eloquent model classes. Since, like Eloquent models themselves, relationships also serve as powerful query builders, defining relationships as methods provides powerful method chaining and querying capabilities. 

1. **One To One**
- A one-to-one relationship is a very basic relation. For example, a User model might be associated with one Phone. To define this relationship, we place a phone method on the User model. The phone method should call the hasOne method and return its result:
```PHP
<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class User extends Model
{
    /**
     * Get the phone record associated with the user.
     */
    public function phone()
    {
        return $this->hasOne('App\Phone');
    }
}
```
2. **One To Many**:
- A "one-to-many" relationship is used to define relationships where a single model owns any amount of other models. For example, a blog post may have an infinite number of comments. Like all other Eloquent relationships, one-to-many relationships are defined by placing a function on your Eloquent model:
```PHP
<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Post extends Model
{
    /**
     * Get the comments for the blog post.
     */
    public function comments()
    {
        return $this->hasMany('App\Comment');
    }
}
```
3. **Many To Many**:
- Many-to-many relations are slightly more complicated than hasOne and hasMany relationships. An example of such a relationship is a user with many roles, where the roles are also shared by other users. For example, many users may have the role of "Admin". To define this relationship, three database tables are needed: users, roles, and role_user. The role_user table is derived from the alphabetical order of the related model names, and contains the user_id and role_id columns.
```PHP
<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class User extends Model
{
    /**
     * The roles that belong to the user.
     */
    public function roles()
    {
        return $this->belongsToMany('App\Role');
    }
}
```
### Attaching, syncing, detaching related records
1. **Attaching** :Adding Records to a Many-to-Many Relationship
- The attach method is primarily used in many-to-many relationships to add records to the pivot table that connects two models.
```PHP
$role = Role::find(1);
$user->roles()->attach($role->id);
```

2. **Detaching** :Removing Records from a Many-to-Many Relationship
- the detach method allows we to remove records from a many-to-many relationship's pivot table:
```PHP
$role = Role::find(1);
$user->roles()->detach($role->id);
```
3. **syncing** :Syncing Records in a Many-to-Many Relationship
- The sync method is a powerful way to synchronize the records in a many-to-many relationship. It takes an array of related model IDs as its argument and ensures that the pivot table contains only those records. Any existing records not in the provided array will be removed:
```PHP
$roleIds = [1, 2, 3];
$user->roles()->sync($roleIds);
```
### The N+1 query problem in Laravel
The N+1 query problem occurs when an application makes one initial query to the database followed by an additional query for each result obtained from the first query. This typically happens in object-relational mapping (ORM) frameworks when dealing with relationships between models.

```PHP
$posts = Post::all(); // one query
foreach ($posts as $post) {
    $comments = $post->comments; // Additional query for each post
}
```
### What is the XSRF or CSRF?
**Cross-site scripting (XSS)**: allows an attacker to execute arbitrary JavaScript within the browser of a victim user. 

**Cross-site request forgery (CSRF)**: allows an attacker to induce a victim user to perform actions that they do not intend to.

The consequences of XSS vulnerabilities are generally more serious than for CSRF vulnerabilities:

- CSRF often only applies to a subset of actions that a user is able to perform. Many applications implement CSRF defenses in general but overlook one or two actions that are left exposed. Conversely, a successful XSS exploit can normally induce a user to perform any action that the user is able to perform, regardless of the functionality in which the vulnerability arises.

- CSRF can be described as a "one-way" vulnerability, in that while an attacker can induce the victim to issue an HTTP request, they cannot retrieve the response from that request. Conversely, XSS is "two-way", in that the attacker's injected script can issue arbitrary requests, read the responses, and exfiltrate data to an external domain of the attacker's choosing.

### What is Livewire?
Livewire is a full-stack framework in Laravel created by Caleb Porzio that makes it easy to create reactive interfaces without writing any Javascript, that’s right, no Javascript, all in PHP. This means developers can leverage the power of Laravel and Blade templates to build dynamic UIs, we can respond to user’s actions such as form submissions, scrolling, mouse movements, or button clicks, without reloading the page. This means that users can enjoy a smoother, more fluid experience when interacting with web applications built using Livewire like it was with other front-end frameworks.

### Laravel Development Packages

1.Laravel Debugbar:
Debugbar displays all database queries, rendered templates, and passed parameters. It even lets you add custom messages for easy debugging. Spend less time guessing and more time building with Laravel Debugbar.
```PHP
    Debugbar::info($object);
    Debugbar::error('Error!');
    Debugbar::warning('Watch out…');
    Debugbar::addMessage('Another message', 'mylabel')
```
2.Laravel User Verification
The Laravel User Verification package simplifies user onboarding by handling email verification and validation. It offers flexibility to customize email templates, verification logic, and the user experience to perfectly fit your application’s needs.
Plus, the package integrates seamlessly with Laravel’s authentication and notification systems, saving you development time and effort.
```PHP
    public function register(Request $request)
    {
       $this->validator($request->all())->validate();
       $user = $this->create($request->all());
       event(new Registered($user));
       $this->guard()->login($user);
       UserVerification::generate($user);
       UserVerification::send($user, 'My Custom E-mail Subject');
       return $this->registered($request, $user)
           ?: redirect($this->redirectPath());
    }
```
3.Socialite
Laravel Socialite, developed by the Laravel team itself, offers a breeze-through solution. Users can log in with popular platforms like Facebook, Google, and Twitter.
Socialite integrates seamlessly with Laravel’s authentication system and handles OAuth complexities under the hood. This frees you to focus on core features while leveraging secure social logins.
```PHP
    $user = Socialite::driver('github')->user();
    // OAuth Two Providers
    $token = $user->token;
    $refreshToken = $user->refreshToken; // not always provided
    $expiresIn = $user->expiresIn;
    // All Providers
    $user->getId();
    $user->getName();
    $user->getEmail();
    $user->getAvatar();
```
4.Laravel Mix
Laravel Mix, the go-to asset compilation tool for Laravel projects. This successor to Laravel Elixir offers a clean and powerful API for defining your build steps in a more effective way.
Laravel Mix integrates seamlessly with Webpack, letting you leverage hot module replacement (HMR) and browser synchronization. See changes reflected instantly without manual reloads, saving you valuable development time.
```PHP
    mix.js('resources/assets/js/app.js', 'public/js')
    .sass('resources/assets/sass/app.scss', 'public/css');
```
5.Eloquent-Sluggable
Laravel Eloquent-Sluggable automates the process! This handy tool generates unique slugs based on your model attributes, creating clean and search-engine-friendly URLs for your Laravel application.

Eloquent-Sluggable offers customization options for slug fields, separators, and update behavior. Plus, it provides hooks for handling special cases and integrating your own logic, ensuring your URLs are always optimized.
```PHP
    class Post extends Eloquent
    {
       use Sluggable;
       protected $fillable = ['title'];
       public function sluggable() {
           return [
               'slug' => [
                   'source' => ['title']
               ]
           ];
       }
    }
    $post = new Post([
       'title' => 'My Awesome Blog Post',
    ]);
    // $post->slug is "my-awesome-blog-post
```




#### Resourses
- [Laravel-request](https://laravel.com/docs/12.x/lifecycle)
- [Laravel-routing](https://laravel.com/docs/12.x/routing)
- [Laravel-Facades](https://laravel.com/docs/12.x/facades)
- [Laravel-Blade](https://laravel.com/docs/12.x/blade#rendering-inline-blade-templates)
- [ORM](https://www.baeldung.com/cs/object-relational-mapping)
- [Laravel-Eloquent-Relationships](https://laravel.com/docs/5.5/eloquent-relationships#one-to-one)
- [Sync-Attach-Detach-in-Laravel](https://medium.com/@rajvir.ahmed.shuvo/understanding-sync-attach-and-detach-in-laravel-managing-relationships-with-eloquent-394a7cf7fabd)
- [loadforge](https://loadforge.com/guides/optimizing-laravel-applications-by-detecting-n1-queries)
- [XSS-CSRF](https://portswigger.net/web-security/csrf/xss-vs-csrf)
- [Laravel-Package](https://www.cloudways.com/blog/best-laravel-packages/)