require 'concurrent-edge'

class Channel < Concurrent::Actor::RestartingContext
  def initialize()
    @subscribers = Set.new
  end

  def on_message(message)
    case message
      when Struct::Broadcast
        @subscribers.each do |subscriber|
          ActionCableActor.configuration.future_pool.future { subscriber.call(message.payload) }
        end
      when Struct::Subscribe
        @subscribers << message.message_callback
        if message.success_callback
          message.success_callback.call
        end
      when Struct::Unsubscribe
        @subscribers.delete(message.message_callback)
        @subscribers.empty?
      else
        # pass to ErrorsOnUnknownMessage behaviour, which will just fail
        pass
    end
  end
end

Struct.new("Broadcast", :payload)

Struct.new("Subscribe", :message_callback, :success_callback)

Struct.new("Unsubscribe", :message_callback)