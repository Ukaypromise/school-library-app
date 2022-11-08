require 'json'

module HandleFile
    # WRITE TO FILE
  def write_json(array, file_path)
    opts = {
      array_nl: "\n",
      object_nl: "\n",
      indent: '  ',
      space_before: ' ',
      space: ' '
    }
    File.write(file_path, JSON.generate(array, opts))
  end
  # Read from file and checks if file exists
  def read_json(file_path)
    return unless File.exist?(file_path)

    file = File.read(file_path)
    JSON.parse(file)
  end

  # Store Books in Json file
  def store_books
    array = []
    @books.each do |book|
      array.push({
        title: book.title,
        author: book.author})
    end
    write_json(array, 'JSONdata/books.json')
end