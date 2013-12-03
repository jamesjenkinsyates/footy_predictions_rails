require_relative "../config/environment"
require_relative "../config/boot"
require 'clockwork'

include Clockwork

every(4.hours, 'Fixture Schedule'){`rake populater:schedule`}