class Article < ApplicationRecord
    #validates :title, presence: true
    #validates :author, presence: true
    #validates :content, presence: true
    #DRY version

    validates :title, :author, :content, presence: true
end
