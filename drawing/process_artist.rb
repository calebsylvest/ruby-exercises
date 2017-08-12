require 'ruby-processing'

class ProcessArtist < Processing::App

  def setup
    background(0, 0, 0)
  end

  def draw
    # do stuff here
  end
end

ProcessArtist.new(width: 800, height: 800, title: "ProcessArtist", full_screen: false)
