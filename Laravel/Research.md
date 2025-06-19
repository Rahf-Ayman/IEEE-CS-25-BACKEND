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
### Laravel Gates
#### Writing Gates
> Gates are a great way to learn the basics of Laravel's authorization features; however, when building robust Laravel applications you should consider using policies to organize your authorization rules.

Gates are simply closures that determine if a user is authorized to perform a given action. Typically, gates are defined within the boot method of the App\Providers\AppServiceProvider class using the Gate facade. Gates always receive a user instance as their first argument and may optionally receive additional arguments such as a relevant Eloquent model.

In this example, we'll define a gate to determine if a user can update a given App\Models\Post model. The gate will accomplish this by comparing the user's id against the user_id of the user that created the post:

```PHP
use App\Models\Post;
use App\Models\User;
use Illuminate\Support\Facades\Gate;

/**
 * Bootstrap any application services.
 */
public function boot(): void
{
    Gate::define('update-post', function (User $user, Post $post) {
        return $user->id === $post->user_id;
    });
}
```
Like controllers, gates may also be defined using a class callback array:

```PHP
use App\Policies\PostPolicy;
use Illuminate\Support\Facades\Gate;

/**
 * Bootstrap any application services.
 */
public function boot(): void
{
    Gate::define('update-post', [PostPolicy::class, 'update']);
}
```
### Sanctum vs Passport
#### Laravel Sanctum
Laravel Sanctum, introduced in Laravel 7, is a simple authentication package designed primarily for single-page applications (SPAs), mobile applications, and token-based APIs. It offers a lightweight solution that focuses on the personal access token and cookie-based session authentication.

Key Features of Laravel Sanctum:
1. Personal Access Tokens : 
    - Sanctum allows users to generate multiple API tokens for their account. Each token can be granted specific abilities (scopes), which govern what actions can be performed using the token.
1. SPA Authentication
    - Sanctum offers cookie-based authentication for single-page applications (SPAs) without using tokens. This method relies on the browser’s built-in session management, making it easier to integrate with Laravel’s default session-based authentication.

1. Mobile Authentication
   - For mobile applications, Sanctum’s API tokens can be used to authenticate users and protect routes, offering flexibility in securing mobile APIs.

1. Easy Integration with Laravel

    - Sanctum is extremely lightweight and easy to set up, integrating seamlessly with Laravel’s default authentication system. This allows for quick and straightforward token-based or session-based authentication.

1. Token Abilities (Scopes)
   - With Sanctum, each token can be assigned specific abilities, restricting its use to specific actions like creating, updating, or deleting resources.

Advantages of Laravel Sanctum:
- Simple and Lightweight: Sanctum is easy to implement and configure, making it an excellent choice for projects that require minimal overhead.
- SPA-Friendly: Its built-in support for SPA authentication provides a seamless experience when building applications using frameworks like Vue.js, React, or Angular.
- Flexible for Mobile Applications: Sanctum is versatile and supports mobile app authentication through API tokens.
- Session-Based Authentication: For SPAs that don’t want to deal with token-based authentication, Sanctum’s cookie-based approach offers a solution similar to traditional session-based authentication.

Disadvantages of Laravel Sanctum:

- Limited OAuth2 Support: Sanctum does not provide full OAuth2 capabilities, making it unsuitable for applications requiring third-party integrations or delegated authorization.
- Not Ideal for Full OAuth2-Based APIs: If your app needs robust API authorization using OAuth2 with advanced features like authorization codes, refresh tokens, and client credentials, Sanctum might not be the best fit. 

#### Laravel Passport
Laravel Passport is an OAuth2 server implementation that offers more advanced API authentication than Sanctum. Passport was created to provide an OAuth2 server for Laravel applications, making it an ideal choice for apps requiring third-party access, token revocation, refresh tokens, and more advanced authentication flows.
Key Features of Laravel Passport
1.Full OAuth2 Server
    - Passport implements a complete OAuth2 server, offering support for various OAuth2 flows such as Authorization Code Grants, Client Credentials Grants, and Password Grants.
1. Bearer Tokens
    - Passport issues bearer tokens that are used to authenticate API requests. These tokens can be either long-lived or short-lived, depending on the flow.
1. Refresh Tokens
    - Passport supports issuing refresh tokens that allow users to obtain new access tokens without needing to re-authenticate.
1. Authorization Code Grants
    - This flow is widely used when an application wants to allow third-party access to its resources. It redirects users to the authorization server and returns an authorization code that can be exchanged for an access token.
1. Client Credentials Grants
    - This is useful when the API needs to authenticate machine-to-machine requests, such as when a backend service communicates with another API.
1. Password Grants
    - Passport also supports password grants, where the user’s credentials are directly sent to the server to obtain an access token.
1. Token Revocation
    - Passport provides built-in methods to revoke tokens, offering greater security by allowing users to invalidate tokens when needed.
1. Scopes and Permissions
    - With Passport, you can define scopes that limit the actions a token can perform. This is useful for restricting access to certain API endpoints based on user roles or permissions.

Advantages of Laravel Passport
- Full OAuth2 Support: Passport offers robust support for all OAuth2 flows, making it ideal for apps requiring complex authentication mechanisms.
- Third-Party Access: Passport is perfect for applications that need to authorize third-party services to access user data, like integrating with external APIs.
- Token Revocation: Built-in support for token revocation and refreshing allows for better security and flexibility.
- Enterprise-Grade: Passport is the go-to choice for larger applications that require a more sophisticated and secure authentication method.

Disadvantages of Laravel Passport
- Complex Setup: Passport is more complicated to set up compared to Sanctum. It requires additional configurations such as setting up an OAuth2 server, managing client credentials, and handling token expiration.
- Overhead for Small Projects: For smaller projects, Passport might introduce unnecessary overhead due to its advanced features and complex OAuth2 flows.
- Not Ideal for SPAs: Passport was initially designed for full-fledged OAuth2 server use cases, making it more suited for API-based apps than simple SPAs that can benefit from Sanctum’s lightweight design.

#### Passport or Sanctum?
Before getting started, you may wish to determine if your application would be better served by Laravel Passport or Laravel Sanctum. If your application absolutely needs to support OAuth2, then you should use Laravel Passport.

However, if you are attempting to authenticate a single-page application, mobile application, or issue API tokens, you should use Laravel Sanctum. Laravel Sanctum does not support OAuth2; however, it provides a much simpler API authentication development experience.

### Guard vs middleware
**Middleware: The Request Filters**

Middleware in Laravel functions as a filter for HTTP requests entering your application. Think of middleware as a checkpoint through which every request must pass. Middleware can inspect and modify requests before they reach your controllers, and even modify responses before they are sent back to the client. Some common uses of middleware include:

- Authentication: Ensuring users are authenticated before accessing specific routes.
- Logging: Recording request and response data for auditing and debugging.
- CORS Handling: Managing Cross-Origin Resource Sharing for APIs.
Maintenance Mode: Allowing only specific IPs to access the application during maintenance.

When to Use Middleware:

Apply a filter or rule to all incoming requests or specific route groups.
Perform global tasks like authentication checks, input validation, or request logging.
Handle pre- and post-processing of HTTP requests.

**Guards: The Authentication Gatekeepers**

Guards are a fundamental part of Laravel’s authentication system. They define how users are authenticated for each request. Laravel supports several types of guards, such as session and token guards. Guards use drivers to authenticate users, whether through sessions or API tokens.

When to Use Guards:
- Define different authentication mechanisms for different parts of your application.
- Separate web-based session authentication from API token-based authentication.
- Customize user providers to support various models or data sources for user credentials.


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
- [Laravel-passport-Sanctum](https://laravel.com/docs/12.x/passport#passport-or-sanctum)
- [medium-passport-sanctum](https://medium.com/@chirag.dave/laravel-sanctum-vs-passport-choosing-the-right-authentication-for-your-app-4438c85bf900)
- [Laravel-gates](https://laravel.com/docs/12.x/authorization)
- [medium-middleware-guards](https://medium.com/@kesen.somar.99/understanding-middleware-guards-and-gates-in-laravel-e2084cabc945)