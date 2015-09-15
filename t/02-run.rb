require "test/unit"
require "Spreadsheet/HTML.rb"

class Test_Run < Test::Unit::TestCase

  def test_run

    data = Array[[1,'a'], [2,'b']]

    assert_equal(
        '<table><tr><td>1</td><td>a</td></tr><tr><td>2</td><td>b</td></tr>/<table>',
        Spreadsheet::HTML.new.generate( [1,'a'], [2,'b'] )
    )

    assert_equal(
        '<table><tr><td>1</td><td>a</td></tr><tr><td>2</td><td>b</td></tr>/<table>',
        Spreadsheet::HTML.new.generate( data )
    )

    assert_equal(
        '<table><tr><td>1</td><td>a</td></tr><tr><td>2</td><td>b</td></tr>/<table>',
        Spreadsheet::HTML.new.generate( 'data' => data )
    )

    assert_equal(
        '<table><tr><td>1</td><td>a</td></tr><tr><td>2</td><td>b</td></tr>/<table>',
        Spreadsheet::HTML.new( 'data' => data ).generate()
    )

  end

end
