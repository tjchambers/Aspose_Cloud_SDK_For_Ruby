# To change this template, choose Tools | Templates
# and open the template in the editor.
module Aspose
  module Cloud

    module Words
      class Builder
        def initialize filename
          @filename = filename
        end
    
=begin
   Inserts water mark text into the document.
   @param string text
   @param string rotation_angle
=end     
    
        def insert_watermark_text text, rotation_angle
      
          begin
        
            if @filename == ''
              raise 'Base file not specified.'
            end
        
            if text == ''
              raise 'Text not specified.'
            end
        
            if rotation_angle == ''
              raise 'Rotation Angle not specified.'
            end
        
            str_uri = $product_uri + '/words/' + @filename + '/insertWatermarkText'
            signed_str_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
            post_hash = { 'Text' => text, 'RotationAngle'=>rotation_angle}
            json_data = post_hash.to_json
        
            response_stream = RestClient.post(signed_str_uri,json_data,{:content_type => :json})
        
            valid_output = Aspose::Cloud::Common::Utils.validate_output(response_stream)
        
            if valid_output == ''                              
              folder = Aspose::Cloud::AsposeStorage::Folder.new
              output_stream = folder.get_file(@filename)                   
              output_path = $out_put_location + @filename
              Aspose::Cloud::Common::Utils.save_file(output_stream,output_path)
              return ''
            else
              return valid_output
            end        
        
        
          rescue Exception=>e
            print e
          end
      
        end 

=begin
   Inserts water mark image into the document.
   @param string image_file
   @param string rotation_angle
=end     
    
        def insert_watermark_image image_file, rotation_angle
      
          begin
        
            if @filename == ''
              raise 'Base file not specified.'
            end
        
            if image_file == ''
              raise 'Image file not specified.'
            end
        
            if rotation_angle == ''
              raise 'Rotation Angle not specified.'
            end
        
            str_uri = $product_uri + '/words/' + @filename + '/insertWatermarkImage?imageFile=' + image_file.to_s + '&rotationAngle=' + rotation_angle.to_s
            signed_str_uri = Aspose::Cloud::Common::Utils.sign(str_uri)                
        
            response_stream = RestClient.post(signed_str_uri,'',{:content_type => :json})
        
            valid_output = Aspose::Cloud::Common::Utils.validate_output(response_stream)
        
            if valid_output == ''                              
              folder = Aspose::Cloud::AsposeStorage::Folder.new
              output_stream = folder.get_file(@filename)                   
              output_path = $out_put_location + @filename
              Aspose::Cloud::Common::Utils.save_file(output_stream,output_path)
              return ''
            else
              return valid_output
            end        
        
        
          rescue Exception=>e
            print e
          end
      
        end
    
=begin
   Replace a text with the new value in the document
   @param string old_value
   @param string new_value
   @param string is_match_case
   @param string is_match_whole_word   
=end     
    
        def replace_text old_value, new_value, is_match_case, is_match_whole_word
      
          begin
        
            if @filename == ''
              raise 'Base file not specified.'
            end
        
            if old_value == ''
              raise 'Old value not specified.'
            end
        
            if new_value == ''
              raise 'New Value not specified.'
            end
        
            post_hash = { 'OldValue' => old_value, 'NewValue'=>new_value,'IsMatchCase' => is_match_case,'IsMatchWholeWord' => is_match_whole_word }
            json_data = post_hash.to_json
            str_uri = $product_uri + '/words/' + @filename + '/replaceText'
            signed_str_uri = Aspose::Cloud::Common::Utils.sign(str_uri)                
            response_stream = RestClient.post signed_str_uri, json_data, {:content_type => :json}
        
            valid_output = Aspose::Cloud::Common::Utils.validate_output(response_stream)
        
            if valid_output == ''                              
              folder = Aspose::Cloud::AsposeStorage::Folder.new
              output_stream = folder.get_file(@filename)                   
              output_path = $out_put_location + @filename
              Aspose::Cloud::Common::Utils.save_file(output_stream,output_path)
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