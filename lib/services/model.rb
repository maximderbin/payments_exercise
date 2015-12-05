module Services
  class Model
    attr_reader :object

    def self.object(name)
      alias_method name, :object
    end

    def self.json(options = nil)
      return @json if options.nil?
      @json = options
    end

    def self.list(scope)
      scope.map{ |record| new(record) }
    end

    def self.json_list(scope)
      list(scope).map(&:as_json)
    end

    def initialize(object)
      @object = object
    end

    def create(params)
      object.assign_attributes(params)
      yield object if block_given?
      object.save
    end

    def update(params)
      object.update_attributes(params)
    end

    def destroy
      object.destroy rescue false
    end

    def errors
      object.errors.messages
    end

    def as_json(*)
      object.as_json(self.class.json)
    end

    private def transaction
      ActiveRecord::Base.transaction do
        yield
      end
    end
  end
end
