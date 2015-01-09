require 'thor'
require 'commandc/commandc'

# @author "Brandon Pittman"
module Commandc
  # @author "Brandon Pittman"
  # Inherits from Thor in order to create CLI
  class Cli < Thor
    desc 'copy --text TEXT --to DEVICE [--open]',
         'copy TEXT to DEVICE'
    # @param text [String] the text to copy
    # @option device [String] the device to copy the text to
    # @example commandc copy
    #   commandc copy --text "This is some text" --to iPhone --open
    #   commandc copy --to iPhone --open
    option :to,
           type: :string,
           required: true,
           banner: 'Device to copy text to'
    option :text,
           type: :string,
           default: `pbpaste`,
           required: false,
           banner: 'Text to copy (defaults to system clipboard)'
    option :open,
           type: :boolean,
           required: false,
           default: false,
           banner: 'Open copied URL on destination device (if a Mac)'
    def copy
      output = Commandc::Commandc.new
      output.copy(options[:text], options[:to], options[:open])
    end
  end
end
