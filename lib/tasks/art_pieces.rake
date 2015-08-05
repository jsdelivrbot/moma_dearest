require 'csv'
require 'open-uri'
require 'nokogiri'

namespace :art_pieces do
  desc "TODO"
  task populate: :environment do
    CSV.new(open("https://raw.githubusercontent.com/MuseumofModernArt/collection/master/Artworks.csv"), headers: :first_row).each do |row|
      piece = ArtPiece.find_by_moma_num(row[7]) || ArtPiece.new(title: row[0], artist: row[1], medium: row[4], moma_url: nil, moma_num: row[7])
      piece.assign_attributes(title: row[0], artist: row[1], medium: row[4], moma_url: nil, moma_num: row[7])
        
      if row[-1].to_s.include?("http")
        url = row[-1]
        doc = Nokogiri::HTML(open(url))
        if doc.at_css('.sov-hero img')['srcset'].present?
          image_url = "www.moma.org" + doc.at_css('.sov-hero img')['srcset'].split(" ").first
          piece.moma_url = image_url
        end
      end
      piece.save
    end
  end

end
