class Compilation < ApplicationRecord
    has_one_attached :compiled_pdf
    
    def to_param
        uuid
    end
end
