# coding: utf-8

class Message < ActionMailer::Base
  default from: "from@example.com"
  #URL_DEFAULT = "http://relicsapp.heroku.com"
  URL_DEFAULT = "http://localhost:3000"

  def bem_vindo(pessoa, user)
    @pessoa = pessoa
    @user = user
    @url = URL_DEFAULT
    mail(:to => @pessoa.email_particular, :subject => "Bem vindo ao Relics.")
  end
end
