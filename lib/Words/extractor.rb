# To change this template, choose Tools | Templates
# and open the template in the editor.
module Aspose
  module Cloud
    module Words
      class Extractor
        def initialize filename
          @filename = filename
          raise 'Base file not specified.' if @filename.empty?
        end

=begin
   Gets Text items list from document
=end

        def get_text

          begin
            str_uri = $product_uri + '/words/' + @filename + '/textItems'
            signed_str_uri = Aspose::Cloud::Common::Utils.sign(str_uri)

            response_stream = RestClient.get(signed_str_uri, {:accept => 'application/json'})

            stream_hash = JSON.parse(response_stream)
        
            if(stream_hash['Code'] == 200)
              return stream_hash['TextItems']['List']
            else
              return false
            end

          rescue Exception => e
            print e
          end

        end

=begin
   Get the OLE drawing object from document
   @param number index
   @param string ole_format
=end

        def get_ole_data index, ole_format

          begin

            if index == ''
              raise 'Index not specified.'
            end

            if ole_format == ''
              raise 'OLE Format not specified.'
            end

            str_uri = $product_uri + '/words/' + @filename + '/drawingObjects/' + index.to_s + '/oleData'
            signed_str_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
            response_stream = RestClient.get(signed_str_uri, {:accept => 'application/json'})

            valid_output = Aspose::Cloud::Common::Utils.validate_output(response_stream)
        
            if valid_output == ''                    
          
              output_path = $out_put_location + Aspose::Cloud::Common::Utils.get_filename(@filename) + '_' + index.to_s + '.' + ole_format
              Aspose::Cloud::Common::Utils.save_file(response_stream, output_path)
              return output_path
            else
              return valid_output
            end

          rescue Exception => e
            print e
          end

        end

=begin
   Get the Image drawing object from document
   @param number index
   @param string render_format
=end

        def get_image_data index, render_format

          begin

            if index == ''
              raise 'Index not specified.'
            end

            if render_format == ''
              raise 'Render Format not specified.'
            end

            str_uri = $product_uri + '/words/' + @filename + '/drawingObjects/' + index.to_s + '/imagedata'
            signed_str_uri = Aspose::Cloud::Common::Utils.sign(str_uri)

            response_stream = RestClient.get(signed_str_uri, {:accept => 'application/json'})

            valid_output = Aspose::Cloud::Common::Utils.validate_output(response_stream)
        
            if valid_output == ''                    
          
              output_path = $out_put_location + Aspose::Cloud::Common::Utils.get_filename(@filename) + '_' + index.to_s + '.' + render_format
              Aspose::Cloud::Common::Utils.save_file(response_stream, output_path)
              return output_path
            else
              return valid_output
            end

          rescue Exception => e
            print e
          end

        end

=begin
   Convert drawing object to image
   @param number index
   @param string render_format
=end

        def convert_drawing_object index, render_format

          begin

            if index == ''
              raise 'Index not specified.'
            end

            if render_format == ''
              raise 'Render Format not specified.'
            end

            str_uri = $product_uri + '/words/' + @filename + '/drawingObjects/' + index.to_s + '?format=' + render_format
            signed_str_uri = Aspose::Cloud::Common::Utils.sign(str_uri)

            response_stream = RestClient.get(signed_str_uri, {:accept => 'application/json'})

            valid_output = Aspose::Cloud::Common::Utils.validate_output(response_stream)

            if valid_output == ''

              output_path = $out_put_location + Aspose::Cloud::Common::Utils.get_filename(@filename) + '_' + index.to_s + '.' + render_format
              Aspose::Cloud::Common::Utils.save_file(response_stream, output_path)
              return output_path
            else
              return valid_output
            end

          rescue Exception => e
            print e
          end

        end

=begin
   Get the List of drawing object from document	
=end

        def get_drawing_object_list

          begin
            str_uri = $product_uri + '/words/' + @filename + '/drawingObjects'
            signed_str_uri = Aspose::Cloud::Common::Utils.sign(str_uri)

            response_stream = RestClient.get(signed_str_uri, {:accept => 'application/json'})

            stream_hash = JSON.parse(response_stream)
        
            if(stream_hash['Code'] == 200)
              return stream_hash['DrawingObjects']['List']
            else
              return false
            end

          rescue Exception => e
            print e
          end

        end

=begin
   Get the drawing object from document	
   @param string object_uri
   @param string output_path
=end

        def get_drawing_object object_uri, output_path

          begin

            if object_uri == ''
              raise 'Object URI not specified.'
            end

            if output_path == ''
              raise 'Output path not specified.'
            end

            url_arr = object_uri.split('/')
            object_index = url_arr.at(-1)

            str_uri = object_uri
            signed_str_uri = Aspose::Cloud::Common::Utils.sign(str_uri)

            response_stream = RestClient.get(signed_str_uri, {:accept => 'application/json'})

            stream_hash = JSON.parse(response_stream)
        
            if(stream_hash['Code'] == 200)
          
              if stream_hash['DrawingObject']['ImageDataLink'] != ''
                str_uri = str_uri + '/imageData'
                output_path = output_path + '\\DrawingObject_' + object_index.to_s + '.jpeg'
              elsif stream_hash['DrawingObject']['OLEDataLink'] != ''
                str_uri = str_uri + '/oleData'
                output_path = output_path + '\\DrawingObject_' + object_index.to_s + '.xlsx'
              else
                str_uri = str_uri + '?format=jpeg'
                output_path = output_path + '\\DrawingObject_' + object_index.to_s + '.jpeg'
              end
          
              signed_str_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
              response_stream = RestClient.get(signed_str_uri,{:accept=>'application/json'})
              valid_output = Aspose::Cloud::Common::Utils.validate_output(response_stream)
          
              if valid_output == ''                    

                #            output_path = $out_put_location + Aspose::Cloud::Common::Utils.get_filename(@filename) + '_' + index.to_s + '.' + render_format
                Aspose::Cloud::Common::Utils.save_file(response_stream,output_path)
                return output_path
              else
                return valid_output
              end

            else
              return false
            end

          rescue Exception => e
            print e
          end

        end

=begin
   Get the List of drawing object from document
   @param string output_path
=end

        def get_drawing_objects output_path

          begin

            if output_path == ''
              raise 'Output path not specified.'
            end

            str_uri = $product_uri + '/words/' + @filename + '/drawingObjects'
            signed_str_uri = Aspose::Cloud::Common::Utils.sign(str_uri)

            response_stream = RestClient.get(signed_str_uri, {:accept => 'application/json'})

            stream_hash = JSON.parse(response_stream)
        
            if(stream_hash['Code'] == 200)
          
              stream_hash['DrawingObjects']['List'].each { |object| 
          
                self.get_drawing_object(object['link']['Href'], output_path)
            
              }
          
            else
              return false
            end

          rescue Exception => e
            print e
          end

        end

      end
    end

  end
end
