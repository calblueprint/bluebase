require "rails/generators"
require "rails/generators/rails/app/app_generator"

module Bluebase
  class AppGenerator < Rails::Generators::AppGenerator
    class_option :database, type: :string, aliases: "-d", default: "postgresql",
      desc: "Preconfigure for selected database (options: #{DATABASES.join('/')})"

    class_option :heroku, type: :boolean, aliases: "-H", default: false,
      desc: "Create staging and production Heroku apps"

    class_option :github, type: :string, aliases: "-G", default: nil,
      desc: "Create Github repository and add remote origin pointed to repo"

    class_option :skip_test_unit, type: :boolean, aliases: "-T", default: true,
      desc: "Skip Test::Unit files"

    # Invoked after Rails generates app
    def finish_template
      invoke :bluebase_customization
      super
    end

    def bluebase_customization
      invoke :customize_root_files
      invoke :customize_app_files
      invoke :customize_bin_files
      invoke :customize_config_files
      invoke :outro
    end

    def customize_root_files
      build :replace_gemfile
      build :add_envrc
      build :replace_gitignore
      build :add_rubocop_and_hound_config
      build :add_rvm_config
      build :add_travis_config
      build :add_guardfile
    end

    def customize_app_files
      build :add_vendor_dirs
      build :replace_application_css_with_scss
      build :add_application_folder_and_files_to_views
      build :replace_application_erb_with_slim
    end

    def customize_bin_files
      build :add_setup_to_bin
    end

    def customize_config_files
      build :configure_development_environment
      build :configure_production_environment
      build :add_staging_environment
      build :add_devise_config
      build :add_figaro_config
      build :replace_en_yml
      build :add_application_yml
      build :add_database_yml
      build :add_i18n_tasks_yml
      build :replace_secrets_yml
      build :add_smtp_settings
    end

    def outro
      say "Your bluebase is complete!"
      say "Remember to set:"
      say "- Your Code Climate token in .travis.yml"
      say "- Your env variables in application.yml"
    end

    def run_bundle
      # We'll run it ourselves
    end

    private

    def get_builder_class
      Bluebase::AppBuilder
    end
  end
end
