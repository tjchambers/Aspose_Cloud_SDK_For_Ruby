module Aspose
  module Cloud
    module Cells
      class TextEditor
        def initialize filename
          @filename = filename
        end
    
        def find_text text
          begin
            if @filename == ''
              raise 'Base File Name is not Specified.'
            end
            str_uri = $product_uri + '/cells/' + @filename + '/findText?text=' + text.to_s
            signed_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
            response = RestClient.post signed_uri, '' , {:accept => 'application/json'}
            json = JSON.parse(response)
            return json['TextItems']['TextItemList']
          rescue Exception=>e
            print e
          end
        end
        def find_text_in_worksheet worksheet_name,text
          begin
            if @filename == ''
              raise 'Base File Name is not Specified.'
            end
            str_uri = $product_uri + '/cells/' + @filename + '/worksheets/' + worksheet_name.to_s +  '/findText?text=' + text.to_s
            signed_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
            response = RestClient.post signed_uri, '' , {:accept => 'application/json'}
            json = JSON.parse(response)
            return json['TextItems']['TextItemList']
          rescue Exception=>e
            print e
          end
        end
    
        def get_text_items worksheet_name
          begin
            if @filename == ''
              raise 'Base File Name is not Specified.'
            end
            str_uri = $product_uri + '/cells/' + @filename + '/worksheets/' + worksheet_name.to_s +  '/textItems' 
            signed_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
            response = RestClient.get signed_uri, {:accept => 'application/json'}
            json = JSON.parse(response)
            return json['TextItems']['TextItemList']
          rescue Exception=>e
            print e
          end
        end
    
        def replace_text old_text,new_text
          begin
            if @filename == ''
              raise 'Base File Name is not Specified.'
            end
            str_uri = $product_uri + '/cells/' + @filename + '/replaceText?oldValue=' + old_text.to_s + '&newValue=' + new_text.to_s 
            signed_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
            response = RestClient.post signed_uri,'', {:accept => 'application/json'}
            v_output = Aspose::Cloud::Common::Utils.validate_output(response)
            if v_output==nil || v_output==''
              # Save doc on server
              folder = Aspose::Cloud::AsposeStorage::Folder.new
              output_stream = folder.get_file(@filename);
              output_path = $out_put_location + @filename;
              Aspose::Cloud::Common::Utils.save_file(output_stream, output_path);
              return 'Value is changed';
            end
          rescue Exception=>e
            print e
          end
        end
    
        def replace_text_in_worksheet worksheet_name, old_text, new_text
          begin
            if(@filename == '')
              raise 'Base File Name is not Specified.'
            end
            str_uri = $product_uri + '/cells/' + @filename + '/worksheets/' + worksheet_name.to_s + '/replaceText?oldValue=' + old_text.to_s + '&newValue=' + new_text.to_s 
            signed_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
            response = RestClient.post signed_uri,'', {:accept => 'application/json'}
            v_output = Aspose::Cloud::Common::Utils.validate_output(response)
            if v_output==nil || v_output==''
              # Save doc on server
              folder = Aspose::Cloud::AsposeStorage::Folder.new
              output_stream = folder.get_file(@filename);
              output_path = $out_put_location + @filename;
              Aspose::Cloud::Common::Utils.save_file(output_stream, output_path);
              return 'Value is changed';
            end
          rescue Exception=>e
            print e
          end
        end
      end
    end
  end
end