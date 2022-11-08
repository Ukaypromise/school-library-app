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
end