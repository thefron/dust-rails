### Now following [LinkedIn managed version](https://github.com/linkedin/dustjs) as original repository is not being updated anymore.

# Dust-Rails

This gem adds the Dust template and a corresponding assets engine to the asset pipeline in Rails => 3.1 applications.

For detailed information about Dust, visit <http://akdubya.github.com/dustjs/>



## Installing

Add the following line to your Gemfile:

	gem 'dust-rails'

Update your bundle:

	bundle install

## Usage

Place individual Dust template file in their own file with `template_name.js.dust` extension.

```javascript
	/* app/assets/javascripts/templates/demo.js.dust */
	
	Hello {name}! You have {count} new messages.
```

Which will be compiled and rendered as:

```javascript
	(function(){dust.register("demo",body_0);function body_0(chk,ctx){return chk.write("Hello ").reference(ctx.get("name"),ctx,"h").write("! You have ").reference(ctx.get("count"),ctx,"h").write(" new messages.");}return body_0;})();
```


Dust-rails resolves the name of the template out of relative path of each template file.
Relative path starts from `app/assets/javascripts/templates/` by default.

	app/assets/javascripts/templates/demo1.js.dust -> demo1
	app/assets/javascripts/templates/demos/demo2.js.dust -> demos/demo2

If you want to change the default root path of template files, add following configuration into application.rb:

```ruby
    # config/application.rb
    module YourApp
        class Application < Rails::Application
            config.dust.template_root = 'app/assets/your_path_to_templates/'
        end
    end
```

In your javascript files, require `dust-core` and your own template files.
Using `require_tree` is recommended if you want to require all the template files at once.

```javascript
	/* app/assets/javascripts/application.js */
	
	//= require dust-core
	//= require_tree ./templates
	...
	dust.render("demo", {name: "Fred", count: 10}, function(err, out) {
 		console.log(out);
	});
```

All done. Your template files will be compiled and registered.
