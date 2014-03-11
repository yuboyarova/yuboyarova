require 'page-object/page_factory'


class ApplicationPage
  include PageObject

  page_url('http://kontur.ru/Files/userfiles/file/edu/Stagirovka%202012/test/default.html')
  button(:make_order, :id =>'makeOrder')
  div(:empty_order, :id=>'validation')


end