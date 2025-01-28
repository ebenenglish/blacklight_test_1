# Blacklight Test 1
### Start with a clean app
```
# new app with importmaps, propshaft, and cssbundling-rails, no sprockets
$ rails new blacklight_test_1 -a propshaft --css=bootstrap
```

### add Blacklight
```
gem "blacklight", '~> 8.7.0'
$ bundle install
$ rails generate blacklight:install

# add dotenv
gem 'dotenv-rails', '~> 2.7'
$ bundle install
# create ./.env file
```

### add Blacklight Range Limit
```
gem "blacklight_range_limit", "9.0.0.beta2"
$ bundle install
$ rails generate blacklight_range_limit:install
```

### add Blacklight Gallery
```
gem 'blacklight-gallery', '~> 4.7.0'
$ bundle install
$ yarn add blacklight-gallery
$ yarn add masonry-layout@v4
# then run steps in lib/generators/blacklight_gallery/install_generator.rb manually,
# except for #add_openseadragon
```

Ran into issue with `BlacklightGallery::Install#assets`:
default `app/assets/stylesheets/blacklight_gallery.css.scss` file doesn't seem to do anything
have to add these to `application.bootstrap.scss`:
```
@import "blacklight-gallery/app/assets/stylesheets/blacklight_gallery/gallery";
@import "blacklight-gallery/app/assets/stylesheets/blacklight_gallery/masonry";
@import "blacklight-gallery/app/assets/stylesheets/blacklight_gallery/slideshow";
@import "blacklight-gallery/app/assets/stylesheets/blacklight_gallery/osd_viewer";
```

(can't do `@import "blacklight-gallery/app/assets/stylesheets/blacklight_gallery/default` because it throws an error:
```
15:28:58 css.1  | Error: Can't find stylesheet to import.
15:28:58 css.1  |   ╷
15:28:58 css.1  | 1 │ @import "bootstrap";
15:28:58 css.1  |   │         ^^^^^^^^^^^
15:28:58 css.1  |   ╵
15:28:58 css.1  |   blacklight-gallery/app/assets/stylesheets/blacklight_gallery/default.scss 1:9  @import
```


### Add openseadragon
```
gem "openseadragon", "~> 1.0.11"
$ bundle install
$ yarn add openseadragon-rails # need this for images
$ ./bin/importmap pin openseadragon # need this for JS
# then followed all steps in lib/generators/openseadragon/install_generator.rb manually
```

### Add font-awesome
```
yarn add @fortawesome/fontawesome-free # for CSS
./bin/importmap pin @fortawesome/fontawesome-free # for JS
# modify: 
  - config/initializers/assets.rb
  - app/assets/stylesheets/application.bootstrap.scss
  - app/javascript/application.js

# sources consulted:
https://github.com/rails/cssbundling-rails/issues/22#issuecomment-2020972186
https://discuss.rubyonrails.org/t/unable-to-import-font-awesome/82423/4
https://discuss.rubyonrails.org/t/can-font-awesome-be-used-with-importmaps-in-rails-7/80238
https://blog.corsego.com/fontawesome-importmaps-rails7
https://docs.fontawesome.com/web/use-with/ruby-on-rails
https://docs.fontawesome.com/v5/web/setup/use-package-managers
```
