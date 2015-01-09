require 'commandc/version'
require 'uri'

# @since since 0.0.1
module Commandc
  # @since since 0.0.1
  class Commandc
    attr_accessor :text, :device, :open

    def initialize(text, device, open)
      @text = text
      @device = escape_device_name(device)
      @open = open
    end

    def copy
      if open
        `command-c://x-callback-url/copyText?text=#{text}&deviceName=#{device}`
      else
        `command-c://x-callback-url/copyAndOpenURL?url=\
        #{text}&deviceName=#{device}`
      end

      def escape_device_name(device_name)
        URI.escape(device_name)
      end
    end
  end
end
