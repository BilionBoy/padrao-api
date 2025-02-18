require "rails/generators/active_record/model/model_generator"

module Scaffold
  module Api
    class ModelGenerator < Rails::Generators::NamedBase
      source_root File.expand_path("templates", __dir__)

      argument :attributes, type: :array, default: []

      def create_model_files
        template "models/model.rb.tt", File.join("app/models", "#{file_name}.rb")
        create_migration_file
        create_table_migration # Certifique-se de chamar o método para a criação da tabela
      end
    end
  end
end
