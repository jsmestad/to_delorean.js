require 'active_support/concern'

module ToDelorean::ActiveRecord
  extend ActiveSupport::Concern

  included do

  end

  module InstanceMethods
    def to_delorean(date_field=:created_at, options={})
      { self.send(date_field.to_sym) => self.to_json(:except => [date_field.to_sym]) }
    end
  end
end
