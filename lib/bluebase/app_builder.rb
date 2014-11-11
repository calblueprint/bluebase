module Bluebase
  class AppBuilder < Rails::AppBuilder
    include Bluebase::Actions

    #########################################################
    # Root directory files
    #########################################################
    def readme
      template "README.md.erb", "README.md"
    end

    def replace_gemfile
      remove_file "Gemfile"
      template "Gemfile.erb", "Gemfile"
    end

    def add_envrc
      copy_file ".envrc", ".envrc"
    end

    def replace_gitignore
      remove_file ".gitignore"
      copy_file "bluebase_gitignore", ".gitignore"
    end

    def add_rubocop_and_hound_config
      copy_file ".hound.yml", ".hound.yml"
      copy_file ".rubocop.yml", ".rubocop.yml"
    end

    def add_rvm_config
      create_file ".ruby-gemset",  "#{app_path}\n"
      create_file ".ruby-version", "#{Bluebase::RUBY_VERSION}\n"
    end

    def add_travis_config
      copy_file ".travis.yml", ".travis.yml"
    end

    def add_guardfile
      # TODO: Guardfile needs more finetuning
      copy_file "Guardfile", "Guardfile"
    end

    #########################################################
    # app/ directory files
    #########################################################
    def add_vendor_dirs
      %w(app/assets/javascripts/vendor app/assets/stylesheets/vendor).each do |dir|
        run "mkdir #{dir}"
        run "touch #{dir}/.keep"
      end
    end

    def replace_application_css_with_scss
      base_dir = "app/assets/stylesheets"
      remove_file "#{base_dir}/application.css"
      copy_file "app/application.css.scss", "#{base_dir}/application.css.scss"
    end

    def add_application_folder_and_files_to_views
      base_dir = "app/views/application"
      empty_directory base_dir
      copy_file "app/_flash.html.slim", "#{base_dir}/_flash.html.slim"
      copy_file "app/_ga_boiler.html.slim", "#{base_dir}/_ga_boiler.html.slim"
      copy_file "app/_fb_meta_tags.html.slim", "#{base_dir}/_fb_meta_tags.html.slim"
    end

    def replace_application_erb_with_slim
      base_dir = "app/views/layouts"
      remove_file "#{base_dir}/application.html.erb"
      copy_file "app/application.html.slim", "#{base_dir}/application.html.slim"
    end
  end
end
