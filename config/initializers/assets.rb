# frozen_string_literal: true

# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path.
# Rails.application.config.assets.paths << Emoji.images_path
# Add Yarn node_modules folder to the asset load path.
Rails.application.config.assets.paths << Rails.root.join('node_modules')

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in the app/assets
# folder are already added.
Rails.application.config.assets.precompile += %w(
  index.js index.css jquery-3.2.1.min.js
  bootstrap.min.js bootstrap.min.css
  font-awesome.css
  themify-icons.css
  slick.js slick-custom.js slick.css
  animsition.js animation.css animate.css
  popper.js
  select2.js select2.css
  )
