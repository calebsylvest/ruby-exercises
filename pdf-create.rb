require 'prawn'

Prawn::Document.generate('data/test.pdf') do
  text 'This is the Prawn demo.'
  text 'End of the file.'
  puts 'The file was created'
end
