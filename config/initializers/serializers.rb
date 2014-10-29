Rails.application.eager_load!
ActiveModel::ArraySerializer.root = false
# ActiveModel::Serializer.setup do |config|
#   config.embed = :subscriber_id
#   config.embed_in_root = false
# end

ActiveRecord::Base.descendants.each do |model|
  klass = Class.new(ActiveModel::Serializer) do
    relations = []

    model.column_names.each do |column|
      match = column.match(/(.+?)_id/)
      next unless match

      with_id, name = match[0], match[1]
      relations << name

      define_method(name) do
        relation = name.capitalize.constantize
        id = send(with_id)
        relation.find(id)
      end
    end

    attributes(*(model.column_names + relations))
  end
  Object.const_set("#{model.name}Serializer", klass)
end
