require 'opal'
require 'jquery'
require 'opal-jquery'

Document.ready? do

  box = Element.find('#red_box')

  box.on(:mouseover) do
    width = get_window_width
    height = get_window_height
    top = positive_in_range(height)
    left =  positive_in_range(width)
    box.animate(top: "#{top}px", left: "#{left}px", speed: 500)
  end

end

def get_window_width
  Element['html'].width
end

def get_window_height
  Element['html'].height
end

def positive_in_range(upper_bound)
  num = nil
  while !num || num < 0
    num = rand(upper_bound) - 200
  end
  num
end
