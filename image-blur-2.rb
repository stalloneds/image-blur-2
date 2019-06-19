class Image

  def initialize (image)
    @image = image
  end

  def find_ones
    cords = []
    @image.each_with_index do |row, row_num|
      row.each_with_index do |cell, cell_num|
        if cell == 1
          cords << [row_num, cell_num]
        end
      end
    end
    return cords
  end

  def transform_image
    cords_for_ones = find_ones
      @image.each_with_index do |row, row_num|
        row.each_with_index do |cell, cell_num|
          cords_for_ones.each do |row_match, cell_match|
            if row_num == row_match && cell_num == cell_match
              @image[row_num -1][cell_num] = 1 unless row_num == 0
              @image[row_num][cell_num +1] = 1 unless cell_num >= 3
              @image[row_num +1][cell_num] = 1 unless row_num >= 3 
              @image[row_num][cell_num -1] = 1 unless cell_num == 0 
            end
          end
        end
      end
  end

  def output_image
    @image = transform_image
    @image.each do |row|
      puts row.join
    end
  end
end

image = Image.new([
[0, 0, 0, 0],
[0, 1, 0, 0],
[0, 0, 0, 1],
[0, 0, 0, 0]
])

image.output_image