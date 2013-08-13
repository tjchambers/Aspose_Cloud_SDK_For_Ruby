module Aspose
  module Cloud

    module Cells
      class Worksheet
        def initialize(filename,worksheet_name)
          @filename = filename
          @worksheet_name = worksheet_name
        end
    
        def get_cells_list(offset,count)
          begin
            if(@filename == '')
              raise 'Base File Name is not specified'
            end
            if(@worksheet_name == '')
              raise 'Worksheet Name is not specified'
            end
            str_uri = $product_uri + '/cells/' + @filename + '/worksheets/' + @worksheet_name 
            str_uri += '/cells?offset=' + offset.to_s + '&count=' + count.to_s
            signed_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
            response = RestClient.get(signed_uri, :accept => 'application/json' )
            json = JSON.parse(response)
            return json['Cells']['CellList']
                      
          rescue Exception=>e
            print e
          end
        end
    
        def get_row_list(offset,count)
          begin
            if(@filename == '')
              raise 'Base File Name is not specified'
            end
            if(@worksheet_name == '')
              raise 'Worksheet Name is not specified'
            end
            str_uri = $product_uri + '/cells/' + @filename + '/worksheets/' + @worksheet_name 
            str_uri += '/cells/rows?offset=' + offset.to_s + '&count=' + count.to_s
            signed_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
            response = RestClient.get(signed_uri, :accept => 'application/json' )
            json = JSON.parse(response)
            return json['Rows']['RowsList']
                      
          rescue Exception=>e
            print e
          end
        end
    
        def get_columns_list(offset,count)
          begin
            if(@filename == '')
              raise 'Base File Name is not specified'
            end
            if(@worksheet_name == '')
              raise 'Worksheet Name is not specified'
            end
            str_uri = $product_uri + '/cells/' + @filename + '/worksheets/' + @worksheet_name 
            str_uri += '/cells/columns?offset=' + offset.to_s + '&count=' + count.to_s
            signed_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
            response = RestClient.get(signed_uri, :accept => 'application/json' )
            json = JSON.parse(response)
            return json['Columns']['ColumnsList']
                      
          rescue Exception=>e
            print e
          end
        end
    
        def get_max_columns(offset,count)
          begin
            if(@filename == '')
              raise 'Base File Name is not specified'
            end
            if(@worksheet_name == '')
              raise 'Worksheet Name is not specified'
            end
            str_uri = $product_uri + '/cells/' + @filename + '/worksheets/' + @worksheet_name 
            str_uri += '/cells?offset=' + offset.to_s + '&count=' + count.to_s
            signed_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
            response = RestClient.get(signed_uri, :accept => 'application/json' )
            json = JSON.parse(response)
            return json['Cells']['MaxColumn']
                      
          rescue Exception=>e
            print e
            return 0
          end
        end
        def get_max_row(offset,count)
          begin
            if(@filename == '')
              raise 'Base File Name is not specified'
            end
            if(@worksheet_name == '')
              raise 'Worksheet Name is not specified'
            end
            str_uri = $product_uri + '/cells/' + @filename + '/worksheets/' + @worksheet_name 
            str_uri += '/cells?offset=' + offset.to_s + '&count=' + count.to_s
            signed_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
            response = RestClient.get(signed_uri, :accept => 'application/json' )
            json = JSON.parse(response)
            return json['Cells']['MaxRow']
                      
          rescue Exception=>e
            print e
            return 0
          end
        end
    
        def get_cells_count(offset,count)
          begin
            if(@filename == '')
              raise 'Base File Name is not specified'
            end
            if(@worksheet_name == '')
              raise 'Worksheet Name is not specified'
            end
            str_uri = $product_uri + '/cells/' + @filename + '/worksheets/' + @worksheet_name 
            str_uri += '/cells?offset=' + offset.to_s + '&count=' + count.to_s
            signed_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
            response = RestClient.get(signed_uri, :accept => 'application/json' )
            json = JSON.parse(response)
            return json['Cells']['CellCount']
                      
          rescue Exception=>e
            print e
            return 0
          end
        end
    
        def get_auto_shapes_count
          begin
            if(@filename == '')
              raise 'Base File Name is not specified'
            end
            if(@worksheet_name == '')
              raise 'Worksheet Name is not specified'
            end
            str_uri = $product_uri + '/cells/' + @filename + '/worksheets/' + @worksheet_name + '/autoshapes'
        
            signed_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
            response = RestClient.get(signed_uri, :accept => 'application/json' )
            json = JSON.parse(response)
            return json['AutoShapes']['AuotShapeList'].count
                      
          rescue Exception=>e
            print e
            return -1
          end
        end
    
        def get_auto_shapes_by_index(index)
          begin
            if(@filename == '')
              raise 'Base File Name is not specified'
            end
            if(@worksheet_name == '')
              raise 'Worksheet Name is not specified'
            end
            str_uri = $product_uri + '/cells/' + @filename + '/worksheets/' + @worksheet_name + '/autoshapes/' + index.to_s
            signed_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
            response = RestClient.get(signed_uri, :accept => 'application/json' )
            json = JSON.parse(response)
            return json['AutoShapes']
                      
          rescue Exception=>e
            print e
            return nil
          end
        end
    
        def get_cell(cell_name)
          begin
            if(@filename == '')
              raise 'Base File Name is not specified'
            end
            if(@worksheet_name == '')
              raise 'Worksheet Name is not specified'
            end
            str_uri = $product_uri + '/cells/' + @filename + '/worksheets/' + @worksheet_name + '/cells/' + cell_name
            signed_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
            response = RestClient.get(signed_uri, :accept => 'application/json' )
            json = JSON.parse(response)
            return json['Cell']
                      
          rescue Exception=>e
            print e
            return nil
          end
        end
    
        def get_cell_style(cell_name='')
          begin
            if(@filename == '')
              raise 'Base File Name is not specified'
            end
            if(@worksheet_name == '')
              raise 'Worksheet Name is not specified'
            end
            str_uri = $product_uri + '/cells/' + @filename + '/worksheets/' + @worksheet_name + '/cells/' + cell_name + '/style'
            signed_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
            response = RestClient.get(signed_uri, :accept => 'application/json' )
            json = JSON.parse(response)
            return json['Style']
                      
          rescue Exception=>e
            print e
            return nil
          end
        end
    
        def set_cell_style(cell_name='',style)
          begin
            if(@filename == '')
              raise 'Base File Name is not specified'
            end
            if(@worksheet_name == '')
              raise 'Worksheet Name is not specified'
            end
            json_data = style.to_json
            str_uri = $product_uri + '/cells/' + @filename + '/worksheets/' + @worksheet_name + '/cells/' + cell_name + '/style'
            signed_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
            response = RestClient.post(signed_uri,json_data, :accept => 'application/json' )
            json = JSON.parse(response)
            if(json['Code'] == 200)
              return true
            else
              return false
            end
                      
          rescue Exception=>e
            print e
            return false
          end
        end
    
        def get_chart_by_index(index)
          begin
            if(@filename == '')
              raise 'Base File Name is not specified'
            end
            if(@worksheet_name == '')
              raise 'Worksheet Name is not specified'
            end
            str_uri = $product_uri + '/cells/' + @filename + '/worksheets/' + @worksheet_name + '/charts/' + index.to_s
            signed_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
            response = RestClient.get(signed_uri, :accept => 'application/json' )
            json = JSON.parse(response)
            return json['Chart']
                      
          rescue Exception=>e
            print e
            return nil
          end
        end
    
        def get_hyperlink_by_index(index)
          begin
            if(@filename == '')
              raise 'Base File Name is not specified'
            end
            if(@worksheet_name == '')
              raise 'Worksheet Name is not specified'
            end
            str_uri = $product_uri + '/cells/' + @filename + '/worksheets/' + @worksheet_name + '/hyperlinks/' + index.to_s
            signed_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
            response = RestClient.get(signed_uri, :accept => 'application/json' )
            json = JSON.parse(response)
            return json['Hyperlink']
                      
          rescue Exception=>e
            print e
            return nil
          end
        end
    
        def get_comment(cell_name='')
          begin
            if(@filename == '')
              raise 'Base File Name is not specified'
            end
            if(@worksheet_name == '')
              raise 'Worksheet Name is not specified'
            end
            str_uri = $product_uri + '/cells/' + @filename + '/worksheets/' + @worksheet_name + '/comments/' + cell_name.to_s
            signed_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
            response = RestClient.get(signed_uri, :accept => 'application/json' )
            json = JSON.parse(response)
            return json['Comment']
                      
          rescue Exception=>e
            print e
            return nil
          end
        end
    
        def get_oleobject_by_index(index)
          begin
            if(@filename == '')
              raise 'Base File Name is not specified'
            end
            if(@worksheet_name == '')
              raise 'Worksheet Name is not specified'
            end
            str_uri = $product_uri + '/cells/' + @filename + '/worksheets/' + @worksheet_name + '/oleobjects/' + index.to_s
            signed_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
            response = RestClient.get(signed_uri, :accept => 'application/json' )
            json = JSON.parse(response)
            return json['OleObject']
                      
          rescue Exception=>e
            print e
            return nil
          end
        end
        def get_picture_by_index(index)
          begin
            if(@filename == '')
              raise 'Base File Name is not specified'
            end
            if(@worksheet_name == '')
              raise 'Worksheet Name is not specified'
            end
            str_uri = $product_uri + '/cells/' + @filename + '/worksheets/' + @worksheet_name + '/pictures/' + index.to_s
            signed_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
            response = RestClient.get(signed_uri, :accept => 'application/json' )
            json = JSON.parse(response)
            return json['Picture']
                      
          rescue Exception=>e
            print e
            return nil
          end
        end
    
        def get_validation_by_index(index)
          begin
            if(@filename == '')
              raise 'Base File Name is not specified'
            end
            if(@worksheet_name == '')
              raise 'Worksheet Name is not specified'
            end
            str_uri = $product_uri + '/cells/' + @filename + '/worksheets/' + @worksheet_name + '/validations/' + index.to_s
            signed_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
            response = RestClient.get(signed_uri, :accept => 'application/json' )
            json = JSON.parse(response)
            return json['Validation']
                      
          rescue Exception=>e
            print e
            return nil
          end
        end
    
        def get_mergedcell_by_index(index)
          begin
            if(@filename == '')
              raise 'Base File Name is not specified'
            end
            if(@worksheet_name == '')
              raise 'Worksheet Name is not specified'
            end
            str_uri = $product_uri + '/cells/' + @filename + '/worksheets/' + @worksheet_name + '/mergedCells/' + index.to_s
            signed_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
            response = RestClient.get(signed_uri, :accept => 'application/json' )
            json = JSON.parse(response)
            return json['MergedCell']
                      
          rescue Exception=>e
            print e
            return nil
          end
        end
    
        def get_mergedcells_count
          begin
            if(@filename == '')
              raise 'Base File Name is not specified'
            end
            if(@worksheet_name == '')
              raise 'Worksheet Name is not specified'
            end
            str_uri = $product_uri + '/cells/' + @filename + '/worksheets/' + @worksheet_name + '/mergedCells'
            signed_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
            response = RestClient.get(signed_uri, :accept => 'application/json' )
            json = JSON.parse(response)
            return json['MergedCells']['Count']
                      
          rescue Exception=>e
            print e
            return -1
          end
        end
    
        def get_validations_count
          begin
            if(@filename == '')
              raise 'Base File Name is not specified'
            end
            if(@worksheet_name == '')
              raise 'Worksheet Name is not specified'
            end
            str_uri = $product_uri + '/cells/' + @filename + '/worksheets/' + @worksheet_name + '/validations'
            signed_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
            response = RestClient.get(signed_uri, :accept => 'application/json' )
            json = JSON.parse(response)
            return json['Validations']['Count']
                      
          rescue Exception=>e
            print e
            return -1
          end
        end
    
        def get_pictures_count
          begin
            if(@filename == '')
              raise 'Base File Name is not specified'
            end
            if(@worksheet_name == '')
              raise 'Worksheet Name is not specified'
            end
            str_uri = $product_uri + '/cells/' + @filename + '/worksheets/' + @worksheet_name + '/pictures'
            signed_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
            response = RestClient.get(signed_uri, :accept => 'application/json' )
            json = JSON.parse(response)
            return json['Pictures']['PictureList'].count
                      
          rescue Exception=>e
            print e
            return -1
          end
        end
    
        def get_oleobjects_count
          begin
            if(@filename == '')
              raise 'Base File Name is not specified'
            end
            if(@worksheet_name == '')
              raise 'Worksheet Name is not specified'
            end
            str_uri = $product_uri + '/cells/' + @filename + '/worksheets/' + @worksheet_name + '/oleobjects'
            signed_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
            response = RestClient.get(signed_uri, :accept => 'application/json' )
            json = JSON.parse(response)
            return json['OleObjects']['OleOjectList'].count
                      
          rescue Exception=>e
            print e
            return -1
          end
        end
    
        def get_charts_count
          begin
            if(@filename == '')
              raise 'Base File Name is not specified'
            end
            if(@worksheet_name == '')
              raise 'Worksheet Name is not specified'
            end
            str_uri = $product_uri + '/cells/' + @filename + '/worksheets/' + @worksheet_name + '/charts'
            signed_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
            response = RestClient.get(signed_uri, :accept => 'application/json' )
            json = JSON.parse(response)
            return json['Charts']['ChartList'].count
                      
          rescue Exception=>e
            print e
            return -1
          end
        end
    
        def get_comments_count
          begin
            if(@filename == '')
              raise 'Base File Name is not specified'
            end
            if(@worksheet_name == '')
              raise 'Worksheet Name is not specified'
            end
            str_uri = $product_uri + '/cells/' + @filename + '/worksheets/' + @worksheet_name + '/comments'
            signed_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
            response = RestClient.get(signed_uri, :accept => 'application/json' )
            json = JSON.parse(response)
            return json['Comments']['CommentList'].count
                      
          rescue Exception=>e
            print e
            return -1
          end
        end
    
        def get_hyperlinks_count
          begin
            if(@filename == '')
              raise 'Base File Name is not specified'
            end
            if(@worksheet_name == '')
              raise 'Worksheet Name is not specified'
            end
            str_uri = $product_uri + '/cells/' + @filename + '/worksheets/' + @worksheet_name + '/hyperlinks'
            signed_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
            response = RestClient.get(signed_uri, :accept => 'application/json' )
            json = JSON.parse(response)
            return json['Hyperlinks']['HyperlinkList'].count
                      
          rescue Exception=>e
            print e
            return -1
          end
        end
    
        def hide_worksheet
          begin
            if(@filename == '')
              raise 'Base File Name is not specified'
            end
            if(@worksheet_name == '')
              raise 'Worksheet Name is not specified'
            end
            str_uri = $product_uri + '/cells/' + @filename + '/worksheets/' + @worksheet_name + '/visible?isVisible=false'
            signed_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
            response = RestClient.put(signed_uri, '',:accept => 'application/json' )
            json = JSON.parse(response)
            if(json['Code']==200)
              return true
            else
              return false
            end
                      
          rescue Exception=>e
            print e
            return false
          end
        end
    
        def unhide_worksheet
          begin
            if(@filename == '')
              raise 'Base File Name is not specified'
            end
            if(@worksheet_name == '')
              raise 'Worksheet Name is not specified'
            end
            str_uri = $product_uri + '/cells/' + @filename + '/worksheets/' + @worksheet_name + '/visible?isVisible=true'
            signed_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
            response = RestClient.put(signed_uri, '',:accept => 'application/json' )
            json = JSON.parse(response)
            if(json['Code']==200)
              return true
            else
              return false
            end
                      
          rescue Exception=>e
            print e
            return false
          end
        end
    
        def move_worksheet(worksheet_name = '',position)
          begin
            if(@filename == '')
              raise 'Base File Name is not specified'
            end
            if(@worksheet_name == '')
              raise 'Worksheet Name is not specified'
            end
            field_array = Hash.new
            field_array['DestinationWorsheet'] = worksheet_name.to_s
            field_array['Position'] = position.to_s
            json_data = field_array.to_json
            str_uri = $product_uri + '/cells/' + @filename + '/worksheets/' + @worksheet_name + '/position'
            signed_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
            response = RestClient.post(signed_uri, json_data,:accept => 'application/json' )
            json = JSON.parse(response)
            if(json['Code']==200)
              return true
            else
              return false
            end
                      
          rescue Exception=>e
            print e
            return false
          end
        end
    
        def calculate_formula(formula = '')
          begin
            if(@filename == '')
              raise 'Base File Name is not specified'
            end
            if(@worksheet_name == '')
              raise 'Worksheet Name is not specified'
            end
            str_uri = $product_uri + '/cells/' + @filename + '/worksheets/' + @worksheet_name + '/formulaResult?formula=' + formula.to_s
            signed_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
            response = RestClient.get(signed_uri, :accept => 'application/json' )
            json = JSON.parse(response)
            return json['Value']
                      
          rescue Exception=>e
            print e
            return nil
          end
        end
    
        def set_cell_value(cell_name='',value_type='',value='')
          begin
            if(@filename == '')
              raise 'Base File Name is not specified'
            end
            if(@worksheet_name == '')
              raise 'Worksheet Name is not specified'
            end
            str_uri = $product_uri + '/cells/' + @filename + '/worksheets/' + @worksheet_name 
            str_uri += '/cells/' + cell_name.to_s + '?value=' + value.to_s + '&type=' + value_type.to_s
            signed_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
            response = RestClient.post(signed_uri,'' ,:accept => 'application/json' )
            json = JSON.parse(response)
            if(json['Code']==200)
              return true
            else 
              return false
            end
                      
          rescue Exception=>e
            print e
            return false
          end
        end
    
        def get_rows_count(offset,count)
          begin
            if(@filename == '')
              raise 'Base File Name is not specified'
            end
            if(@worksheet_name == '')
              raise 'Worksheet Name is not specified'
            end
            str_uri = $product_uri + '/cells/' + @filename + '/worksheets/' + @worksheet_name 
            str_uri += '/cells/rows?offset=' + offset.to_s + '&count=' + count.to_s
            signed_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
            response = RestClient.get(signed_uri,:accept => 'application/json' )
            json = JSON.parse(response)
            return json['Rows']['RowsCount']
                      
          rescue Exception=>e
            print e
            return -1
          end
        end
    
        def get_rows(row_index)
          begin
            if(@filename == '')
              raise 'Base File Name is not specified'
            end
            if(@worksheet_name == '')
              raise 'Worksheet Name is not specified'
            end
            str_uri = $product_uri + '/cells/' + @filename + '/worksheets/' + @worksheet_name + '/cells/rows/' + row_index.to_s

            signed_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
            response = RestClient.get(signed_uri,:accept => 'application/json' )
            json = JSON.parse(response)
            return json['Row']
                      
          rescue Exception=>e
            print e
            return nil
          end
        end
    
        def delete_row(row_index)
          begin
            if(@filename == '')
              raise 'Base File Name is not specified'
            end
            if(@worksheet_name == '')
              raise 'Worksheet Name is not specified'
            end
            str_uri = $product_uri + '/cells/' + @filename + '/worksheets/' + @worksheet_name + '/cells/rows/' + row_index.to_s
            signed_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
            response = RestClient.delete(signed_uri,:accept => 'application/json' )
            json = JSON.parse(response)
            if(json['Code']==200)
              return true
            else
              return false
            end
                      
          rescue Exception=>e
            print e
            return false
          end
        end
    
        def sort_data(data_sort,cell_area = '')
          begin
            if(@filename == '')
              raise 'Base File Name is not specified'
            end
            if(@worksheet_name == '')
              raise 'Worksheet Name is not specified'
            end
            str_uri = $product_uri + '/cells/' + @filename + '/worksheets/' + @worksheet_name + '/sort?' + cell_area.to_s
            json_data = data_sort.to_json
            signed_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
            response = RestClient.post(signed_uri,json_data,:accept => 'application/json' )
            json = JSON.parse(response)
            if(json['Code']==200)
              return true
            else
              return false
            end
                      
          rescue Exception=>e
            print e
            return false
          end
        end
    
        def get_column(column_index)
          begin
            if(@filename == '')
              raise 'Base File Name is not specified'
            end
            if(@worksheet_name == '')
              raise 'Worksheet Name is not specified'
            end
            str_uri = $product_uri + '/cells/' + @filename + '/worksheets/' + @worksheet_name + '/cells/columns/' + column_index.to_s
            signed_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
            response = RestClient.get(signed_uri,:accept => 'application/json' )
            json = JSON.parse(response)
            return json['Column']                    
          rescue Exception=>e
            print e
            return false
          end
        end
        def get_cell(cell_name)
          begin
            if(@filename=='')
              raise 'Base File Name is not specified'
            end
            if(@worksheet_name=='')
              raise 'Worksheet Name is not specified'
            end
            str_uri = $product_uri + '/cells/' + @filename + '/worksheets/' + @worksheet_name + '/cells/' + cell_name
            signed_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
            response = RestClient.get(signed_uri, :accept=>'application/json')
            json = JSON.parse(response)
            return json['Cell']
          rescue Exception=>e
            print e
            return false
          end
        end
        def get_cell_style(cell_name)
          begin
            if(@filename=='')
              raise 'Base File Name is not specified'
            end
            if(@worksheet_name=='')
              raise 'Worksheet Name is not specified'
            end
            str_uri = $product_uri+'/cells/' + @filename + '/worksheets/' + @worksheet_name + '/cells/' + cell_name + '/style'
            signed_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
            response = RestClient.get(signed_uri, :accept => 'application/json')
            json = JSON.parse(response)
            return json['Style']
          rescue Exception => e
            print e
          end
        end
    
        def add_picture(picture_path,picture_location, upper_left_row, upper_left_column, lower_right_row, lower_right_column)
          begin
            if(@filename=='')
              raise 'Base File Name is not specified'
            end
            if(@worksheet_name=='')
              raise 'Worksheet Name is not specified'
            end
            if(picture_location == 'Server' || picture_location == 'server')
              str_uri = $product_uri + '/cells/' + @filename + '/worksheets/' + @worksheet_name + '/pictures?upperLeftRow=' +upper_left_row.to_s + '&upperLeftColumn=' + upper_left_column.to_s + '&lowerRightRow=' +lower_right_row.to_s + '&lowerRightColumn=' + lower_right_column.to_s + '&picturePath=' + picture_path
              signed_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
              response = RestClient.put(signed_uri, :accept=>'application/json')
            else
              if(!File.exist?(picture_path))
                raise "File doesn't exists"
              end
              str_uri = $product_uri + '/cells/' + @filename + '/worksheets/' + @worksheet_name + '/pictures?upperLeftRow=' +upper_left_row.to_s + '&upperLeftColumn=' + upper_left_column.to_s + '&lowerRightRow=' +lower_right_row.to_s + '&lowerRightColumn=' + lower_right_column.to_s 
              stream = File.new(picture_path,'rb')
              signed_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
              response = RestClient.put(signed_uri,stream, :accept=>'application/json')
            end
            json = JSON.parse(response)
            if(json['Code'] == 200)
              return true
            else
              return false
            end
          rescue Exception=>e
            print e
          end
      
        end
      end
    end
  end
end