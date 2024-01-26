require 'test_helper'

class BooksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @book = books(:one)
    upload_file = Rack::Test::UploadedFile.new(Rails.root.join("test/fixtures/files/yoakemae.jpg"))
    @book_images = [upload_file]
  end

  test "新規図書入力機能の呼び出しと更新" do
    get new_book_url
    assert_response :success
    assert_select 'h1', "New Book"
    assert_difference('Book.count') do
      post books_url, params: {book: {title: "夜明け前", description: "幕末から明治の変化を描く", images: @book_images }}
    end
    assert_response :redirect
  end

  test "該当図書の表示" do
    get book_url(@book)
    assert_response :success
  end
end
