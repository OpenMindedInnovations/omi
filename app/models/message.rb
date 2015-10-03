class Message < ActiveRecord::Base
  belongs_to :user

  after_create :notify_message_added

  class << self
    def on_change
      Message.connection.execute "LISTEN messages"
      loop do
        Message.connection.raw_connection.wait_for_notify do |event, pid, message|
          yield message
        end
      end
    ensure
      Message.connection.execute "UNLISTEN messages"
    end
  end

  private

  def notify_message_added
   # This method is triggered after a message is created. The result here will be passed to the "wait_for_notify" block as the message
    message = { full_name: self.user.full_name, body: self }
    Message.connection.execute "NOTIFY messages, '#{message.to_json}'"
  end
end
