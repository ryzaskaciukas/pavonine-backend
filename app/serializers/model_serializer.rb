class ModelSerializer < ActiveModel::Serializer
  EXAMPLE_ME = {
    # id: '10203011871647604',
    first_name: 'Domas',
    gender: 'male',
    last_name: 'Bitvinskas',
    link: 'https://www.facebook.com/app_scoped_user_id/10203011871647604/',
    locale: 'en_US',
    name: 'Domas Bitvinskas',
    timezone: 2,
    updated_time: '2013-10-30T09:28:41+0000',
    verified: true,
  }

  def self.relationships
    #     related_models = ActiveRecord::Base.descendants.select do |model|
    #       model.column_names.include?('current_user_id')
    #     end
    #
    #     names = related_models.map { |model| model.to_s.underscore.pluralize }
    #
    #     names.each do |name|
    #       define_method(name) do
    #         model = name.singularize.capitalize.constantize
    #         model.where(current_user_id: object.id)
    #       end
    #     end
    #
    #     names
    relations = Model.all.map(&:model).compact - ['current_user']
    relations.map(&:pluralize)
  end

  def self.static_fields
    Model.fields.keys
  end

  def self.dynamic_fields
    Model.all.flat_map { |m| m.attributes.keys }.uniq - static_fields
  end

  def self.current_user_attributes
    EXAMPLE_ME.keys
  end

  attributes :id, :name, *relationships, *dynamic_fields, *current_user_attributes

  def id
    object.token
  end

  dynamic_fields.each do |field|
    define_method field do
      ''
    end
  end

  relationships.each do |relationship|
    define_method relationship do
      Model.all.where("#{object.model}_id" => object.token).to_a
    end
  end

  # Facebook
  extend Memoist

  EXAMPLE_ME.keys.each do |key|
    define_method key do
      me[key]
    end
  end

  private

  memoize def me
    graph = Koala::Facebook::API.new(object.access_token)
    graph.get_object(:me).to_options
  rescue
    {}
  end
end
