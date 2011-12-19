# Dust-Rails

This gem adds the Dust template and a corresponding assets engine to the asset pipeline in Rails => 3.1 applications.

For detailed information about Dust, visit <http://akdubya.github.com/dustjs/>

## Installing

Add the following line to your Gemfile:

	gem 'dust-rails'

Update your bundle:

	bundle install

## Usage

Place individual Dust template file in their own file with `.js.dust` extension:

```javascript
	// app/assets/javascripts/dusts/demo.js.dust
	Hello {name}! You have {count} new messages.
```

In your javascript files, require `dust-core` and your own template files.

```javascript
	// app/assets/javascripts/application.js
	require dust-core
	require_tree ./dusts
```

All done. Your template files will be compiled and registered.
