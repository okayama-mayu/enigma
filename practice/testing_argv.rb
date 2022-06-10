# def process_argv(option)
#   case option
#   when "-h"
#     puts "This is the help menu."
#     puts "  -v Enable verbose mode"
#     puts "  -c Enable syntax highlighting"
#     exit
#   when "-v"
#     @options[:verbose] = true
#   when "-c"
#     @options[:syntax_highlighting] = true
#   end
# end
#
# @options = {}
#
# ARGV.each { |option| process_argv(option) }
#
# p @options

p ARGV
p ARGV[0]
