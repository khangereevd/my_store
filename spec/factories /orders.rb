FactoryBot.define do
  factrory :order do
    association(:user)
  end
end
