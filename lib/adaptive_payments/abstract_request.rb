module AdaptivePayments
  class AbstractRequest < RequestModel
    include RequestEnvelope

    class << self
      def operation(name = nil)
        @operation = name unless name.nil?
        @operation
      end

      def build_response(string)
        klass = AdaptivePayments.const_get(operation.to_s + "Response")
        klass.new(string)
      end
    end
  end
end
