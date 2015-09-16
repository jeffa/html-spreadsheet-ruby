require "test/unit"
require "Spreadsheet/HTML.rb"

class Test_Matrix < Test::Unit::TestCase

  def test_matrix

    data = Array[[1,'a'], [2,'b'], [3,'c']]

    assert_equal(
        '<table><tr><th>1</th><td>2</td><td>3</td></tr><tr><th>a</th><td>b</td><td>c</td></tr></table>',
        Spreadsheet::HTML.new( 'data' => data, 'theta' => -270 ).generate(),
        "via constructor only"
    )

    assert_equal(
        '<table><tr><th>1</th><td>2</td><td>3</td></tr><tr><th>a</th><td>b</td><td>c</td></tr></table>',
        Spreadsheet::HTML.new( 'data' => data ).generate( 'theta' => -270 ),
        "via constructor and method"
    )

    assert_equal(
        '<table><tr><th>1</th><td>2</td><td>3</td></tr><tr><th>a</th><td>b</td><td>c</td></tr></table>',
        Spreadsheet::HTML.new.generate( [1,'a'], [2,'b'], [3,'c'], 'theta' => -270  ),
        "two array refs"
    )

    assert_equal(
        '<table><tr><th>1</th><td>2</td><td>3</td></tr><tr><th>a</th><td>b</td><td>c</td></tr></table>',
        Spreadsheet::HTML.new.generate( data, 'theta' => -270  ),
        "one array ref"
    )

    assert_equal(
        '<table><tr><th>1</th><td>2</td><td>3</td></tr><tr><th>a</th><td>b</td><td>c</td></tr></table>',
        Spreadsheet::HTML.new.generate( 'data' => data, 'theta' => -270  ),
        "one named arg"
    )

  end

end
