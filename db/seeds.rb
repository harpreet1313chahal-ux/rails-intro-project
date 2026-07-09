require "csv"

puts "Cleaning database..."

Book.destroy_all
Author.destroy_all
Publisher.destroy_all
Category.destroy_all

puts "Importing books..."

csv_file = Rails.root.join("db", "data", "books.csv")

CSV.foreach(csv_file, headers: true) do |row|

  author_name = row["Authors"].to_s.strip
  author_name = "Unknown Author" if author_name.blank?

  author = Author.find_or_create_by!(
    name: author_name
  )

  publisher_name = row["Publisher"].to_s.strip
  publisher_name = "Unknown Publisher" if publisher_name.blank?

  publisher = Publisher.find_or_create_by!(
    name: publisher_name
  )

  author_name = row["Authors"].to_s.downcase

  category_name =
    case author_name
    when /rowling/
      "Fantasy"
    when /tolkien/
      "Fantasy"
    when /douglas adams/
      "Science Fiction"
    when /bill bryson/
      "Travel"
    when /stephen king/
      "Horror"
    when /dan brown/
      "Thriller"
    when /agatha christie/
      "Mystery"
    when /dr\.? seuss/
      "Children"
    else
      "General"
    end

  category = Category.find_or_create_by!(
    name: category_name
  )

  book_title = row["Name"].to_s.strip
  next if book_title.blank?

  Book.create!(
    title: book_title,
    isbn: row["ISBN"].to_s,
    language: row["Language"],
    pages: row["pagesNumber"].to_i,
    rating: row["Rating"].to_f,
    author: author,
    publisher: publisher,
    category: category
  )
end

puts "Done!"
puts "Books: #{Book.count}"
puts "Authors: #{Author.count}"
puts "Publishers: #{Publisher.count}"
puts "Categories: #{Category.count}"