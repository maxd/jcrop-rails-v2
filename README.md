# jcrop-rails-v2

Jcrop asset bundle for Rails >= 3.2.x (jcrop-rails gem looks abandoned)

## Features

* Rails 3.2.x/4.0.x support
* Clean and predictable update process (see scripts/update_jcrop.sh)

## Installation

Add this line to your application's Gemfile:

    gem 'jcrop-rails-v2', '~> x.x.x' # where x.x.x latest gem version

## Usage

### Integration to Rails Asset Pipeline

Add single line to 'application.css':

```
/*
 *= require jquery.Jcrop
 */
```

Then add single line to 'application.js':

```
//= require jquery.Jcrop
```

That's all. Now you can use Jcrop inside your application.

> If you want to use minified JS & CSS versions of Jcrop then just replace `jquery.Jcrop` to `jquery.Jcrop.min` in code snippets provided above.

> In case you are using an older version of the sprockets-rails gem (2.1.0 or lower) you might need to add ```//= depend_on_asset "Jcrop.gif"``` at the top of jquery.Jcrop.css.erb

### In-place integration

If you want to use Jcrop in specified views only you can include its use the following commands:

```
<%= stylesheet_link_tag 'jquery.Jcrop' %>
<%= javascript_include_tag 'jquery.Jcrop' %>
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
