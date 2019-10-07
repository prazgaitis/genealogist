FactoryBot.define do
  factory :compilation do
    page_count { 1 }
    url_identifier { 123 }
    status { "pending" }
    uuid { SecureRandom.uuid }
    pdf_url { "" } 
  end
end