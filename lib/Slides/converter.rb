# To change this template, choose Tools | Templates
# and open the template in the editor.
module Aspose
  module Cloud
    module Slides
      class Converter
        def initialize filename
          @filename = filename
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
        
            if @filename == ''
              raise 'filename not specified'
            end
        
            if slide_number == ''
              raise 'slide number not specified'
            end
        
            if image_format == ''
              raise 'image format not specified'
            end
        
            if width == ''
              raise 'width not specified'
            end
        
            if height == ''
              raise 'height not specified'
            end
                
            str_uri = $product_uri + '/slides/' + @filename + '/slides/' + slide_number.to_s + '?format=' + image_format +'&width=' + width.to_s + '&height=' + height.to_s
        
            str_signed_uri = Aspose::Cloud::Common::Utils.sign(str_uri)        
            response_stream = RestClient.get(str_signed_uri, {:accept=>'application/json'})  
        
            valid_output = Aspose::Cloud::Common::Utils.validate_output(response_stream)
        
            if valid_output == ''
              output_path = $out_put_location + Aspose::Cloud::Common::Utils.get_filename(@filename) + '.' + image_format
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
        def convert save_format,slide_number, storage_name='', folder=''
          begin
        
            if @filename == ''
              raise 'filename not specified'
            end                
        
            if save_format == ''
              raise 'save format not specified'
            end
                
            if(storage_name.empty? == true)       
              str_uri = $product_uri + '/slides/' + @filename + '/slides/' + slide_number.to_s + '?format=' + save_format
            else
              str_uri = $product_uri + '/slides/' + @filename + '/slides/' + slide_number.to_s + '?format=' + save_format + '&storage=' + storage_name + '&folder=' + folder
            end
        
            str_signed_uri = Aspose::Cloud::Common::Utils.sign(str_uri)        
            response_stream = RestClient.get(str_signed_uri, {:accept=>'application/json'})  
        
            valid_output = Aspose::Cloud::Common::Utils.validate_output(response_stream)
        
            if valid_output == ''
              output_path = $out_put_location + Aspose::Cloud::Common::Utils.get_filename(@filename) + '.' + save_format
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
