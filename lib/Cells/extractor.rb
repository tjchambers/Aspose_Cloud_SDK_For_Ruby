module Aspose
  module Cloud
    module Cells
      class Extractor
        def initialize filename
          @filename = filename
        end
    
        # saves a specific picture from a specific sheet as image
        # @param worksheet_name
        # @param picture_index
        # @param image_format
        def get_picture worksheet_name, picture_index, image_format
          begin
            if @filename==''
              raise 'Base file name is not specified'
            end
            str_uri = $product_uri + '/cells/' + @filename + '/worksheets/' + 
              worksheet_name.to_s + '/pictures/' + picture_index.to_s + '?format=' + image_format.to_s
			
            #Sign URI
            signed_uri = Aspose::Cloud::Common::Utils.sign(str_uri)

            #Send request and receive response stream
            response_stream = ::RestClient.get signed_uri, {:accept=>'application/json'}

            #Validate output
            v_output = Aspose::Cloud::Common::Utils.validate_output(response_stream)
 
            if v_output == ''
              #Save output file
              output_path = $out_put_location + Aspose::Cloud::Common::Utils.get_filename(@filename)+ 
                '_' + worksheet_name + '.' + image_format
              Aspose::Cloud::Common::Utils.save_file(response_stream, output_path)
              return output_path
            else 
              return v_output
            end
          rescue Exception=>e
            print e
          end
        end
    
        # saves a specific OleObject from a specific sheet as image
        # @param worksheet_name
        # @param object_index
        # @param image_format
    
        def get_ole_object worksheet_name, object_index, image_format
          begin
            if @filename==''
              raise 'Base file name is not specified'
            end
            str_uri = $product_uri + '/cells/' + @filename + '/worksheets/' + 
              worksheet_name.to_s + '/oleobjects/' + object_index.to_s + '?format=' + image_format.to_s
			
            #Sign URI
            signed_uri = Aspose::Cloud::Common::Utils.sign(str_uri)

            #Send request and receive response stream
            response_stream = ::RestClient.get signed_uri, {:accept=>'application/json'}

            #Validate output
            v_output = Aspose::Cloud::Common::Utils.validate_output(response_stream)
 
            if v_output == ''
              #Save output file
              output_path = $out_put_location + Aspose::Cloud::Common::Utils.get_filename(@filename)+ 
                '_' + worksheet_name + '.' + image_format
              Aspose::Cloud::Common::Utils.save_file(response_stream, output_path)
              return output_path
            else 
              return v_output
            end
          rescue Exception=>e
            print e
          end
        end
    
        # saves a specific chart from a specific sheet as image
        # @param worksheet_name
        # @param chart_index
        # @param image_format
    
        def get_chart worksheet_name, chart_index, image_format
          begin
            if @filename==''
              raise 'Base file name is not specified'
            end
            str_uri = $product_uri + '/cells/' + @filename + '/worksheets/' + 
              worksheet_name.to_s + '/charts/' + chart_index.to_s + '?format=' + image_format.to_s
			
            #Sign URI
            signed_uri = Aspose::Cloud::Common::Utils.sign(str_uri)

            #Send request and receive response stream
            response_stream = ::RestClient.get signed_uri, {:accept=>'application/json'}

            #Validate output
            v_output = Aspose::Cloud::Common::Utils.validate_output(response_stream)
 
            if v_output == ''
              #Save output file
              output_path = $out_put_location + Aspose::Cloud::Common::Utils.get_filename(@filename)+ 
                '_' + worksheet_name + '.' + image_format
              Aspose::Cloud::Common::Utils.save_file(response_stream, output_path)
              return output_path
            else 
              return v_output
            end
          rescue Exception=>e
            print e
          end
        end
    
        #saves a specific auto-shape from a specific sheet as image
        # @param worksheet_name
        # @param shape_index
        # @param image_format
    
        def get_auto_shape worksheet_name, shape_index, image_format
          begin
            if @filename==''
              raise 'Base file name is not specified'
            end
            str_uri = $product_uri + '/cells/' + @filename + '/worksheets/' + 
              worksheet_name.to_s + '/autoshapes/' + shape_index.to_s + '?format=' + image_format.to_s
			
            #Sign URI
            signed_uri = Aspose::Cloud::Common::Utils.sign(str_uri)

            #Send request and receive response stream
            response_stream = ::RestClient.get signed_uri, {:accept=>'application/json'}

            #Validate output
            v_output = Aspose::Cloud::Common::Utils.validate_output(response_stream)
 
            if v_output == ''
              #Save output file
              output_path = $out_put_location + Aspose::Cloud::Common::Utils.get_filename(@filename)+ 
                '_' + worksheet_name + '.' + image_format
              Aspose::Cloud::Common::Utils.save_file(response_stream, output_path)
              return output_path
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