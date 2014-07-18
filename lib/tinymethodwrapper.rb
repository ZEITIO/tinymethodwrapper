require "tinymethodwrapper/version"
require 'active_support'
require 'active_support/version'


module Tinymethodwrapper
  extend ActiveSupport::Concern
  included do
  end

  module ClassMethods
    def wrap_methods(method_arr, function)
      method_arr.each do |method_name|
        old_method = instance_method(method_name)
        define_method(method_name) do |*args, &block|
          function.call(method_name)
          old_method.bind(self).call(*args, &block)
        end
      end
    end
  end
end
