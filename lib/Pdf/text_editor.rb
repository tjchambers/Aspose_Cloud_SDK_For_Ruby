# To change this template, choose Tools | Templates
# and open the template in the editor.
module Aspose
  module Cloud
    module Pdf
      class TextEditor
        def initialize filename
          @filename = filename
        end

=begin
   Gets raw text from the whole PDF file or a specific page
   @param number page_number [optinal]
=end    
        def get_text page_number = 0
          begin
        
            if @filename == ''
              raise 'filename not specified'
            end
        
            if page_number > 0
              str_uri = $product_uri + '/pdf/' + @filename + '/pages/' + page_number.to_s + '/textitems'
            else
              str_uri = $product_uri + '/pdf/' + @filename + '/textitems';
            end
        
            str_signed_uri = Aspose::Cloud::Common::Utils.sign(str_uri)        
            response_stream = RestClient.get(str_signed_uri, {:accept=>'application/json'})  
        
            stream_hash = JSON.parse(response_stream)
            output_text = ''
            stream_hash['TextItems']['List'].each { |item| output_text.concat(item['Text'])  }
        
            return output_text        
        
          rescue Exception=>e
            print e
          end
        end

=begin
   Gets text items from the whole PDF file or a specific page 
   @param number page_number [optinal]
=end    
        def get_text_items page_number = 0,fragment_number = 0
          begin
        
            if @filename == ''
              raise 'filename not specified'
            end
        
            if page_number > 0
              str_uri = $product_uri + '/pdf/' + @filename + '/pages/' + page_number.to_s + '/textitems'
            else
              str_uri = $product_uri + '/pdf/' + @filename + '/textitems';
            end
            if fragment_number > 0
              str_uri = $product_uri + '/pdf/' + @filename + '/fragments/' + fragment_number.to_s + '/textitems'
            else
              str_uri = $product_uri + '/pdf/' + @filename + '/textitems';
            end
        
        
            str_signed_uri = Aspose::Cloud::Common::Utils.sign(str_uri)        
            response_stream = RestClient.get(str_signed_uri, {:accept=>'application/json'})  
        
            stream_hash = JSON.parse(response_stream)
        
            return stream_hash['TextItems']['List']                
        
          rescue Exception=>e
            print e
          end
        end    

=begin
   Gets count of the fragments from a particular page 
   @param number page_number 
=end    
        def get_fragment_count page_number
          begin
        
            if @filename == ''
              raise 'filename not specified'
            end
        
            if page_number == ''
              raise 'page number not specified'
            end
        
       
            str_uri = $product_uri + '/pdf/' + @filename + '/pages/' + page_number.to_s + '/fragments'        
            str_signed_uri = Aspose::Cloud::Common::Utils.sign(str_uri)        
            response_stream = RestClient.get(str_signed_uri, {:accept=>'application/json'})  
        
            stream_hash = JSON.parse(response_stream)
        
            return stream_hash['TextItems']['List'].length
        
          rescue Exception=>e
            print e
          end
        end    

=begin
   Gets TextFormat of a particular Fragment
   @param number page_number 
   @param number fragment_number 
=end    
        def get_text_format page_number, fragment_number, segament_number = 0
          begin
        
            if @filename == ''
              raise 'filename not specified'
            end
        
            if page_number == ''
              raise 'page number not specified'
            end
        
            if fragment_number == ''
              raise 'fragment number not specified'
            end
        
       
            str_uri = $product_uri + '/pdf/' + @filename + '/pages/' + page_number.to_s + '/fragments/' + fragment_number.to_s + (!segament_number.nil? ?  '/segments/' + segament_number.to_s : '') + '/textformat'
            str_signed_uri = Aspose::Cloud::Common::Utils.sign(str_uri)        
            response_stream = RestClient.get(str_signed_uri, {:accept=>'application/json'})  
        
            stream_hash = JSON.parse(response_stream)
        
            return stream_hash['TextFormat']
        
          rescue Exception=>e
            print e
          end
        end

=begin
    Replaces all instances of old text with new text in a PDF file or a particular page
    @param string old_text
    @param string new_text 
=end    
        def replace_text old_text, new_text, is_regular_expression = false, page_number = 0
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
        
               
            post_hash = { 'OldValue' => old_text, 'NewValue'=> new_text, 'Regex'=> 'false' }
            json_data = post_hash.to_json    
        
        
            if page_number > 0
              str_uri = $product_uri + '/pdf/' + @filename + '/pages/' + page_number.to_s + '/replaceText'
            else
              str_uri = $product_uri + '/pdf/' + @filename + '/replaceText'
            end

        
            str_signed_uri = Aspose::Cloud::Common::Utils.sign(str_uri)        
        
            response_stream = RestClient.post(str_signed_uri,json_data,{:accept=>'application/json'})  
               
            valid_output = Aspose::Cloud::Common::Utils.validate_output(response_stream)
        
            if valid_output == ''
              folder = Aspose::Cloud::AsposeStorage::Folder.new           
              output_stream = folder.get_file(@filename)          
              output_path = $out_put_location + @filename;          
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
  Gets count of the segments in a fragment
  @param number pageNumber
  @param number fragmentNumber
=end    
        def get_segment_count page_number, fragment_number
          begin
        
            if @filename == ''
              raise 'filename not specified'
            end
        
            if page_number == ''
              raise 'page number not specified'
            end
        
            if fragment_number == ''
              raise 'page number not specified'
            end
               
            str_uri = $product_uri + '/pdf/' + @filename + '/pages/' + page_number.to_s + '/fragments/' + fragment_number.to_s       
        
            str_signed_uri = Aspose::Cloud::Common::Utils.sign(str_uri)        
            response_stream = RestClient.get(str_signed_uri, {:accept=>'application/json'})  
        
            stream_hash = JSON.parse(response_stream)
        
            return stream_hash['TextItems']['List'].length                
        
          rescue Exception=>e
            print e
          end
        end
    
      end
    end
    
  end
end
