require "test/unit"
require "Spreadsheet/HTML"

class Test_Run < Test::Unit::TestCase

  def test_instance

    data = Array[[1,'a'], [2,'b']]
    html = '<table><tr><th>1</th><th>a</th></tr><tr><td>2</td><td>b</td></tr></table>'

    assert_equal(
        html,
        Spreadsheet::HTML.new( 'data' => data ).generate(),
        "via constructor"
    )

    gen = Spreadsheet::HTML.new

    assert_equal(
        html,
        gen.generate( [1,'a'], [2,'b'] ),
        "two array refs"
    )

    assert_equal(
        html,
        gen.generate( data ),
        "one array ref"
    )

    assert_equal(
        html,
        gen.generate( 'data' => data ),
        "one named arg"
    )

  end

  def test_class

    data = Array[[1,'a'], [2,'b']]
    html = '<table><tr><th>1</th><th>a</th></tr><tr><td>2</td><td>b</td></tr></table>'

    assert_equal(
        html,
        Spreadsheet::HTML.gen( [1,'a'], [2,'b'] ),
        "two array refs"
    )

    assert_equal(
        html,
        Spreadsheet::HTML.gen( data ),
        "one array ref"
    )

    assert_equal(
        html,
        Spreadsheet::HTML.gen( 'data' => data ),
        "one named arg"
    )

  end

end
