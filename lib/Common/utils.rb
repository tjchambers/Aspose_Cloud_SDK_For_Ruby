# This class provides common methods to be repeatedly used by other wrapper classes
module Aspose
  module Cloud
    module Common
      class Utils

        def self.process_command(url, method='GET', header_type='XML', src='')

          uri = URI.parse(url)
          http = Net::HTTP.new(uri.host, uri.port)
          http.use_ssl = false
          http.verify_mode = OpenSSL::SSL::VERIFY_NONE

          request = nil
          if method == 'GET'
            request = Net::HTTP::Get.new(url)
          elsif method == 'DELETE'
            request = Net::HTTP::Delete.new(url)
          elsif method == 'POST'
            request = Net::HTTP::Post.new(url)
          end

          request.body = src unless src.empty?

          if header_type == 'XML'
            request.add_field('Content-Type', 'application/xml')
          elsif header_type == 'JSON'
            request.add_field('Content-Type', 'application/json')
          end

          http.request(request).body
        end

        # Signs a URI with your appSID and Key.
        # * :url describes the URL to sign

        def self.sign(url)
          url = URI.escape(url)
          parsed_url = URI.parse(url)

          url_to_sign = parsed_url.scheme+'://' + parsed_url.host + parsed_url.path + '?appSID=' + $app_sid
          url_to_sign += '&' + parsed_url.query if parsed_url.query


          # create a signature using the private key and the URL
          raw_signature = OpenSSL::HMAC.digest(OpenSSL::Digest.new('sha1'), $app_key, url_to_sign)

          #Convert raw to encoded string
          signature = Base64.strict_encode64(raw_signature).tr('+/', '-_')

          #remove invalid character 
          signature = signature.gsub(/[=_-]/, '=' => '', '_' => '%2f', '-' => '%2b')

          #Define expression
          pat = Regexp.new('%[0-9a-f]{2}')

          #Replace the portion matched to the above pattern to upper case
          6.times do
            signature = signature.sub(pat, pat.match(signature).to_s.upcase)
          end

          # prepend the server and append the signature.
          signed_url = url_to_sign + "&signature=#{signature}"
          return signed_url
        end
   
        def self.validate_output(result)
         
          validate = ['Unknown file format.', 'Unable to read beyond the end of the stream', 
            'Index was out of range', 'Cannot read that as a ZipFile', 'Not a Microsoft PowerPoint 2007 presentation',
            'Index was outside the bounds of the array', 'An attempt was made to move the position before the beginning of the stream',
          ]

          validate.each do |value|
            return result if result.index(value)
          end

          ''

        end

        # Parses JSON date value to a valid date format
        # * :datestring holds the JSON Date value
        def self.parse_date(date_string)
          seconds_since_epoch = date_string.scan(/[0-9]+/)[0].to_i
          return Time.at((seconds_since_epoch-(21600000 + 18000000))/1000)
        end

        # Uploads a binary file from the client system
        # * :localfile holds the local file path along with name
        # * :url holds the required url to use while uploading the file to Aspose Storage		 
        def self.upload_file_binary(localfile,url)
          RestClient.put( url,File.new(localfile, 'rb'))
        end

        # Gets the count of a particular field in the response
        # * :localfile holds the local file path along with name
        # * :url holds the required url to use while uploading the file to Aspose Storage		 		 
        def self.get_field_count(url,field_name)	    
          response = RestClient.get(url, :accept => 'application/xml')
          doc = REXML::Document.new(response.body)
          pages = []		
          doc.elements.each(field_name) do |ele|
            pages << ele.text
          end
          return pages.size
        end
        # Saves the response stream to a local file.
        def self.save_file(response_stream,local_file)
          open(local_file, 'wb') do |file|
            file.write(response_stream.body)
          end
        end
   
        def self.get_filename(file)
     
          filename = File.basename(file, File.extname(file) );
     
          return filename
     
        end
   
      end
    end    
  end
end
