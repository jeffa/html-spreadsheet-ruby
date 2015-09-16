require "test/unit"
require "Spreadsheet/HTML.rb"

class Test_Matrix < Test::Unit::TestCase

  def test_matrix

    data = Array[[1,'a'], [2,'b']]

    assert_equal(
        '<table><tr><td>1</td><td>a</td></tr><tr><td>2</td><td>b</td></tr>/<table>',
        Spreadsheet::HTML.new( 'data' => data ).generate( 'matrix' => 1 ),
        "via constructor"
    )

    assert_equal(
        '<table><tr><td>1</td><td>a</td></tr><tr><td>2</td><td>b</td></tr>/<table>',
        Spreadsheet::HTML.new.generate( [1,'a'], [2,'b'], 'matrix' => 1  ),
        "two array refs"
    )

    assert_equal(
        '<table><tr><td>1</td><td>a</td></tr><tr><td>2</td><td>b</td></tr>/<table>',
        Spreadsheet::HTML.new.generate( data, 'matrix' => 1  ),
        "one array ref"
    )

    assert_equal(
        '<table><tr><td>1</td><td>a</td></tr><tr><td>2</td><td>b</td></tr>/<table>',
        Spreadsheet::HTML.new.generate( 'data' => data, 'matrix' => 1  ),
        "one named arg"
    )

  end

end
