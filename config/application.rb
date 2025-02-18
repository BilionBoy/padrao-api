require_relative "boot"
require "rails/all"

Bundler.require(*Rails.groups)

module ApiTemplate
  class Application < Rails::Application
    config.load_defaults 7.2
    # Configuração dos geradores
    config.generators do |g|
      g.scaffold_controller "scaffold/api/controller"  # Aqui informamos o caminho do gerador
      g.model "scaffold/api/model"                     # Mapeando o gerador do model
      g.orm :active_record                             # ORM (ActiveRecord)
    end

    config.time_zone = "La Paz"                        # Configuração do Time Zone
    config.i18n.default_locale = :'pt-BR'              # Configuração do idioma padrão

    # Corrigir carregamento das pastas lib
    config.autoload_paths += Dir[Rails.root.join("lib", "**/")]  # Certificando que subpastas sejam carregadas
    config.eager_load_paths += Dir[Rails.root.join("lib", "**/")]
    config.api_only = true
  end
end
