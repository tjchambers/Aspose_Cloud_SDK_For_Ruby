# To change this template, choose Tools | Templates
# and open the template in the editor.
module Aspose
  module Cloud

    module Words
      class Document
        def initialize(filename)
          @filename = filename
        end

=begin
  Appends a list of documents to this one.
  @param string append_docs
  @param import_format_modes
  @param source_folder
=end     

        def append_document append_docs, import_format_modes, source_folder
          begin
        
            if @filename == ''
              raise 'Base file not specified.'
            end
        
            if append_docs.length != import_format_modes.length
              raise 'Please specify complete documents and import format modes.'
            end
        
            str_uri = $product_uri + '/words/' + @filename + '/appendDocument'
            signed_str_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
        
            objs = []
            
            i = 0
            append_docs.each do |val|
              objs << { "Href" => source_folder.empty?? val : source_folder + "\\" + val , "ImportFormatMode"=> import_format_modes[i] }
              i = i+1
            end
            
            json_data = JSON.generate( { "DocumentEntries" => objs } )
        
            response_stream = RestClient.post(signed_str_uri,json_data,{:content_type => :json})
        
            valid_output = Aspose::Cloud::Common::Utils.validate_output(response_stream)
        
            if valid_output == ''                              
              folder = Aspose::Cloud::AsposeStorage::Folder.new
              if source_folder == ''
                output_stream = folder.get_file(@filename)
              else
                output_stream = folder.get_file( source_folder + '/' + @filename)
              end
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
   Get Resource Properties information like document source format, IsEncrypted, IsSigned and document properties   
=end     
    
        def get_document_info
      
          begin
        
            if @filename == ''
              raise 'Base file not specified.'
            end
        
            str_uri = $product_uri + '/words/' + @filename
            signed_str_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
        
            response_stream = RestClient.get(signed_str_uri,{:accept=>'application/json'})
        
            stream_hash = JSON.parse(response_stream)
            stream_hash['Code'] == 200 ? stream_hash['Document'] : false

          rescue Exception => e
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
        
            str_uri = $product_uri + '/words/' + @filename + '/documentProperties/' + property_name
            signed_str_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
        
            response_stream = RestClient.get(signed_str_uri,{:accept=>'application/json'})
        
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
        
            str_uri = $product_uri + '/words/' + @filename + '/documentProperties/' + property_name
            signed_str_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
        
            response_stream = RestClient.put(signed_str_uri,json_data,{:content_type=>:json})
        
            xmldoc = REXML::Document.new(response_stream)                        
        
            if(xmldoc.elements.to_a('SaaSposeResponse/Status').first.text == 'OK')
              return xmldoc.elements.to_a('SaaSposeResponse/DocumentProperty')
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
        
            str_uri = $product_uri + '/words/' + @filename + '/documentProperties/' + property_name
            signed_str_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
        
            response_stream = RestClient.delete(signed_str_uri,{:accept=>'application/json'})
        
            stream_hash = JSON.parse(response_stream)
            stream_hash['Code'] == 200

          rescue Exception => e
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
        
            str_uri = $product_uri + '/words/' + @filename + '/documentProperties'
            signed_str_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
        
            response_stream = RestClient.get(signed_str_uri,{:accept=>'application/json'})
        
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
     Convert Word to different file format without using storage
     @param string inputFile
     @param string outputFilename
     @param string outputFormat
=end
    
        def convert_local_file input_file,output_filename,output_format
          begin
        
            if input_file == ''
              raise('input file not specified')
            end                
        
            if output_filename == ''
              raise('output file not specified')
            end
        
            if output_format == ''
              raise('output format not specified')
            end
        
            str_uri = $product_uri + '/words/convert?format=' + output_format
            str_signed_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
        
            response_stream = Aspose::Cloud::Common::Utils.upload_file_binary(input_file, str_signed_uri)                
        
            valid_output = Aspose::Cloud::Common::Utils.validate_output(response_stream)
        
            if valid_output == ''
          
              if output_format == 'html'
                saveformat = 'zip'
              else
                saveformat = output_format
              end
          
              if output_filename == ''
                output_filename = Utils::get_filename(input_file) + '.' + saveformat
              end
          
              output_path = $out_put_location + output_filename
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