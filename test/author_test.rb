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

  def  test_jane_class
    jane_eyre = @charlotte_bronte.write("Jane Eyre", "October 16, 1847")
    assert_equal Book, jane_eyre.class
  end

  def test_title
    skip
    jane_eyre = @charlotte_bronte.write("Jane Eyre", "October 16, 1847")
    assert_equal "Jane Eyre", jane_eyre.title
  end

  def test_bronte_can_write
    @charlotte_bronte.write("Villette", "1853")
    assert_equal ["string"], @charlotte_bronte.books
  end


end
