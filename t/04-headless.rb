require "test/unit"
require "Spreadsheet/HTML"

class Test_Headless < Test::Unit::TestCase

  def test_instance

    data = Array[[1,'a'], [2,'b'], [3,'c']]
    html = '<table><tr><td>2</td><td>b</td></tr><tr><td>3</td><td>c</td></tr></table>'

    assert_equal(
        html,
        Spreadsheet::HTML.new( 'data' => data, 'headless' => 1 ).generate( 'headless' => 1 ),
        "via constructor only"
    )

    assert_equal(
        html,
        Spreadsheet::HTML.new( 'data' => data ).generate( 'headless' => 1 ),
        "via constructor and method"
    )

    gen = Spreadsheet::HTML.new

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

    assert_equal(
        '<table><tr><th>1</th><th>a</th></tr><tr><td>2</td><td>b</td></tr><tr><td>3</td><td>c</td></tr></table>',
        gen.generate( 'data' => data ),
        "headless does not change orig data"
    )

  end

  def test_class

    data = Array[[1,'a'], [2,'b'], [3,'c']]
    html = '<table><tr><td>2</td><td>b</td></tr><tr><td>3</td><td>c</td></tr></table>'

    assert_equal(
        html,
        Spreadsheet::HTML.gen( [1,'a'], [2,'b'], [3,'c'], 'headless' => 1  ),
        "two array refs"
    )

    assert_equal(
        html,
        Spreadsheet::HTML.gen( data, 'headless' => 1  ),
        "one array ref"
    )

    assert_equal(
        html,
        Spreadsheet::HTML.gen( 'data' => data, 'headless' => 1  ),
        "one named arg"
    )

  end

end
