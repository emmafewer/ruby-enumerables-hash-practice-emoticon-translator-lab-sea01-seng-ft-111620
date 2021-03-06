require 'yaml'
require 'pry'

def load_library(emoticons)
final_hash = {}
emoticons = YAML.load_file('lib/emoticons.yml')
 emoticons.each do |key, value|
   final_hash[key] = {}
   final_hash[key][:english] = value[0]
   final_hash[key][:japanese] = value[1]
 end
 final_hash
end

def get_japanese_emoticon(file_path, emoticon)
 load_library(file_path).each do |key, value|
   if value[:english] == emoticon
     return value[:japanese]
   end
 end
  return "Sorry, that emoticon was not found"
end

def get_english_meaning(file_path, emoticon)
  load_library(file_path).each do |key, value|
    if value[:japanese] == emoticon
      return key
    end
  end
  return "Sorry, that emoticon was not found"
end

