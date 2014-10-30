Rails.application.eager_load!
ActiveModel::ArraySerializer.root = false
# ActiveModel::Serializer.setup do |config|
#   config.embed = :subscriber_id
#   config.embed_in_root = false
# end

# ActiveRecord::Base.descendants.each do |model|
#   klass = Class.new(ActiveModel::Serializer) do
#     keywords = %w(relationships)
#     class_variable_set(:@@relationships, [])
#
#     def relationships
#       self.class.class_variable_get(:@@relationships)
#     end
#
#     model.column_names.each do |column|
#       match = column.match(/(.+?)_id/)
#       next unless match
#
#       with_id, name = match[0], match[1]
#       relations = class_variable_get(:@@relationships)
#       relations << name
#       class_variable_set(:@@relationships, relations)
#
#       define_method(name) do
#         relation = name.capitalize.constantize
#         id = send(with_id)
#         relation.find(id)
#       end
#     end
#
#     attributes(*(
#       model.column_names +
#       class_variable_get(:@@relationships) +
#       keywords
#     ))
#   end
#   Object.const_set("#{model.name}Serializer", klass)
# end
