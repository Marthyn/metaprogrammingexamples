class Classifier
  def self.create(data, klass_name)
    if data.is_a? Array
      resources.map { |resource| Classifier.create_klass(resource, klass_name) }
    else
      Classifier.create_klass(data, klass_name)
    end
  end

  def self.create_klass(resource, klass_name)
    Object.const_set(klass_name, Class.new { include Myxy::Resource })
  end
end
