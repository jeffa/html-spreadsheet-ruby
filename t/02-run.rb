require "test/unit"
require "Spreadsheet/HTML.rb"

class Test_Run < Test::Unit::TestCase

  def test_run
    assert_equal( Spreadsheet::HTML.new.generate( 2 ), 2 )
  end

end
