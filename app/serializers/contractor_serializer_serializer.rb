class ContractorSerializerSerializer
  include FastJsonapi::ObjectSerializer
  attributes :email, :name, :hourly_rate, :specialty, :active
  set_type :contractor
end
