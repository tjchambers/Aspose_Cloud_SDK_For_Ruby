module Aspose
  module Cloud
    module Cells
      # This class provides functionality for converting Excel Spreadsheets to other supported formats.
      class Convertor
        # Constructor for the Convertor Class.
        # * :name represents the name of the Excel Spreadsheet on the Aspose server 		
        def initialize()
          
        end
        def initialize filename
          @filename = filename
        end
        def initialize filename,worksheet_name
          # Instance variables   
          @filename = filename
          @worksheet_name = worksheet_name
        end
        # Converts the file available at Aspose Storage and saves converted file locally.
        # * :localFile represents converted local file path and name
        # * :saveFormat represents the converted format. For a list of supported formats, please visit 
        #  http://aspose.com/docs/display/cells/workbook		 
        def convert local_file,save_format
          begin
            if @filename == ''
              raise 'Base file is not specified'
            end  
            url_doc = $product_uri + '/cells/' + @filename + '?format=' + save_format
            signed_url = Aspose::Cloud::Common::Utils.sign(url_doc)
            response = RestClient.get(signed_url, :accept => 'application/json')
            validate_output = Aspose::Cloud::Common::Utils.validate_output(response)
            if validate_output!=nil || validate_output!=''
              output = $out_put_location + local_file + '.' + save_format
              Aspose::Cloud::Common::Utils.save_file(response, output)
              return output
            else
              return validate_output
            end
          rescue Exception=>e
            print e
          end
        end
        
        def convert_to_image image_format,worksheet_name
          begin
            if @filename == ''
              raise 'Base File is not specified.'
            end
            str_uri = $product_uri + '/cells/' + @filename + '/worksheets/' + worksheet_name.to_s + '?format=' + image_format.to_s
            signed_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
            response = RestClient.get(signed_uri,:accept => 'application/json')
            validate_output = Aspose::Cloud::Common::Utils.validate_output(response)
            if validate_output!=nil || validate_output!=''
              output = $out_put_location + worksheet_name + '.' + image_format
              Aspose::Cloud::Common::Utils.save_file(response, output);
              return output
            else
              return validate_output
            end
            
          rescue Exception=>e
            print e
          end
        end
        
        def save output_format
          begin
            if @filename==''
              raise 'Base File is not specified.'
            end
            str_uri = $product_uri + '/cells/' + @filename + '?format=' + output_format.to_s
            signed_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
            response = RestClient.get(signed_uri,:accept => 'application/json')
            validate_output = Aspose::Cloud::Common::Utils.validate_output(response)
            if validate_output==nil || validate_output==''
              output = $out_put_location + Aspose::Cloud::Common::Utils.get_filename(@filename) + '.' + output_format
              Aspose::Cloud::Common::Utils.save_file(response, output);
              return output
            else
              return validate_output
            end
            
            
          rescue Exception=>e
            print e
          end
        end
        
        def worksheet_to_image image_format
          begin
            if @filename==''
              raise 'Base file name is not specified.'
            end
            if @worksheet_name == ''
              raise 'Worksheet is not specified'
            end
            str_uri = $product_uri + '/cells/' + @filename + '/worksheets/' + 
              @worksheet_name + '?format=' + image_format.to_s
            signed_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
            response = RestClient.get(signed_uri,:accept => 'application/json')
            v_output = Aspose::Cloud::Common::Utils.validate_output(response)
            if v_output==nil || v_output==''
              outputpath=$out_put_location + Aspose::Cloud::Common::Utils.get_filename(@filename) + '_' + @worksheet_name + '.' + image_format
              Aspose::Cloud::Common::Utils.save_file(response, outputpath)
              return outputpath
            else
              return v_output
            end
          rescue Exception=>e
            print e
          end
          
        end
        
        def picture_to_image picture_index,image_format
          begin
            if @filename==''
              raise 'Base File is not specified'
            end
            if @worksheet_name==''
              raise 'Worksheet is not specified'
            end
            str_uri = $product_uri + '/cells/' + @filename + '/worksheets/' + 
              @worksheet_name + '/pictures/' + picture_index.to_s + '?format=' + image_format.to_s;
            signed_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
          
            response = RestClient.get(signed_uri, :accept => 'application/json')
              
            v_output = Aspose::Cloud::Common::Utils.validate_output(response)
            if v_output==nil || v_output==''
              outputpath=$out_put_location + Aspose::Cloud::Common::Utils.get_filename(@filename) + '_' + @worksheet_name + '.' + image_format
              Aspose::Cloud::Common::Utils.save_file(response, outputpath)
              return outputpath
            else
              return v_output
            end
          rescue Exception=>e
            print e
          end
        end
        
        def oleobject_to_image object_index,image_format
          begin
            if @filename==''
              raise 'Base File is not specified'
            end
            if @worksheet_name==''
              raise 'Worksheet is not specified'
            end
            str_uri = $product_uri + '/cells/' + @filename + '/worksheets/' + 
              @worksheet_name + '/oleobjects/' + object_index.to_s + '?format=' + image_format.to_s;
            signed_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
            response = RestClient.get(signed_uri, :accept => 'application/json')
              
            v_output = Aspose::Cloud::Common::Utils.validate_output(response)
            if v_output==nil || v_output==''
              outputpath=$out_put_location + Aspose::Cloud::Common::Utils.get_filename(@filename) + '_' + @worksheet_name + '.' + image_format
              Aspose::Cloud::Common::Utils.save_file(response, outputpath)
              return outputpath
            else
              return v_output
            end
          rescue Exception=>e
            print e
          end
        end
        
        def chart_to_image chart_index,image_format
          begin
            if @filename==''
              raise 'Base File is not specified'
            end
            if @worksheet_name==''
              raise 'Worksheet is not specified'
            end
            str_uri = $product_uri + '/cells/' + @filename + '/worksheets/' + 
              @worksheet_name + '/charts/' + chart_index.to_s + '?format=' + image_format.to_s;
            signed_uri = Aspose::Cloud::Common::Utils.sign(str_uri)

            response = RestClient.get(signed_uri, :accept => 'application/json')
              
            v_output = Aspose::Cloud::Common::Utils.validate_output(response)
            if v_output==nil || v_output==''
              outputpath=$out_put_location + Aspose::Cloud::Common::Utils.get_filename(@filename) + '_' + @worksheet_name + '.' + image_format
              Aspose::Cloud::Common::Utils.save_file(response, outputpath)
              return outputpath
            else
              return v_output
            end
          rescue Exception=>e
            print e
          end
        end
        
        def autoshape_to_image shape_index,image_format
          begin
            if @filename==''
              raise 'Base File is not specified'
            end
            if @worksheet_name==''
              raise 'Worksheet is not specified'
            end
            str_uri = $product_uri + '/cells/' + @filename + '/worksheets/' + 
              @worksheet_name + '/autoshapes/' + shape_index.to_s + '?format=' + image_format.to_s;
            signed_uri = Aspose::Cloud::Common::Utils.sign(str_uri)

            response = RestClient.get(signed_uri, :accept => 'application/json')
              
            v_output = Aspose::Cloud::Common::Utils.validate_output(response)
            if v_output==nil || v_output==''
              outputpath=$out_put_location + Aspose::Cloud::Common::Utils.get_filename(@filename) + '_' + @worksheet_name + '.' + image_format
              Aspose::Cloud::Common::Utils.save_file(response, outputpath)
              return outputpath
            else
              return v_output
            end
          rescue Exception=>e
            print e
          end
        end
      end  
    end
    
  end
end