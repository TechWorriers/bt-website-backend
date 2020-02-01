class BaseModelMongoid
  include Mongoid::Document
  include Mongoid::Attributes::Dynamic

  field :ref_id, type: Integer

  index({ ref_id: 1 }, unique: true)
  store_in database: -> { 'bt' }
end
