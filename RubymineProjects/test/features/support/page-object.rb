require 'page-object/page_factory'
require 'page-object'


class ApplicationPage
  include PageObject
  page_url("http://kontur.ru/Files/userfiles/file/edu/Stagirovka%202012/test/default.html")
  button(:make_order, :id =>'makeOrder')
  div(:empty_order, :id=>'validation')
  select_list(:days, :id=>'days')
  cell(:history, :id=>'history')
  cell(:no,:id=>'validation')
  cell(:menu, :id=>'menu')
  button(:default_page, :xpath=>'/html/body/div/a')
  cell(:sum,:id=>'orderSum')

end