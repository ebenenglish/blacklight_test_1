class ApplicationController < ActionController::Base
  helper Openseadragon::OpenseadragonHelper
  # Adds a few additional behaviors into the application controller
  include Blacklight::Controller

  # adds some site-wide behavior into the application controller
  include CommonwealthVlrEngine::Controller

  layout :determine_layout if respond_to? :layout

  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
end
