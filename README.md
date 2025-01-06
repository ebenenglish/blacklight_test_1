# Blacklight Test 1
```
# new app with importmaps, propshaft, and dartsass, no sprockets
# THIS DOESN'T WORK FOR BLACKLIGHT, it will result in Blacklight generator installing Sassc, which has a dependency on Sprockets. Sprockets will then later throw an error: Expected to find a manifest file in `app/assets/config/manifest.js` (Sprockets::Railtie::ManifestNeededError)
$ rails new blacklight_test_1 -a propshaft --css sass
```

```
# new app with importmaps, propshaft, and cssbundling-rails, no sprockets
$ rails new blacklight_test_1 -a propshaft --css=bootstrap
```

```
install blacklight
# Gemfile
gem "blacklight", '~> 8.7.0'
$ bundle install
$ rails generate blacklight:install

# add dotenv
gem 'dotenv-rails', '~> 2.7'
$ bundle install
# create ./.env file
```
```
gem "blacklight_range_limit", "9.0.0.beta2"
$ bundle install
$ rails generate blacklight_range_limit:install
```

```
gem 'blacklight-gallery', '~> 4.7.0'
$ bundle install
$ yarn add blacklight-gallery
$ yarn add masonry-layout@v4
```
CSS
default app/assets/stylesheets/blacklight_gallery.css.scss file doesn't seem to do anything
have to add these to application.bootstrap.scss
```
@import "blacklight-gallery/app/assets/stylesheets/blacklight_gallery/gallery";
@import "blacklight-gallery/app/assets/stylesheets/blacklight_gallery/masonry";
@import "blacklight-gallery/app/assets/stylesheets/blacklight_gallery/slideshow";
@import "blacklight-gallery/app/assets/stylesheets/blacklight_gallery/osd_viewer";
```

(can't do `@import "blacklight-gallery/app/assets/stylesheets/blacklight_gallery/default` because it throws an error:
15:28:58 css.1  | Error: Can't find stylesheet to import.
15:28:58 css.1  |   ╷
15:28:58 css.1  | 1 │ @import "bootstrap";
15:28:58 css.1  |   │         ^^^^^^^^^^^
15:28:58 css.1  |   ╵
15:28:58 css.1  |   blacklight-gallery/app/assets/stylesheets/blacklight_gallery/default.scss 1:9  @import

```
gem "openseadragon", "~> 1.0.11"
$ bundle install
$ yarn add openseadragon-rails # try to not use this, since the project has almost no CSS
$ ./bin/importmap pin openseadragon-rails
$ ./bin/importmap pin openseadragon
then follow the other install steps, except for append_image_paths
```

This seems to work, except for images for viewer, which throws Propshaft::MissingAssetError