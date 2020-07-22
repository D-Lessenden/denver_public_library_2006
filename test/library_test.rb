require 'minitest/autorun'
require 'minitest/pride'
require './lib/book'
require './lib/author'
require './lib/library'
require 'pry'

class LibraryTest < MiniTest::Test
  def setup
    @dpl = Library.new("Denver Public Library")
  end

  def test_it_exists
    assert_instance_of Library, @dpl
  end

  def test_it_has_books
    assert_equal [], @dpl.books
  end

  def test_it_has_authors
    assert_equal [], @dpl.authors
  end

  def test_has_authors_and_books
    charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
    charlotte_bronte.write("Jane Eyre", "October 16, 1847")
    professor = charlotte_bronte.write("The Professor", "1857")
    villette = charlotte_bronte.write("Villette", "1853")

    harper_lee = Author.new({first_name: "Harper", last_name: "Lee"})
    mockingbird = harper_lee.write("To Kill a Mockingbird", "July 11, 1960")

    @dpl.add_author(charlotte_bronte)
    @dpl.add_author(harper_lee)
    assert_equal [charlotte_bronte, harper_lee], @dpl.authors
    #assert_equal [charlotte_bronte.books, harper_lee.books], @dpl.books
  end

  def test_pub_time_fram
    charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
    charlotte_bronte.write("Jane Eyre", "October 16, 1847")
    professor = charlotte_bronte.write("The Professor", "1857")
    villette = charlotte_bronte.write("Villette", "1853")

    harper_lee = Author.new({first_name: "Harper", last_name: "Lee"})
    mockingbird = harper_lee.write("To Kill a Mockingbird", "July 11, 1960")

    @dpl.add_author(charlotte_bronte)
    @dpl.add_author(harper_lee)
    result = {:start=>"1847", :end=>"1857"}
    assert_equal result, @dpl.publication_time_frame_for(charlotte_bronte)
  end

end
