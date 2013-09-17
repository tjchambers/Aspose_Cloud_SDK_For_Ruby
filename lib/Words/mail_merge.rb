# To change this template, choose Tools | Templates
# and open the template in the editor.
module Aspose
  module Cloud

    module Words
      class MailMerge
        def initialize filename
          @filename = filename
        end
    
=begin
   Executes mail merge without regions.
   @param string filename
   @param string str_xml
=end     
    
        def execute_mail_merge str_xml
      
          begin
        
            if @filename == ''
              raise 'Base file not specified.'
            end
        
            if str_xml == ''
              raise 'XML not specified.'
            end
        
                
            str_uri = $product_uri + '/words/' + @filename + '/executeMailMerge'
            signed_str_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
                
        
            response_stream = RestClient.post(signed_str_uri,str_xml,{:accept=>:json})
            stream_hash = JSON.parse(response_stream)
        
            valid_output = Aspose::Cloud::Common::Utils.validate_output(response_stream)
        
            if valid_output == ''                              
              folder = Aspose::Cloud::AsposeStorage::Folder.new
              output_stream = folder.get_file(stream_hash['Document']['FileName'])
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
   Executes mail merge with regions.
   @param string filename
   @param string str_xml
=end     
    
        def execute_mail_merge_with_regions str_xml
      
          begin
        
            if @filename == ''
              raise 'Base file not specified.'
            end
        
            if str_xml == ''
              raise 'XML not specified.'
            end
        
                
            str_uri = $product_uri + '/words/' + @filename + '/executeMailMerge?withRegions=true'
            signed_str_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
            response_stream = RestClient.post(signed_str_uri,str_xml,{:accept=>:json})
            stream_hash = JSON.parse(response_stream)
            valid_output = Aspose::Cloud::Common::Utils.validate_output(response_stream)
        
            if valid_output == ''                              
              folder = Aspose::Cloud::AsposeStorage::Folder.new
              output_stream = folder.get_file(stream_hash['Document']['FileName'])                   
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
   Executes mail merge with regions.
   @param string filename
   @param string str_xml
=end     
    
        def execute_template str_xml
      
          begin
        
            if @filename == ''
              raise 'Base file not specified.'
            end
        
            if str_xml == ''
              raise 'XML not specified.'
            end
            str_uri = $product_uri + '/words/' + @filename + '/executeTemplate'
            signed_str_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
            response_stream = RestClient.post(signed_str_uri,str_xml,{:accept=>:json})
            stream_hash = JSON.parse(response_stream)
            valid_output = Aspose::Cloud::Common::Utils.validate_output(response_stream)
        
            if valid_output == ''                              
              folder = Aspose::Cloud::AsposeStorage::Folder.new
              output_stream = folder.get_file(stream_hash['Document']['FileName'])                   
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