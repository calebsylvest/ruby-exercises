require 'spreadsheet'

book = Spreadsheet::Workbook.new
sheet1 = book.create_worksheet

sheet1.row(0).concat %w{Name Age Post}
sheet1.row(1).push 'charles', '26', 'Designer'
sheet1.row(2).push 'Abbey', '31', 'Developer'
sheet1.row(3).push 'many', '41', 'CEO'

book.write 'data/test.xls'
puts 'The spreadsheet was created'
