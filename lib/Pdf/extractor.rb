# To change this template, choose Tools | Templates
# and open the template in the editor.
module Aspose
  module Cloud

    module Pdf
      class Extractor
        def initialize filename
          @filename = filename
        end

=begin
  Gets number of images in a specified page
  @param  number page_number
=end    
        def get_image_count page_number
          begin
        
            if page_number == ''
              raise 'page number not sepcified'
            end
        
            if @filename == ''
              raise 'filename not sepcified'
            end
        
        
            str_uri = $product_uri + '/pdf/' + @filename + '/pages/' + page_number.to_s + '/images'
            str_signed_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
        
            response_stream = ::RestClient.get(str_signed_uri, {:accept=>'application/json'})        
            stream_hash = JSON.parse(response_stream)        
            return stream_hash['Images']['List'].length
        
          rescue Exception=>e
            print e
          end
        end

=begin
  Get the particular image from the specified page with the default image size
	@param number page_number
	@param number image_index
	@param string image_format
=end    
        def get_image_default_size page_number, image_index, image_format
          begin
        
            if page_number == ''
              raise 'page number not sepcified'
            end
        
            if image_index == ''
              raise 'image index not sepcified'
            end
        
            if image_format == ''
              raise 'image format not sepcified'
            end
        
            if @filename == ''
              raise 'filename not sepcified'
            end
                
        
            str_uri = $product_uri + '/pdf/' + @filename + '/pages/' + page_number.to_s + '/images/' + image_index.to_s + '?format=' + image_format
            str_signed_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
       
            response_stream = ::RestClient.get(str_signed_uri, {:accept=>'application/json'})        
        
            valid_output = Aspose::Cloud::Common::Utils.validate_output(response_stream)
        
            if valid_output == ''          
              output_path = $out_put_location + Aspose::Cloud::Common::Utils.get_filename(@filename) + '_' + image_index.to_s + '.' + image_format
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
  Get the particular image from the specified page with the default image size
	@param int page_number
	@param int image_index
	@param string image_format
	@param int width
	@param int height
=end    
        def get_image_custom_size page_number, image_index, image_format, width=0, height=0
          begin
        
            if page_number == ''
              raise 'page number not sepcified'
            end
        
            if image_index == ''
              raise 'image index not sepcified'
            end
        
            if image_format == ''
              raise 'image format not sepcified'
            end
        
            if @filename == ''
              raise 'filename not sepcified'
            end
                
        
            str_uri = $product_uri + '/pdf/' + @filename + '/pages/' + page_number.to_s + '/images/' + image_index.to_s + '?format=' + image_format + '&width=' + width.to_s + '&height=' + height.to_s
            str_signed_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
        
            response_stream = ::RestClient.get(str_signed_uri, {:accept=>'application/json'})        
        
            valid_output = Aspose::Cloud::Common::Utils.validate_output(response_stream)
        
            if valid_output == ''          
              output_path = $out_put_location + Aspose::Cloud::Common::Utils.get_filename(@filename) + '_' + image_index.to_s + '.' + image_format
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