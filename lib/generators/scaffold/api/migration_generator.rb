require "rails/generators/named_base"

module Scaffold
  module Api
    class MigrationGenerator < Rails::Generators::NamedBase
      source_root File.expand_path("templates", __dir__)

      def create_migration_file
        migration_name = "create_#{file_name.pluralize}"
        migration_template "migrations/migration.rb.tt",
                           File.join("db/migrate", "#{Time.now.strftime("%Y%m%d%H%M%S")}_#{migration_name}.rb")
      end
    end
  end
end
