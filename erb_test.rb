require "erubis"

template = <<TEMPLATE
Hello! This is a template.
It had <%= whatever %>.
TEMPLATE

eruby = Erubis::Eruby.new(template)
puts eruby.src
puts "========"
puts eruby.result(whatever: 'five hands')
