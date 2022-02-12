class Author < ApplicationRecord
    has_many :books

    default_scope { where("age = ?",26) }

end
