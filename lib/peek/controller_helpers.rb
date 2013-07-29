module Peek
  module ControllerHelpers
    extend ActiveSupport::Concern

    included do
      prepend_before_filter :set_peek_request_id, :if => :peek_enabled?
      helper_method :peek_enabled?
    end

    protected

    def set_peek_request_id
      Peek.request_id = request.uuid
    end

    def peek_enabled?
      Peek.enabled?
    end

    def append_info_to_payload(payload)
      payload[:peek_enabled] = peek_enabled?
      super
    end
  end
end
