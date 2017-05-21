require 'gtk3'

class RubyApp < Gtk::Window
  def initialize
    super
    set_title "GTK Ruby Demo"
    signal_connect "destroy" do
      Gtk.main_quit
    end
  end
end
