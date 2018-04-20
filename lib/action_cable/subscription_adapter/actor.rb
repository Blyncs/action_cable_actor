require 'action_cable/subscription_adapter/base'
require 'concurrent'
require 'set'
require_relative './channel'

class ActionCable::SubscriptionAdapter::Actor < ActionCable::SubscriptionAdapter::Base

  def initialize(*)
    super
    @actor_map =  Concurrent::Map.new
  end

  def broadcast(channel, payload)
    @actor_map[channel]&.tell(Struct::Broadcast.new(payload))
  end

  def subscribe(channel, message_callback, success_callback = nil)
    @actor_map.compute_if_absent(channel) {
      Channel.spawn(name: channel)
    }.tell(Struct::Subscribe.new(message_callback, success_callback))
  end

  def unsubscribe(channel, message_callback)
    @actor_map[channel]&.tell(Struct::Unsubscribe.new(message_callback))
  end

  def shutdown
    @actor_map.each_value { |actor| actor.tell(:terminate!)}
    @actor_map = nil
  end
end