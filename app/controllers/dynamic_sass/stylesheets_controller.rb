module DynamicSass
  class StylesheetsController < ActionController::Base
    def show
      stylesheet = params[:stylesheet]
      unless stylesheet.present? and stylesheet =~ /^[0-9a-z\-_]+$/
        render :text => "Bad stylesheet.", :status => :bad_request
        return
      end

      sass_path = File.join(Rails.root, "public", "stylesheets", "sass", "#{stylesheet}.sass")

      unless File.exists?(sass_path)
        render :text => "No such stylesheet here.", :status => :not_found
        return
      end

      if stale?(:last_modified => File.mtime(sass_path).utc)
        expires_in 24.hours, :public => true
        sass_engine = Sass::Engine.new(File.read(sass_path))
        render :text => sass_engine.render, :content_type => "text/css"
      end
    end
  end
end
