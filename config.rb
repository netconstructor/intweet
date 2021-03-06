module Intweet
  class Config < ::Hash
    def initialize # (other_hash = {})
      other_hash = YAML.load_file("config.yml")
      
      other_hash.keys.each do |key|
        self[key.to_sym] = other_hash[key]
      end
    end

    def method_missing(method_name, *args)
      if key?(method_name.to_sym)
        self[method_name.to_sym]
      else
        super
      end
    end
    
    def log(s)
      File.open("intweet.log", "a") do |file|
        file.write "#{s}\n"
      end
    end
  end
end