require 'line/bot'

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  protect_from_forgery with: :null_session

  before_action :validate_signature

  def validate_signature
    body = request.body.read
    signature = request.env['HTTP_X_LINE_SIGNATURE']
    unless client.validate_signature(body, signature)
      error 400 do 'Bad Request' end
    end
  end

  def client
    @client ||= Line::Bot::Client.new { |config|
      config.channel_secret = ENV["82ab12f228da23afb2719d0a4e998fbb"]
      config.channel_token = ENV["4fbtmh2oOBAMUkTbT0uaQ9b3WyqIrnWh8LvG0LWIe/g/rpSDf7wopYB7Qmkxlsjt+kMeKaOckVgFYiBD1WrCUlOpmEM5TphOYGx1fArlfH3O8cfIohUCP06viq2jGuzxptVJrzlni57xOR02092XHwdB04t89/1O/w1cDnyilFU="]
      # ローカルで動かすだけならベタ打ちでもOK
      # config.channel_secret = "your channel secret"
      # config.channel_token = "your channel token"
    }
  end
end