require 'tty-spinner'
namespace :dev do
  desc "TODO"
  task setup: :environment do
    if Rails.env.development?
      show_spinner('Apagando DB...', 'DB Apagado com Sucesso!') {%x(rails db:drop)}
      show_spinner('Criando DB...', 'DB Criado com Sucesso!') {%x(rails db:create)}
      show_spinner('Migrando DB...', 'DB Migrado com Sucesso!') {%x(rails db:migrate)}
      show_spinner('Importando dados DB...', 'Importado com Sucesso!'){%x(rails db:seed)}
    else
      puts 'Não está em ambiente de desenvolvimento'
    end
  end
    
  private
  
    def show_spinner(msg_start,msg_end)
      spinner = TTY::Spinner.new("[:spinner] #{msg_start}")
      spinner.auto_spin
      yield
      spinner.success("(#{msg_end})")
    end
  end