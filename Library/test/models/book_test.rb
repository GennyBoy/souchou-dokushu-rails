require 'test_helper'

class BookTest < ActiveSupport::TestCase
  setup do
    upload_file = Rack::Test::UploadedFile.new(
      Rails.root.join("test/fixtures/files/fushigi.jpg"))
    @book_images = [upload_file]
  end

  test "Bookモデル登録検証" do
    assert_difference "Book.count", 1 do
      Book.create!(title: "Rails不思議な世界", description: "Railsの不思議な世界を体験", images: @book_images)
    end
  end

  test "Bookモデルバリデーション検証" do
    book = Book.create(title: "", description: "Railsの不思議な世界を体験", images: @book_images)
    assert_empty book.title
    assert_not_empty book.description
    assert_equal "は入力しないでください", book.errors.messages[:description][0]
    assert_equal 2, book.errors.count
  end
end
