require 'minitest/autorun'
require 'minitest/pride'
require './lib/book'
require './lib/author'

class AuthorTest < MiniTest::Test

  def setup
    @charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
  end

  def test_it_exists
    assert_instance_of Author, @charlotte_bronte
  end

  def test_author_has_a_name
    assert_equal "Charlotte Bronte", @charlotte_bronte.name
  end

  def test_author_has_authored_books
    assert_equal [], @charlotte_bronte.books
  end

  def  test_bronte_can_write
    jane_eyre = @charlotte_bronte.write("Jane Eyre", "October 16, 1847")
  end


end
