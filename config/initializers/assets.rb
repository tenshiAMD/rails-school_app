# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
# Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )

# Be sure to restart your server when you modify this file.
Rails.application.configure do
  # Version of your assets, change this if you want to expire all your assets.
  config.assets.version = '1.0'

  assets_filter_precompile = lambda do |filename, path|
    app_filters = [/(frameworks|app|mailer)\.(css|js)/]
    filters = [/.*\.woff/, /.*\.eot/, /.*\.svg/, /.*\.ttf/, /.*\.swf/]
    # Assets to precompile in app/assets
    precompile = path =~ %r{/app/assets/} && app_filters.concat(filters).any? do |filter|
      if filter.is_a?(Regexp)
        filter.match(filename)
      else
        File.fnmatch(filter.to_s, filename)
      end
    end
    # Assets to precompile for not under in app/assets
    # Skip if +precompile+ is `true`
    precompile = !(path =~ %r{/app/assets/}) && filters.any? do |filter|
      if filter.is_a?(Regexp)
        filter.match(filename)
      else
        File.fnmatch(filter.to_s, filename)
      end
    end unless precompile
    precompile
  end

  config.assets.precompile += [assets_filter_precompile, 'html5shiv.js', 'respond.js', 'ckeditor/*']

  # Add additional assets to the asset load path
  # Rails.application.config.assets.paths << Emoji.images_path

  # Precompile additional assets.
  # application.coffee, application.scss, and all non-JS/CSS in app/assets folder are already added.
  # Rails.application.config.assets.precompile += %w( search.js )
end
