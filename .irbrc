IRB.conf[:AUTO_INDENT] = true
IRB.conf[:USE_READLINE] = true
IRB.conf[:LOAD_MODULES] = []  unless IRB.conf.key?(:LOAD_MODULES)
unless IRB.conf[:LOAD_MODULES].include?('irb/completion')
  IRB.conf[:LOAD_MODULES] << 'irb/completion'
end

require 'irb/completion'
require 'irb/ext/save-history'
IRB.conf[:PROMPT_MODE] = :SIMPLE
IRB.conf[:SAVE_HISTORY] = 100

# pretty print
require 'pp'

require 'rubygems'
require 'wirble'
# load wirble
Wirble.init
# enable color
Wirble.colorize

require 'hirb'
Hirb::View.enable
