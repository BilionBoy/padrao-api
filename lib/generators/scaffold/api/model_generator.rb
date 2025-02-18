require "rails/generators"
require "rails/generators/active_record/model/model_generator"

module Scaffold
  module Api
    class ModelGenerator < Rails::Generators::NamedBase
      source_root File.expand_path("templates", __dir__)

      def create_model_files
        model_path = File.join("app/models", "#{file_name}.rb")
        template "model.rb.tt", model_path
      end
    end
  end
end
