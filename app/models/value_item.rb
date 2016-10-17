class ValueItem < ApplicationRecord

  belongs_to :value_list, counter_cache: true
end
