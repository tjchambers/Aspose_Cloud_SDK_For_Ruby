module Aspose
  module Cloud
    module Cells
      # This class contains features to work with charts
      class ChartEditor
        def initialize filename,worksheet_name
          @filename = filename
          @worksheet_name = worksheet_name
        end
    
        # Adds a new chart 
        # chartType
        # upperLeftRow
        # upperLeftColumn
        # lowerRightRow
        # lowerRightColumn
    
        def add_chart chart_type, upper_left_row, upper_left_column, lower_right_row, lower_right_column
          begin
            if @filename==''
              raise 'Base file not specified'
            end
            if @worksheet_name==''
              raise 'Worksheet is not specified'
            end
            str_uri = $product_uri + '/cells/' + @filename + '/worksheets/' + @worksheet_name + '/charts?chartType=' +
              chart_type.to_s + '&upperLeftRow=' + upper_left_row.to_s + '&upperLeftColumn=' +
              upper_left_column.to_s + '&lowerRightRow=' + lower_right_row.to_s + 
              '&lowerRightColumn=' + lower_right_column.to_s
            signed_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
          
            response = ::RestClient.put signed_uri,'', {:accept => 'application/json'}
            v_output = Aspose::Cloud::Common::Utils.validate_output(response)
            if v_output==nil || v_output==''
              folder = Aspose::Cloud::AsposeStorage::Folder.new
              outputstream = folder.get_file(@filename)              
              outputpath = $out_put_location + @filename
              Aspose::Cloud::Common::Utils.save_file(outputstream, outputpath)
              return 'Chart added'
            else
              return v_output
            end
          rescue Exception=>e
            print e
          end
        end
    
        # Deletes a chart 
        # chart_index
    
        def delete_chart chart_index
          begin
            if @filename==''
              raise 'Base file not specified'
            end
            if @worksheet_name==''
              raise 'Worksheet is not specified'
            end
            str_uri = $product_uri + '/cells/' + @filename + '/worksheets/' + @worksheet_name + '/charts/' + chart_index.to_s
            signed_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
          
            response = ::RestClient.delete signed_uri, {:accept => 'application/json'}
            v_output = Aspose::Cloud::Common::Utils.validate_output(response)
            if v_output==nil || v_output==''
              folder = Aspose::Cloud::AsposeStorage::Folder.new
              outputstream = folder.get_file(@filename)              
              outputpath = $out_put_location + @filename
              Aspose::Cloud::Common::Utils.save_file(outputstream, outputpath)
              return 'Chart deleted'
            else
              return v_output
            end
          rescue Exception=>e
            print e
          end
        end
    
        # Gets ChartArea of a chart 
        # chart_index
     
        def get_chart_area chart_index
          begin
            if @filename==''
              raise 'Base file not specified'
            end
            if @worksheet_name==''
              raise 'Worksheet is not specified'
            end
            str_uri = $product_uri + '/cells/' + @filename + '/worksheets/' + @worksheet_name + '/charts/' + chart_index.to_s + '/chartArea'
            signed_uri = Aspose::Cloud::Common::Utils.sign(str_uri)         
            response = ::RestClient.get signed_uri, {:accept => 'application/json'}
            json = JSON.parse(response)
            return json['ChartArea']
          rescue Exception=>e
            print e
          end
        end
    
        # Gets fill format of the ChartArea of a chart 
        # chart_index
    
        def get_fill_format chart_index
          begin
            if @filename==''
              raise 'Base file not specified'
            end
            if @worksheet_name==''
              raise 'Worksheet is not specified'
            end
            str_uri = $product_uri + '/cells/' + @filename + '/worksheets/' + @worksheet_name + '/charts/' + chart_index.to_s + '/chartArea/fillFormat'
            signed_uri = Aspose::Cloud::Common::Utils.sign(str_uri)    
            response = ::RestClient.get signed_uri, {:accept => 'application/json'}
            json = JSON.parse(response)
            return json['FillFormat']
          rescue Exception=>e
            print e
          end
        end
    
        # Gets border of the ChartArea of a chart 
        # chart_index
	
        def get_border chart_index
          begin
            if @filename==''
              raise 'Base file not specified'
            end
            if @worksheet_name==''
              raise 'Worksheet is not specified'
            end
            str_uri = $product_uri + '/cells/' + @filename + '/worksheets/' + @worksheet_name + '/charts/' + chart_index.to_s + '/chartArea/border'
            signed_uri = Aspose::Cloud::Common::Utils.sign(str_uri)        
            response = ::RestClient.get signed_uri, {:accept => 'application/json'}
            json = JSON.parse(response)
            return json['Line']
          rescue Exception=>e
            print e
          end
        end
      end
    end

    
  end
end