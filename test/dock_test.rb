require './lib/dock'
require './lib/renter'
require './lib/boat'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'

class DockTest < Minitest::Test

  def test_it_has_attributes
    dock = Dock.new("The Rowing Dock", 3)

    assert_equal "The Rowing Dock", dock.name
    assert_equal 3, dock.max_rental_time
  end

  def test_rental_log
    dock = Dock.new("The Rowing Dock", 3)

    expected = {}
    assert_equal expected, dock.rental_log

    kayak_1 = Boat.new(:kayak, 20)
    kayak_2 = Boat.new(:kayak, 20)
    sup_1 = Boat.new(:standup_paddle_board, 15)
    patrick = Renter.new("Patrick Star", "4242424242424242")
    eugene = Renter.new("Eugene Crabs", "1313131313131313")
    dock.rent(kayak_1, patrick)
    dock.rent(kayak_2, patrick)
    dock.rent(sup_1, eugene)

    expected_2 = {kayak_1: patrick, kayak_2: patrick, sup_1: eugene}
    assert_equal expected_2, dock.rental_log
  end
end
