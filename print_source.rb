def get_file_as_string(filename)
  data = ''
  f = File.open(filename, "r")
  f.each_line do |line|
    data += line
  end
  return data
end

##### MAIN #####

source_code = get_file_as_string 'interactive_menu.rb'

# print out the string
puts source_code
