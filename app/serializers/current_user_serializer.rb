class CurrentUserSerializer < ActiveModel::Serializer
  extend Memoist
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

  attributes :id, :access_token, *EXAMPLE_ME.keys

  EXAMPLE_ME.keys.each do |key|
    define_method(key) do
      me[key]
    end
  end

  private

  memoize def me
    graph = Koala::Facebook::API.new(object.access_token)
    graph.get_object(:me).to_options rescue binding.pry
  end
end
