require "test/unit"
require "Spreadsheet/HTML"

class Test_Colgroup < Test::Unit::TestCase

  def test_colgroup

    data = Array[
        %w( a b c ),
        %w( 1 2 3 ),
        %w( 4 5 6 ),
    ]

    gen = Spreadsheet::HTML.new( 'data' => data, 'colgroup' => { 'span' => 3, 'width' => 100 }, 'attr_sort' => 1 );

    assert_equal(
        '<table><colgroup span="3" width="100" /><tr><th>a</th><th>b</th><th>c</th></tr><tr><td>1</td><td>2</td><td>3</td></tr><tr><td>4</td><td>5</td><td>6</td></tr></table>',
        gen.generate,
        "colgroup present from generate()"
    )

    assert_equal(
        '<table><colgroup span="3" width="100" /><thead><tr><th>a</th><th>b</th><th>c</th></tr></thead><tfoot><tr><td>4</td><td>5</td><td>6</td></tr></tfoot><tbody><tr><td>1</td><td>2</td><td>3</td></tr></tbody></table>',
        gen.generate( 'tgroups' => 2 ),
        "colgroup present from generate() with tgroups"
    )

    assert_equal(
        '<table><tr><th>a</th><th>b</th><th>c</th></tr><tr><td>1</td><td>2</td><td>3</td></tr><tr><td>4</td><td>5</td><td>6</td></tr></table>',
        gen.generate( 'colgroup' => nil ),
        "colgroup can be overriden"
    )

    assert_equal(
        '<table><tr><th>a</th><th>b</th><th>c</th></tr><tr><td>1</td><td>2</td><td>3</td></tr><tr><td>4</td><td>5</td><td>6</td></tr></table>',
        gen.generate( 'colgroup' => 1 ),
        "colgroup yields no-op if scalar"
    )

    assert_equal(
        '<table><colgroup color="red" span="1" /><colgroup color="blue" span="2" /><tr><th>a</th><th>b</th><th>c</th></tr><tr><td>1</td><td>2</td><td>3</td></tr><tr><td>4</td><td>5</td><td>6</td></tr></table>',
        gen.generate( 'colgroup' => [ { 'span' => 1, 'color' => 'red' }, { 'span' => 2, 'color' => 'blue' } ] ),
        "can specify multiple colgroups"
    )

  end

  def test_col

    data = Array[
        %w( a b c ),
        %w( 1 2 3 ),
        %w( 4 5 6 ),
    ]

    gen = Spreadsheet::HTML.new( 'data' => data, 'colgroup' => { 'span' => 3, 'width' => 100 }, 'attr_sort' => 1 );

    assert_equal(
        '<table><colgroup span="3" width="100"><col /></colgroup><tr><th>a</th><th>b</th><th>c</th></tr><tr><td>1</td><td>2</td><td>3</td></tr><tr><td>4</td><td>5</td><td>6</td></tr></table>',
        gen.generate( 'col' => {} ),
        "colgroup wraps col"
    )

    assert_equal(
        '<table><colgroup span="3" width="100"><col /><col /><col /></colgroup><tr><th>a</th><th>b</th><th>c</th></tr><tr><td>1</td><td>2</td><td>3</td></tr><tr><td>4</td><td>5</td><td>6</td></tr></table>',
        gen.generate( 'col' => [{},{},{}] ),
        "colgroup wraps multiple cols"
    )

    assert_equal(
        '<table><colgroup><col /></colgroup><tr><th>a</th><th>b</th><th>c</th></tr><tr><td>1</td><td>2</td><td>3</td></tr><tr><td>4</td><td>5</td><td>6</td></tr></table>',
        gen.generate( 'colgroup' => nil, 'col' => {} ),
        "colgroup can be overriden when col is present too"
    )


    gen = Spreadsheet::HTML.new( 'data' => data, 'col' => Array[{},{},{}] );

    assert_equal(
        '<table><colgroup><col /><col /><col /></colgroup><tr><th>a</th><th>b</th><th>c</th></tr><tr><td>1</td><td>2</td><td>3</td></tr><tr><td>4</td><td>5</td><td>6</td></tr></table>',
        gen.generate( 'colgroup' => {} ),
        "multiple cols against single colgroup"
    )

    assert_equal(
        '<table><colgroup /><colgroup /><colgroup /><tr><th>a</th><th>b</th><th>c</th></tr><tr><td>1</td><td>2</td><td>3</td></tr><tr><td>4</td><td>5</td><td>6</td></tr></table>',
        gen.generate( 'col' => nil, 'colgroup' => Array[{},{},{}] ),
        "no cols against multiple colgroups"
    )

    assert_equal(
        '<table><colgroup><col /><col /><col /></colgroup><colgroup><col /><col /><col /></colgroup><colgroup><col /><col /><col /></colgroup><tr><th>a</th><th>b</th><th>c</th></tr><tr><td>1</td><td>2</td><td>3</td></tr><tr><td>4</td><td>5</td><td>6</td></tr></table>',
        gen.generate( 'colgroup' => Array[{},{},{}] ),
        "multiple cols against multiple colgroups"
    )

  end

end
