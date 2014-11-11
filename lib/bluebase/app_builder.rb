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
      remove "Gemfile"
      template "Gemfile.erb", "Gemfile"
    end

    def add_envrc
      copy_file ".envrc", ".envrc"
    end

    def replace_gitignore
      remove_file ".gitignore"
      copy_file "gitignore", ".gitignore"
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

  end
end
