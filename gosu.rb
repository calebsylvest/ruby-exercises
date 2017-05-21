require 'rubygems'
require 'gosu'

class DemoWindow < Gosu::Window

  def initialize
    super(640, 400, false)
    self.caption = "Gosu Demo Window"
  end

  def draw
    x = 300
    y = 200
    size = 120
    # draw_line(x - size, y - size, 0xff00ffff, x + size, y + size, 0xff00ffff)
    # draw_triangle(x - size, y - size, 0xff00ffff, x + size, y - size, 0xff00ffff, x - size, y + size, 0xff00ffff)
    draw_quad(x - size, y - size, 0xff00ffff, x + size, y - size, 0xff00ffff, x - size, y + size, 0xff00ffff, x + size, y + size, 0xff00ffff)
  end

end

DemoWindow.new.show
