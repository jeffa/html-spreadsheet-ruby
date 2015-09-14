require "test/unit"
require "Spreadsheet/HTML.rb"

class Test_Run < Test::Unit::TestCase

  def test_run

    assert_equal(
        Spreadsheet::HTML.new.generate( Array[[1,2], [3,4]] ),
        '<table><tr><td>1</td><td>2</td></tr><tr><td>3</td><td>4</td></tr>/<table>'
    )

    assert_equal(
        Spreadsheet::HTML.new.generate( Array[['a','b'], ['c','d']] ),
        '<table><tr><td>a</td><td>b</td></tr><tr><td>c</td><td>d</td></tr>/<table>'
    )

  end

end
