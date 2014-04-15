# To change this template, choose Tools | Templates
# and open the template in the editor.
module Aspose
  module Cloud

    module Slides
      class Document
        def initialize filename
          @filename = filename
        end

=begin
  Finds the slide count of the specified PowerPoint document
=end    
        def get_slide_count(storage_type='',folder_name = '',storage_name='')
      
          begin
        
            if @filename == ''
              raise 'filename not specified'
            end
        
            str_uri = $product_uri + '/slides/' + @filename + '/slides'
            if !folder_name.empty?
              str_uri += '?folder=' + folder_name
            end
            if !storage_name.empty?
              str_uri += '&storage=' + storage_name
            end
            str_signed_uri = Aspose::Cloud::Common::Utils.sign(str_uri)        
            response_stream = ::RestClient.get(str_signed_uri, {:accept=>'application/json'})
        
            stream_hash = JSON.parse(response_stream)
        
            return stream_hash['Slides']['SlideList'].length
        
          rescue Exception=>e
            print e
          end
      
        end

=begin
  Replaces all instances of old text with new text in a presentation or a particular slide
  @param string old_text
  @param string new_text
  @param number slide_number
=end    
        def replace_text old_text, new_text, slide_number = 0
      
          begin
        
            if @filename == ''
              raise 'filename not specified'
            end
        
            if old_text == ''
              raise 'old text not specified'
            end
        
            if new_text == ''
              raise 'new text not specified'
            end
        
            if(slide_number == 0)
              str_uri = $product_uri + '/slides/' + @filename + '/replaceText?oldValue=' + old_text + '&newValue=' + new_text + '&ignoreCase=true'
            else
              str_uri = $product_uri + '/slides/' + @filename + '/slides/' + slide_number.to_s + '/replaceText?oldValue=' + old_text + '&newValue=' + new_text + '&ignoreCase=true'
            end
        
            str_signed_uri = Aspose::Cloud::Common::Utils.sign(str_uri) 
            response_stream = ::RestClient.post(str_signed_uri, '', {:accept=>'application/json'})
        
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
  Gets all the text items in a slide or presentation
  @param number slide_number
  @param boolean with_empty
=end    
        def get_all_text_items slide_number=0, with_empty=false
      
          begin
        
            if @filename == ''
              raise 'filename not specified'
            end
        
            if(slide_number == 0)
              str_uri = $product_uri + '/slides/' + @filename + '/textItems?&withEmpty='+with_empty.to_s
            else
              str_uri = $product_uri + '/slides/' + @filename + '/slides/' + slide_number.to_s + '/textItems?&withEmpty='+with_empty.to_s
            end

            str_signed_uri = Aspose::Cloud::Common::Utils.sign(str_uri)        
            response_stream = ::RestClient.get(str_signed_uri, {:accept=>'application/json'})
        
            stream_hash = JSON.parse(response_stream)
        
            return stream_hash['TextItems']['Items']
        
          rescue Exception=>e
            print e
          end
      
        end
    
=begin
  Deletes all slides from a presentation
=end    
        def delete_all_slides storage_type='Aspose', folder_name='',storage_name=''
      
          begin
        
            if @filename == ''
              raise 'filename not specified'
            end
        
        
            str_uri = $product_uri + '/slides/' + @filename + '/slides'
            if !folder_name.empty?
              str_uri += '?folder=' + folder_name
            end
            if !storage_name.empty?
              str_uri += '&storage=' + storage_name
            end
        
            str_signed_uri = Aspose::Cloud::Common::Utils.sign(str_uri)        
            response_stream = ::RestClient.delete(str_signed_uri, {:accept=>'application/json'})
        
            valid_output = Aspose::Cloud::Common::Utils.validate_output(response_stream)
        
            if valid_output == ''
              folder = Aspose::Cloud::AsposeStorage::Folder.new
              output_stream = folder.get_file(@filename)
              output_path = $out_put_location + @filename ;
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
   Get Document's properties
=end     
    
        def get_properties
      
          begin
        
            if @filename == ''
              raise 'Base file not specified.'
            end
        
            str_uri = $product_uri + '/slides/' + @filename + '/documentProperties'
            signed_str_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
        
            response_stream = ::RestClient.get(signed_str_uri,{:accept=>'application/json'})
        
            stream_hash = JSON.parse(response_stream)
        
            if(stream_hash['Code'] == 200)
              return stream_hash['DocumentProperties']['List']
            else
              return false
            end
        
          rescue Exception=>e
            print e
          end
      
        end

=begin
   Get Resource Properties information like document source format, IsEncrypted, IsSigned and document properties
   @param string property_name
=end     
    
        def get_property property_name
      
          begin
        
            if @filename == ''
              raise 'Base file not specified.'
            end
        
            if property_name == ''
              raise 'Property name not specified.'
            end
        
            str_uri = $product_uri + '/slides/' + @filename + '/documentProperties/' + property_name
            signed_str_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
            
            response_stream = ::RestClient.get(signed_str_uri,{:accept=>'application/json'})
        
            stream_hash = JSON.parse(response_stream)
        
            if(stream_hash['Code'] == 200)
              return stream_hash['DocumentProperty']
            else
              return false
            end
        
          rescue Exception=>e
            print e
          end
      
        end 

=begin
   Set document property
   @param string property_name
   @param string property_value
=end     
    
        def set_property property_name, property_value
      
          begin
        
            if @filename == ''
              raise 'Base file not specified.'
            end
        
            if property_name == ''
              raise 'Property name not specified.'
            end
        
            if property_value == ''
              raise 'Property value not specified.'
            end
        
            post_hash = { 'Value' => property_value}
            json_data = post_hash.to_json  
        
            str_uri = $product_uri + '/slides/' + @filename + '/documentProperties/' + property_name
            signed_str_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
        
            response_stream = ::RestClient.put(signed_str_uri,json_data,{:accept=>'application/json'})
        
            stream_hash = JSON.parse(response_stream)
        
            if(stream_hash['Code'] == 200)
              return stream_hash['DocumentProperty']
            else
              return false
            end
        
          rescue Exception=>e
            print e
          end
      
        end

=begin
   Remove All Document's properties
=end     
    
        def remove_all_properties
      
          begin
        
            if @filename == ''
              raise 'Base file not specified.'
            end
                
        
            str_uri = $product_uri + '/slides/' + @filename + '/documentProperties'
            signed_str_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
        
            response_stream = ::RestClient.delete(signed_str_uri,{:accept=>'application/json'})
        
            stream_hash = JSON.parse(response_stream)
        
            if(stream_hash['Code'] == 200)
              return true
            else
              return false
            end
        
          rescue Exception=>e
            print e
          end
      
        end
    
=begin
   Delete a document property
   @param string property_name
=end     
    
        def delete_property property_name
      
          begin
        
            if @filename == ''
              raise 'Base file not specified.'
            end
        
            if property_name == ''
              raise 'Property name not specified.'
            end
        
            str_uri = $product_uri + '/slides/' + @filename + '/documentProperties/' + property_name
            signed_str_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
            response_stream = ::RestClient.delete(signed_str_uri,{:accept=>'application/json'})
        
            stream_hash = JSON.parse(response_stream)
        
            if(stream_hash['Code'] == 200)
              return true
            else
              return false
            end
        
          rescue Exception=>e
            print e
          end
      
        end

=begin
   Add custom document properties
   @param hash property_list  
=end     
    
        def add_custom_property property_list
      
          begin
        
            if @filename == ''
              raise 'Base file not specified.'
            end
        
            if property_list == ''
              raise 'Property list not specified.'
            end
        
            json_data = property_list.to_json
            
            #        post_hash = { 'Value' => property_value}
            #        json_data = post_hash.to_json  
        
            str_uri = $product_uri + '/slides/' + @filename + '/documentProperties'
            signed_str_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
            response_stream = ::RestClient.put(signed_str_uri,json_data,{:accept=>'application/json'})
        
            stream_hash = JSON.parse(response_stream)
        
            if(stream_hash['Code'] == 200)
              return stream_hash
            else
              return false
            end
        
          rescue Exception=>e
            print e
          end
      
        end

=begin
     saves the document into various formats    
     @param string outputFilename
     @param string outputFormat
=end
    
        def save_as output_path,output_format , storage_type='Aspose',folder_name='',storage_name=''
          begin
        
            if @filename == ''
              raise('input file not specified')
            end                
        
            if output_path == ''
              raise('output path not specified')
            end
        
            if output_format == ''
              raise('output format not specified')
            end
        
            #        if not File.exist?(inputFile)
            #          raise('input file doesn't exist.')
            #        end
        
        
        
            str_uri = $product_uri + '/slides/'+@filename+'?format=' + output_format
            if !folder_name.empty?
              str_uri += '?folder=' + folder_name
            end
            if !storage_name.empty?
              str_uri += '&storage=' + storage_name
            end
            str_signed_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
            response_stream = ::RestClient.get(str_signed_uri,{:accept=>'application/json'})
            valid_output = Aspose::Cloud::Common::Utils.validate_output(response_stream)
            if valid_output == ''                              
              output_path = output_path + Aspose::Cloud::Common::Utils.get_filename(@filename) + '.' + output_format
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
  saves the document into various formats         
  @param string slide_number
  @param string outputFilename
  @param string outputFormat
=end
    
        def save_slide_as slide_number,output_path,output_format
          begin
        
            if @filename == ''
              raise('input file not specified')
            end                
        
            if output_path == ''
              raise('output path not specified')
            end
        
            if slide_number == ''
              raise('slide number not specified')
            end
        
            if output_format == ''
              raise('output format not specified')
            end
        
            #        if not File.exist?(inputFile)
            #          raise('input file doesn't exist.')
            #        end
        
        
        
            str_uri = $product_uri + '/slides/'+@filename+'/slides/'+slide_number.to_s+'?format=' + output_format
            str_signed_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
            response_stream = ::RestClient.get(str_signed_uri,{:accept=>'application/json'})
        
        
            valid_output = Aspose::Cloud::Common::Utils.validate_output(response_stream)
        
            if valid_output == ''                              
              output_path = $out_put_location + Aspose::Cloud::Common::Utils.get_filename(@filename) + '_' + slide_number.to_s + '.' + output_format
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