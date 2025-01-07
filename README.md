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
$ yarn add openseadragon-rails
$ ./bin/importmap pin openseadragon-rails
$ ./bin/importmap pin openseadragon
# then followed all steps in lib/generators/openseadragon/install_generator.rb manually
```

Getting error `dom-[fingerprint].js:39 Uncaught ReferenceError: OpenSeadragon is not defined` when trying to use `openseadragon_picture_tag` helper.
Coming from `assets/openseadragon-rails/dom-[fingerprint].js`

