require "test/unit"
require "Spreadsheet/HTML.rb"

class Test_Run < Test::Unit::TestCase

  def test_run
    assert_equal(
        Spreadsheet::HTML.new.generate( Array[['a','b'], ['c','d']] ),
        '<table><tr><td>a</td><td>b</td></tr><tr><td>c</td><td>d</td></tr>/<table>',
    )
  end

end
