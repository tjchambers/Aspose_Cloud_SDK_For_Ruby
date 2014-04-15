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

            response_stream = ::RestClient.get(signed_str_uri, {:accept => 'application/json'})

            stream_hash = JSON.parse(response_stream)
            stream_hash['Code'] == 200 ? stream_hash['TextItems']['List'] : false

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

          raise 'Index not specified.' if index.blank?
          raise 'OLE Format not specified.' if ole_format.blank?

          str_uri = $product_uri + '/words/' + @filename + '/drawingObjects/' + index.to_s + '/oleData'
          signed_str_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
          response_stream = ::RestClient.get(signed_str_uri, {:accept => 'application/json'})

          valid_output = Aspose::Cloud::Common::Utils.validate_output(response_stream)

          if valid_output.blank?

            output_path = $out_put_location + Aspose::Cloud::Common::Utils.get_filename(@filename) + '_' + index.to_s + '.' + ole_format
            Aspose::Cloud::Common::Utils.save_file(response_stream, output_path)
            return output_path
          end
          valid_output

        end

=begin
   Get the Image drawing object from document
   @param number index
   @param string render_format
=end

        def get_image_data index, render_format
          raise 'Index not specified.' if index.blank?

          raise 'Render Format not specified.' if render_format.blank?


          str_uri = $product_uri + '/words/' + @filename + '/drawingObjects/' + index.to_s + '/imagedata'
          signed_str_uri = Aspose::Cloud::Common::Utils.sign(str_uri)

          response_stream = ::RestClient.get(signed_str_uri, {:accept => 'application/json'})

          valid_output = Aspose::Cloud::Common::Utils.validate_output(response_stream)

          if valid_output.blank?

            output_path = $out_put_location + Aspose::Cloud::Common::Utils.get_filename(@filename) + '_' + index.to_s + '.' + render_format
            Aspose::Cloud::Common::Utils.save_file(response_stream, output_path)
            return output_path
          end
          valid_output

        end

=begin
   Convert drawing object to image
   @param number index
   @param string render_format
=end

        def convert_drawing_object index, render_format

          raise 'Index not specified.' if index.blank?
          raise 'Render Format not specified.' if render_format.blank?


          str_uri = $product_uri + '/words/' + @filename + '/drawingObjects/' + index.to_s + '?format=' + render_format
          signed_str_uri = Aspose::Cloud::Common::Utils.sign(str_uri)

          response_stream = ::RestClient.get(signed_str_uri, {:accept => 'application/json'})

          valid_output = Aspose::Cloud::Common::Utils.validate_output(response_stream)

          if valid_output.blank?
            output_path = $out_put_location + Aspose::Cloud::Common::Utils.get_filename(@filename) + '_' + index.to_s + '.' + render_format
            Aspose::Cloud::Common::Utils.save_file(response_stream, output_path)
            return output_path
          end
          valid_output


        end

=begin
   Get the List of drawing object from document	
=end

        def get_drawing_object_list
          str_uri = $product_uri + '/words/' + @filename + '/drawingObjects'
          signed_str_uri = Aspose::Cloud::Common::Utils.sign(str_uri)

          response_stream = ::RestClient.get(signed_str_uri, {:accept => 'application/json'})

          stream_hash = JSON.parse(response_stream)
          stream_hash['Code'] == 200 ? stream_hash['DrawingObjects']['List'] : false

        end

=begin
   Get the drawing object from document	
   @param string object_uri
   @param string output_path
=end

        def get_drawing_object object_uri, output_path

          raise 'Object URI not specified.' if object_uri.blank?
          raise 'Output path not specified.' if output_path.blank?


          url_arr = object_uri.split('/')
          object_index = url_arr.at(-1)

          str_uri = object_uri
          signed_str_uri = Aspose::Cloud::Common::Utils.sign(str_uri)

          response_stream = ::RestClient.get(signed_str_uri, {:accept => 'application/json'})

          stream_hash = JSON.parse(response_stream)

          return false unless stream_hash['Code'] == 200

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
          response_stream = ::RestClient.get(signed_str_uri, {:accept => 'application/json'})
          valid_output = Aspose::Cloud::Common::Utils.validate_output(response_stream)

          if valid_output.blank?

            # output_path = $out_put_location + Aspose::Cloud::Common::Utils.get_filename(@filename) + '_' + index.to_s + '.' + render_format
            Aspose::Cloud::Common::Utils.save_file(response_stream, output_path)
            return output_path
          end
          valid_output

        end

=begin
   Get the List of drawing object from document
   @param string output_path
=end

        def get_drawing_objects output_path

          raise 'Output path not specified.' if output_path.blank?


          str_uri = $product_uri + '/words/' + @filename + '/drawingObjects'
          signed_str_uri = Aspose::Cloud::Common::Utils.sign(str_uri)

          response_stream = ::RestClient.get(signed_str_uri, {:accept => 'application/json'})

          stream_hash = JSON.parse(response_stream)

          return false unless stream_hash['Code'] == 200

          stream_hash['DrawingObjects']['List'].each do |object|
            self.get_drawing_object(object['link']['Href'], output_path)
          end

        end

      end
    end

  end
end
