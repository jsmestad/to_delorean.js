require 'active_support/concern'

module ToDelorean::Mongomatic
  extend ActiveSupport::Concern

  included do

  end

  module InstanceMethods
    def to_delorean(date_field, options={})
      { doc[date_field] => doc.except(date_field.to_sym) }
    end
  end
end
