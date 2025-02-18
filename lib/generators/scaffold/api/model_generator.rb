require "rails/generators"
require "rails/generators/base"

module Scaffold
  module Api
    class ModelGenerator < Rails::Generators::Base # Certifique-se de que está herdando de `Base` e não de `ModelGenerator`
      source_root File.expand_path("templates/models", __dir__)

      def create_model_files
        model_path = File.join("app/models", "#{file_name}.rb")
        template "model.rb.tt", model_path
      end
    end
  end
end
