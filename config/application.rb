require_relative "boot"
require "rails/all"

Bundler.require(*Rails.groups)

module ApiTemplate
  class Application < Rails::Application
    # Versão Rails
    config.load_defaults 7.2

    # Configuração dos geradores
    config.generators do |g|
      g.scaffold_controller "scaffold/api/controller"  # Define o gerador para controllers de scaffold
      g.model "scaffold/api/model"                     # Define o gerador para models
      g.migration "scaffold/api/migration"             # Define o gerador para migrations
      g.orm :active_record                             # Define ActiveRecord como ORM padrão
    end

    # Configurações de Idioma e Horário
    config.time_zone = "La Paz"
    config.i18n.default_locale = :'pt-BR'

    # Corrigir carregamento das pastas lib
    config.autoload_paths += Dir[Rails.root.join("lib", "**/")]
    config.eager_load_paths += Dir[Rails.root.join("lib", "**/")]
    config.api_only = true
  end
end
