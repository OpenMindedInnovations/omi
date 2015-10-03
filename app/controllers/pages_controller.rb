class PagesController < ApplicationController
  include ActionController::Live

  layout 'landing'
  before_filter :authenticate_user!, only: :dashboard

  def home
  end

  def about 
  end

  def admin
    @projects = Project.all
  end

  def dashboard
    @message = Message.new
    @ideas = Idea.all.order(cached_votes_up: :desc)
    @projects = Project.all.order(created_at: :desc)
    render layout: 'application'
  end
  
  def chat 
    @message = Message.new(chat_params)
    @message.user = current_user
    @message.save
  end

  def event
    response.headers['Content-Type'] = 'text/event-stream'
    Message.on_change do |message|
      response.stream.write "data: #{message}\n\n"
    end
#    response.headers['Content-Type'] = 'text/event-stream'
#    sse = SSE.new(response.stream)
#    begin
#      Message.on_change do |data|
#        sse.write(data)
#      end 
#    response.headers['Content-Type'] = 'text/event-stream'
#    start = Time.zone.now
#    2.times do
#      Message.uncached do
#        Message.where('created_at > ?', start).each do |message|
#          response.stream.write "data: #{message.to_json}\n\n"
#          start = message.created_at
#        end
#      end
#      sleep 1
#    end
    rescue IOError
      logger.info "Stream closed"
    ensure
      response.stream.close
  end

  private

  def chat_params
    params.require(:message).permit(:name, :content)
  end
end
