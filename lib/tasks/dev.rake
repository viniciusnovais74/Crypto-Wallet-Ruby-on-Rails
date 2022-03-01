require 'tty-spinner'
namespace :dev do
  desc "Ambiente de Desenvolvimento"
  task setup: :environment do
    if Rails.env.development?
      show_spinner('Apagando DB...') {%x(rails db:drop)}
      show_spinner('Criando DB...') {%x(rails db:create)}
      show_spinner('Migrando DB...') {%x(rails db:migrate)}
      show_spinner('Importando dados DB...'){%x(rails db:seed)}
      %x(rails dev:add_mining_types)

      %x(rails dev:add_coins)
    else
      puts 'Não está em ambiente de desenvolvimento'
    end
  end
    


  desc "Cadastra as Moedas"
  task add_coins: :environment do
    show_spinner('Cadastrando Moedas')do
      coins = [{
          description: "Bitcoin",
          acronym: "BTC",
          url_image:"https://logosmarcas.net/wp-content/uploads/2020/08/Bitcoin-Logo.png",
          mining_type: MiningType.find_by(acronym: "PoW")
        },{
          description: "Ethereum",
          acronym: "ETH",
          url_image:"https://logosmarcas.net/wp-content/uploads/2020/08/Bitcoin-Logo.png",
          mining_type: MiningType.all.sample
        },{
          description: "DogeCoin",
          acronym: "DOGE",
          url_image:"https://logosmarcas.net/wp-content/uploads/2020/08/Bitcoin-Logo.png",
          mining_type: MiningType.all.sample
        },{
          description: "Shiba Inu",
          acronym: "SHIB",
          url_image:"https://logosmarcas.net/wp-content/uploads/2020/08/Bitcoin-Logo.png",
          mining_type: MiningType.all.sample
      }]

      coins.each do |coin|
        Coin.find_or_create_by!(coin)
      end
    end
  end

  desc "Cadastro dos tipos de Mineração"
  task add_mining_types: :environment do
    show_spinner("Cadastrando Types of miners") do
    mining_types = [
      {description:'Proof of Work', acronym:'PoW'},
      {description:'Proof of Stake', acronym:'PoS'},
      {description:'Proof of Capacity', acronym:'PoC'}
    ]

    mining_types.each do |mining_type|
      MiningType.find_or_create_by!(mining_type)
      end
    end
  end

  private
  
    def show_spinner(msg_start,msg_end='Concluido')
      spinner = TTY::Spinner.new("[:spinner] #{msg_start}")
      spinner.auto_spin
      yield
      spinner.success("(#{msg_end})")
    end
  end