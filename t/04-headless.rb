require "test/unit"
require "HTML/Spreadsheet"

class Test_Headless < Test::Unit::TestCase

  def test_instance

    data = Array[[1,'a'], [2,'b'], [3,'c']]
    html = '<table><tr><td>2</td><td>b</td></tr><tr><td>3</td><td>c</td></tr></table>'

    assert_equal(
        html,
        HTML::Spreadsheet.new( 'data' => data, 'headless' => 1 ).generate( 'headless' => 1 ),
        "via constructor only"
    )

    assert_equal(
        html,
        HTML::Spreadsheet.new( 'data' => data ).generate( 'headless' => 1 ),
        "via constructor and method"
    )

    gen = HTML::Spreadsheet.new

    assert_equal(
        html,
        gen.generate( [1,'a'], [2,'b'], [3,'c'], 'headless' => 1  ),
        "two array refs"
    )

    assert_equal(
        html,
        gen.generate( data, 'headless' => 1  ),
        "one array ref"
    )

    assert_equal(
        html,
        gen.generate( 'data' => data, 'headless' => 1  ),
        "one named arg"
    )

  end

  def test_class

    data = Array[[1,'a'], [2,'b'], [3,'c']]
    html = '<table><tr><td>2</td><td>b</td></tr><tr><td>3</td><td>c</td></tr></table>'

    assert_equal(
        html,
        HTML::Spreadsheet.gen( [1,'a'], [2,'b'], [3,'c'], 'headless' => 1  ),
        "two array refs"
    )

    assert_equal(
        html,
        HTML::Spreadsheet.gen( data, 'headless' => 1  ),
        "one array ref"
    )

    assert_equal(
        html,
        HTML::Spreadsheet.gen( 'data' => data, 'headless' => 1  ),
        "one named arg"
    )

  end

end
