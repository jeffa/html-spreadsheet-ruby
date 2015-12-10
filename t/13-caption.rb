require "test/unit"
require "Spreadsheet/HTML"

class Test_Caption < Test::Unit::TestCase

  def test_caption

    data = Array[
        %w( a b c ),
        %w( 1 2 3 ),
        %w( 4 5 6 ),
    ]

    gen = Spreadsheet::HTML.new( 'data' => data, 'caption' => "My Table" )

    assert_equal(
        '<table><caption>My Table</caption><tr><th>a</th><th>b</th><th>c</th></tr><tr><td>1</td><td>2</td><td>3</td></tr><tr><td>4</td><td>5</td><td>6</td></tr></table>',
        gen.generate(),
        "caption present from generate()"
    )

    gen = Spreadsheet::HTML.new( 'data' => data, 'caption' => { "My Table" => { 'key' => 'value' } } )

    assert_equal(
        '<table><caption key="value">My Table</caption><tr><th>a</th><th>b</th><th>c</th></tr><tr><td>1</td><td>2</td><td>3</td></tr><tr><td>4</td><td>5</td><td>6</td></tr></table>',
        gen.generate(),
        "caption present from generate()"
    )

    assert_equal(
        '<table><caption key="value">My Table</caption><thead><tr><th>a</th><th>b</th><th>c</th></tr></thead><tfoot><tr><td>4</td><td>5</td><td>6</td></tr></tfoot><tbody><tr><td>1</td><td>2</td><td>3</td></tr></tbody></table>',
        gen.generate( 'tgroups' => 2 ),
        "caption present from generate() with tgroups"
    )

    assert_equal(
        '<table><caption>0</caption><tr><th>a</th><th>b</th><th>c</th></tr><tr><td>1</td><td>2</td><td>3</td></tr><tr><td>4</td><td>5</td><td>6</td></tr></table>',
        gen.generate( 'caption' => 0 ),
        "caption can be overriden"
    )

  end

end
