# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  avatar_url :string           not null
#  last_login :datetime
#  name       :string           not null
#  steam_id3  :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  role_id    :bigint           not null
#
# Indexes
#
#  index_users_on_role_id    (role_id)
#  index_users_on_steam_id3  (steam_id3)
#
# Foreign Keys
#
#  fk_rails_...  (role_id => roles.id)
#
FactoryBot.define do
  factory :user do
    name { "MyString" }
    steam_id3 { "MyString" }
    avatar_url { "MyString" }
    last_login { "2021-08-10 23:54:31" }
  end
end
