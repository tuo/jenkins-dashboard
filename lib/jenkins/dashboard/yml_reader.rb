require 'YAML'
module Jenkins
  module Dashboard
    class YmlReader

      def self.parse file_path
        result = nil
        begin
          result = open(file_path) { |f| YAML.load(f) }
        rescue Exception  => e
          raise "File not found. check out file path: #{file_path}"
        end
        raise "Error parsing yml.Check out your yml format." unless result.kind_of? Array
        result
      end

    end
  end
end
