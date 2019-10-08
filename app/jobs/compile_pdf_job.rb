class CompilePdfJob < ApplicationJob
  queue_as :default

  def perform(compilation)
    raise "Invalid data" unless compilation.page_count.present? && compilation.url_identifier.present?
    Rails.logger.info("Started compiling PDF for Compilation #{compilation.id}")
    # Do something later
    compilation.update(status: "pending")
    images = download_images(compilation)
    pdf = create_pdf(images, compilation.url_identifier)

    compilation.compiled_pdf.attach(io: pdf, filename: 'compiled.pdf')
    compilation.update(completed_at: DateTime.now, status: "completed")
    compilation
  rescue StandardError => e
    puts "ERROR: #{e}"
    compilation.update(status: "failed")
  end

  def download_images(compilation)
    ct = compilation.page_count
    id = compilation.url_identifier
    files = []

    (0..ct).each_with_index do |val, ix|

      Dir.mkdir "tmp/downloads/#{id}" unless Dir.exists? "tmp/downloads/#{id}"
      filename = "tmp/downloads/#{id}/#{ix}.jpg"

      file = File.open(filename, "w") do |file|
        file.binmode

        url = build_url(id, ix)
        download_image(url, file)
      end
      files << file
    end
    files
  end

  private

  def download_image(url, file)
    Rails.logger.info("Starting download from #{url}")
    HTTParty.get(url, stream_body: true) do |blob|
      file.write(blob)
    end
    file
  end

  def create_pdf(images, id)
    Dir.mkdir("tmp/outputs") unless Dir.exists? "tmp/outputs/"
    convert = MiniMagick::Tool::Convert.new
    images.each do |image|
      convert << File.expand_path(image)
    end

    output_path = "./tmp/outputs/#{id}.pdf"
    convert << output_path

    convert.call

    File.open(output_path)
  end

  def build_url(id, page_num)
    "http://www.epaveldas.lt/recordImageSmall/ARCH/1834/1/5?exId=#{id}&seqNr=#{page_num}"
  end
end
