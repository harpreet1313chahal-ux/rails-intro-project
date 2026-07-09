book_title = row["Name"].to_s.strip
next if book_title.blank?

count += 1
puts "Imported #{count} books..." if count % 1000 == 0

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