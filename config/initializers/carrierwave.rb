CarrierWave.configure do |config|
  if Rails.env.test?
    config.enable_processing = false
  end

  config.ignore_integrity_errors = false

  def quality(percentage)
    manipulate! do |img|
      img.quality(percentage.to_s)
      img = yield(img) if block_given?
      img
    end
  end

end
