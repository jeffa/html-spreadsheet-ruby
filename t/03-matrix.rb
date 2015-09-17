require "test/unit"
require "Spreadsheet/HTML.rb"

class Test_Matrix < Test::Unit::TestCase

  def test_instance

    data = Array[[1,'a'], [2,'b']]
    html = '<table><tr><td>1</td><td>a</td></tr><tr><td>2</td><td>b</td></tr></table>'

    assert_equal(
        html,
        Spreadsheet::HTML.new( 'data' => data, 'matrix' => 1 ).generate(),
        "via constructor only"
    )

    assert_equal(
        html,
        Spreadsheet::HTML.new( 'data' => data ).generate( 'matrix' => 1 ),
        "via constructor and method"
    )

    gen = Spreadsheet::HTML.new

    assert_equal(
        html,
        gen.generate( [1,'a'], [2,'b'], 'matrix' => 1  ),
        "two array refs"
    )

    assert_equal(
        html,
        gen.generate( data, 'matrix' => 1  ),
        "one array ref"
    )

    assert_equal(
        html,
        gen.generate( 'data' => data, 'matrix' => 1  ),
        "one named arg"
    )

  end

  def test_class

    data = Array[[1,'a'], [2,'b']]
    html = '<table><tr><td>1</td><td>a</td></tr><tr><td>2</td><td>b</td></tr></table>'

    assert_equal(
        html,
        Spreadsheet::HTML.gen( [1,'a'], [2,'b'], 'matrix' => 1  ),
        "two array refs"
    )

    assert_equal(
        html,
        Spreadsheet::HTML.gen( data, 'matrix' => 1  ),
        "one array ref"
    )

    assert_equal(
        html,
        Spreadsheet::HTML.gen( 'data' => data, 'matrix' => 1  ),
        "one named arg"
    )

  end

end
