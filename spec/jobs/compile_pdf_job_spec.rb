require 'rails_helper'

RSpec.describe "CompilePdfJob" do
    subject { CompilePdfJob }
    let(:compilation) { FactoryBot.create(:compilation) }

    it "compiles a PDF" do
        file_stub = Rails.root.join("spec", "support", "image.jpg").to_s

        allow_any_instance_of(subject)
            .to receive(:download_image)
            .and_return(file_stub.to_s)

        subject.perform_now(compilation)
        expect(compilation.completed_at).not_to be_nil
        debugger
        expect(compilation.compiled_pdf).to eq("foo")
    end
end