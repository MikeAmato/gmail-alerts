require 'google/api_client'
require 'httparty'
require 'json'
# app/controllers/sessions_controller.rb
class SessionsController < ApplicationController
  include HTTParty
  layout false

  def new
  end

  def create
    @auth = request.env['omniauth.auth']#['credentials']

    @token = @auth['credentials']['token']
    client = Google::APIClient.new
    client.authorization.access_token = @token
    service = client.discovered_api('calendar', 'v3')
    @result = client.execute(
      :api_method => service.events.list,
      :parameters => {'calendarId' => 'primary', 'q' => 'Free-time'},
      :headers => {'Content-Type' => 'application/json'})


    Token.create(
      access_token: @auth['token'],
      refresh_token: @auth['refresh_token'],
      #expires_at: Time.at(@auth['expires_at']).to_datetime
      )

   
<p><%= @response = HTTParty.get("http://api.eventful.com/json/events/search?&location=Atlanta&app_key=b8hsZDFcNgvxWm4j") %></p>
    @response = HTTParty.get "http://api.eventful.com/json/events/search?&location=Atlanta&app_key=b8hsZDFcNgvxWm4j"
  
  end

end