class Transaction < BaseModelMongoid
  field :ref_id, type: String
  field :transaction_type, type: String
  field :to_account, type: String
  field :amount, type: String
  field :options, type: Hash
  field :bank_name, type: String
  field :code, type: String
end
