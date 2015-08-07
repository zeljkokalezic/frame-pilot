require 'base64'
require 'net/http'

class SlackPilotController < ApplicationController
  def embed
    #instance variables
    @token = params[:token]
    @text = params[:text]
    
    if @token == ''
      render text: ""
      return
    end
    
    if @text == ''
      render text: "Please enter URL"
      return
    end
    
    terminal_location = "<#{request.protocol}#{request.host_with_port}/slack_pilot/terminal?key=#{Base64.encode64(@text)}|FrameTerminal>".split.join("")
    render text: terminal_location
    
    uri = URI('https://hooks.slack.com/services/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')
    
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true

    request = Net::HTTP::Post.new(uri.path, {'Content-Type' =>'application/json'})
    request.body = '{"username": "Fra.me", "text": "New ' + terminal_location + ' for ' + @text + '"}'
    
    response = http.request(request)

    
  end

  def terminal
    key = params[:key]
    @file = Base64.decode64(key)
    @app_hash = ''
    
    if @file.end_with?(".jpg")
       @app_hash ="2p93wOGP"
    elsif @file.end_with?(".txt")
       @app_hash ="mjOYNAK1"
    end
    
  end
end
