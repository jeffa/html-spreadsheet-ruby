require "test/unit"
require "Spreadsheet/HTML.rb"

class Test_Headless < Test::Unit::TestCase

  def test_headless

    data = Array[[1,'a'], [2,'b'], [3,'c']]

    assert_equal(
        '<table><tr><td>2</td><td>b</td></tr><tr><td>3</td><td>c</td></tr>/<table>',
        Spreadsheet::HTML.new( 'data' => data, 'headless' => 1 ).generate( 'headless' => 1 ),
        "via constructor only"
    )

    assert_equal(
        '<table><tr><td>2</td><td>b</td></tr><tr><td>3</td><td>c</td></tr>/<table>',
        Spreadsheet::HTML.new( 'data' => data ).generate( 'headless' => 1 ),
        "via constructor and method"
    )

    assert_equal(
        '<table><tr><td>2</td><td>b</td></tr><tr><td>3</td><td>c</td></tr>/<table>',
        Spreadsheet::HTML.new.generate( [1,'a'], [2,'b'], [3,'c'], 'headless' => 1  ),
        "two array refs"
    )

    assert_equal(
        '<table><tr><td>2</td><td>b</td></tr><tr><td>3</td><td>c</td></tr>/<table>',
        Spreadsheet::HTML.new.generate( data, 'headless' => 1  ),
        "one array ref"
    )

    assert_equal(
        '<table><tr><td>2</td><td>b</td></tr><tr><td>3</td><td>c</td></tr>/<table>',
        Spreadsheet::HTML.new.generate( 'data' => data, 'headless' => 1  ),
        "one named arg"
    )

  end

end
