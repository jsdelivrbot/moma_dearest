require 'csv'
require 'open-uri'
require 'nokogiri'

namespace :art_pieces do
  desc "TODO"
  task populate: :environment do
    CSV.new(open("https://raw.githubusercontent.com/MuseumofModernArt/collection/master/Artworks.csv"), headers: :first_row).each do |row|
      url = row[-1]
      doc = Nokogiri::HTML(open(url))
      if row[-1].nil?
        image_url = nil
      else
        image_url = "www.moma.org" + doc.at_css('.sov-hero img')['srcset'].split(" ").first
      end
      p ArtPiece.create(title: row[0], artist: row[1], medium: row[4], momaUrl: image_url)
    end
  end

  desc "TODO"
  task check: :environment do
  end

end
