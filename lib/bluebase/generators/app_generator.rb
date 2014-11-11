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

    def outro
      say "Your bluebase is complete!"
      say "Remember to set your Code Climate token in .travis.yml"
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
