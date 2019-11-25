# Write a function that takes in a string representing a filename and returns a processed version of the text file.

def read_file (file_path)
  file = File.open(file_path)
  file.read.strip.gsub(/(^\s+$)/,  "" )       #  strips any white space before and after the text and remove empty lines but not paragraph breaks
end

def modify_input (book_text , hash_of_input)
  hash_of_input.each do |key, value|
    book_text.gsub!(key, value)
  end
  return book_text
end

def make_word_hash (book_test)
  words_hash = Hash.new(0)
  book_test.scan(/\b\w+\b/).each {|word| words_hash[word.downcase] += 1 }
  return words_hash
end

def global_word_counter (book_test)
  print make_word_hash(book_test).sort_by{|k, v| -v}
end

def find_word_count(book_test, word)
  make_word_hash(book_test)[word.downcase]
end



book = read_file("robinhood.text")

# puts read_file("robinhood.text")

modify_input(book, {"ROBIN" => "Levent",
  "HOOD" => "INCE"})

# print  global_word_counter (book)
#global_word_counter(book)
puts find_word_count(book, "levent")
puts find_word_count(book, "THE")
puts find_word_count(book, "Robin")
