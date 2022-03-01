module ApplicationHelper

  def locale
    I18n.locale == :en ? "United States" : "Portguês do Brasil"
  end  
  def data_br(data_us)
    data_us.strftime("%d/%m/%Y")
  end
  def nome_aplicacao
    "Crypto Wallet APP"
  end
end
