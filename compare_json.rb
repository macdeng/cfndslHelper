require 'json'
require 'pp'
require_relative './custom_function'

SRC_FILE ||= 'old.json'
DEST_FILE ||= 'new.json'

src = JSON.parse(File.read(SRC_FILE))
dest = JSON.parse(File.read(DEST_FILE))

pp src.compareHash(dest)
# puts JSON.pretty_generate(src.compareHash(dest))