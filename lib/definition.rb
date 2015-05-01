class Definition
  attr_reader(:define, :id)
  @@definitions = []

  define_method(:initialize) do |attributes|
    @define = attributes.fetch(:define)
    @id = @@definitions.length().+(1)
  end

  define_method(:save) do
    @@definitions.push(self)
  end

  define_singleton_method(:find) do |define_id|
    found_def = nil
    @@definitions.each do |define_ex|
      if define_ex.id().eql?(define_id.to_i())
        found_def = define_ex
      end
    end
    found_def
  end

  define_singleton_method(:all) do
    @@definitions
  end

  define_singleton_method(:clear) do
    @@definitions = []
  end

end
