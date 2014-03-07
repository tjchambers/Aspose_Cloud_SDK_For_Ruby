module Aspose
  module Cloud
    module Slides
      class Converter
        def initialize filename
          @filename = filename
          raise 'Base file not specified.' if @filename.empty?
        end    

=begin
  Saves a particular slide into various formats with specified width and height
  @param number slide_number
  @param string image_format
  @param number width
  @param number height
=end    
        def convert_to_image slide_number, image_format, width, height
          begin
            raise 'Slide number not specified.' if slide_number.nil?
            raise 'Image format not specified.' if image_format.empty?
            raise 'Width not specified.' if width.nil?
            raise 'Height not specified.' if height.nil?

            str_uri = "#{$product_uri}/slides/#{@filename}/slides/#{slide_number}?format=#{image_format}&width=#{width}&height=#{height}"
        
            str_signed_uri = Aspose::Cloud::Common::Utils.sign(str_uri)        
            response_stream = RestClient.get(str_signed_uri, {:accept=>'application/json'})  
        
            valid_output = Aspose::Cloud::Common::Utils.validate_output(response_stream)
        
            if valid_output == ''
              output_path = "#{$out_put_location}#{Aspose::Cloud::Common::Utils.get_filename(@filename)}.#{image_format}"
              Aspose::Cloud::Common::Utils.save_file(response_stream,output_path)
              return ''
            else
              return valid_output
            end

          rescue Exception=>e
            print e
          end
        end

=begin
  convert a document to SaveFormat
=end    
        def convert save_format, slide_number, storage_name='', folder=''
          begin

            raise 'Save format not specified.' if save_format.empty?

            str_uri = "#{$product_uri}/slides/#{@filename}/slides/#{slide_number}?format=#{save_format}"
            str_uri += "&storage=#{storage_name}&folder=#{folder}" unless storage_name.empty?

            str_signed_uri = Aspose::Cloud::Common::Utils.sign(str_uri)        
            response_stream = RestClient.get(str_signed_uri, {:accept=>'application/json'})  
        
            valid_output = Aspose::Cloud::Common::Utils.validate_output(response_stream)
        
            if valid_output == ''
              output_path = "#{$out_put_location}#{Aspose::Cloud::Common::Utils.get_filename(@filename)}.#{save_format}"
              Aspose::Cloud::Common::Utils.save_file(response_stream,output_path)
              return ''
            else
              return valid_output
            end
          rescue Exception=>e
            print e
          end
        end
      end
    end
  end
end