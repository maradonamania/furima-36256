class DayToShip < ActiveHash::Base
  self.data = [
    { id: 0, name: '--' },
    { id: 1, name: '1~2日で発送' },
    { id: 2, name: '2~3日で発送' },
    { id: 3, name: '4~7日で発送' },
    { id: 4, name: 'やや傷や汚れあり' },
    { id: 5, name: '傷や汚れあり' },
    { id: 6, name: '全体的に状態が悪い' }
  ]
  include ActiveHash::Associations
  has_many :items
end
