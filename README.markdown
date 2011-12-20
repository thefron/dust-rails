# Dust-Rails

This gem adds the Dust template and a corresponding assets engine to the asset pipeline in Rails => 3.1 applications.

For detailed information about Dust, visit <http://akdubya.github.com/dustjs/>

## Installing

Add the following line to your Gemfile:

	gem 'dust-rails'

Update your bundle:

	bundle install

## Usage

Place individual Dust template file in their own file with `template_name.js.dust` extension:

```javascript
	/* app/assets/javascripts/dusts/demo.js.dust */
	
	Hello {name}! You have {count} new messages.
```

Which will be compiled and rendered as:

```javascript
	(function(){dust.register("demo",body_0);function body_0(chk,ctx){return chk.write("Hello ").reference(ctx.get("name"),ctx,"h").write("! You have ").reference(ctx.get("count"),ctx,"h").write(" new messages.");}return body_0;})();
```


In your javascript files, require `dust-core` and your own template files.
I recommend you put all the template files under `assets/javascripts/dusts` and require using `require_tree` for easy use.

```javascript
	/* app/assets/javascripts/application.js */
	
	//= require dust-core
	//= require_tree ./dusts
	...
	dust.render("demo", {name: "Fred", count: 10}, function(err, out) {
 		console.log(out);
	});
```

All done. Your template files will be compiled and registered.
