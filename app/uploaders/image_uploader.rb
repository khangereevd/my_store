class ImageUploader < CarrierWave::Uploader::Base
  after :remove, :destroy_model

  # Choose what kind of storage to use for this uploader:
  storage :file

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  private

  def destroy_model
    model.destroy if model.file.blank?
  end
end
