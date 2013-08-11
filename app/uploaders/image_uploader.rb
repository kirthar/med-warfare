class ImageUploader < BaseUploader

  process :quality => 100

  version :mini do
    process :set_width => 60
  end

  version :standard do
    process :set_width => 300
  end

  version :large do
    process :set_width => 600
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end

  def filename
    "something.jpg" if original_filename
  end


  # Custom methods
  def set_width(width)
    manipulate! do |img|
      scale = width.to_f / img['width'].to_f
      new_height = img['height'].to_f * scale
      img.resize("#{width}x#{new_height}")
      img
    end
  end

  def set_height(height)
    manipulate! do |img|
      scale = height.to_f / img['height'].to_f
      new_width = img['width'].to_f * scale
      img.resize("#{new_width}x#{height}")
      img
    end
  end
end