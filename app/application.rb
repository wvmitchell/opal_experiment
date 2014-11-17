require 'opal'
require 'jquery'
require 'opal-jquery'

Document.ready? do

  box = Element.find('#red_box')

  box.on(:click) do
    adjust_size(box)
    adjust_position(box)
    adjust_color(box)
  end

  Element['#test_params'].on(:click) do
    HTTP.get('/test_params', data: {name: 'Will'}) do |response|
      alert JSON.parse(response.body)['alert']
    end
  end

end

def adjust_size(element)
  width = rand(20..200)
  height = rand(20..200)
  element.animate(width: width, height: height, speed: 500)
end

def adjust_color(element)
  HTTP.get('/colors.json') do |response|
    colors = JSON.parse(response.body)['colors']
    color = colors[rand(colors.count - 1)]
    element.css('background-color', color)
  end
end

def adjust_position(element)
  #width = get_window_width
  #height = get_window_height
  #element.animate(top: "#{top}px", left: "#{left}px", speed: 500)
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
