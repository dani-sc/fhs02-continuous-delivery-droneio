require 'json'

file = File.read('brakeman-comparison.json')
comparison = JSON.parse(file)

if comparison['new'].length > 0
    abort("There are new errors!")
else
    puts "No new errors :)"
end