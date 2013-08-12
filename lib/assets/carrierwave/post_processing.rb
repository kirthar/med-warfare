module Carrierwave
  module PostProcessing
    extend ActiveSupport::Concern

    included do
      before_save do
        self.class.uploaders.each do |uploader, _|
          __post_processing[uploader] = send(:"#{uploader}_changed?")
        end
      end

      after_commit do
        __post_processing.clear
      end
    end

    private

    def __post_processing
      @__post_processing ||= {}
    end

    module ClassMethods
      def post_process(method, opts = {})
        only = Array.wrap(opts.delete(:only)).compact
        after_commit(method, if: -> { only.any? ? only.all? { |uploader| __post_processing[uploader] } : __post_processing.any?(&:last) })
      end
    end
  end
end