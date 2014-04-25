#!/usr/bin/env ruby

image_num = 0

File.open('copy.html', 'w') do |file|
  File.read(ARGV.first).each_line do |line|
    file << line.gsub(%r{(https?://.*?\.png)}) do |url|
      image_name = "images/image_#{image_num}.png"
      system("wget -O #{image_name} #{url}")

      image_num += 1

      image_name
    end
  end
end
