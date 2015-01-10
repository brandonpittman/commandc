require 'uri'

# @since since 0.0.1
module Commandc
  # @since since 0.0.1
  class Text
    attr_accessor :text, :device, :open

    def initialize(text, device, open)
      @text = escape(text)
      @device = escape(device)
      @open = open
    end

    def copy
      if open
        `open "command-c://x-callback-url/copyAndOpenURL?url=#{text}&deviceName=#{device}"`
      else
        `open "command-c://x-callback-url/copyText?text=#{text}&deviceName=#{device}"`
      end
    end

    def escape(text_to_escape)
      URI.escape(text_to_escape)
    end
  end
end
