require 'active_support/json'

class Hash

  def to_delorean(options=nil)
    subset = if options
      if attrs = options[:only]
        slice(*Array.wrap(attrs))
      elsif attrs = options[:except]
        except(*Array.wrap(attrs))
      else
        self
      end
    else
      self
    end

    # use encoder as a proxy to call as_json on all values in the subset, to protect from circular references
    encoder = options && options[:encoder] || ActiveSupport::JSON::Encoding::Encoder.new(options)
    result = self.is_a?(ActiveSupport::OrderedHash) ? ActiveSupport::OrderedHash : Hash
    result[subset.map { |k, v| [(k.respond_to?(:to_delorean_format) ? k.to_delorean_format : k.to_s), encoder.as_json(v)] }]
  end

end
