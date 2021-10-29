class PostImageUploader < CarrierWave::Uploader::Base
  # storage :file
  # storage :fog
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def size_range
    1.byte..2.megabytes
  end

  def extension_allowlist
    %w(jpg jpeg gif png)
  end
end
