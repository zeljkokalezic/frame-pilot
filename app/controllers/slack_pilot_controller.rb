require 'base64'

class SlackPilotController < ApplicationController
  def embed
    #instance variables
    @token = params[:token]
    @text = params[:text]
    
    if @token == ''
      render text: ""
    end
    
    if @text == ''
      render text: "Please enter URL"
    end
    
    render text: "<#{request.protocol}#{request.host_with_port}/slack_pilot/terminal?key=#{Base64.encode64(@text)}|Frame terminal>"
    
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
