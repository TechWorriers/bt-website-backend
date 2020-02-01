Role.destroy_all
[
  {
    id: 1,
    name: :admin,
  },
  {
    id: 2,
    name: :user
  }
].each do |role|
  Role.create!(role)
end
