class WelcomeController < ApplicationController
  def index
    cookies[:curso] ='Curso de Ruby on Rails'
    session[:user_name] = 'MarkDown'
    @nome = params[:nome]
  end
end
