# To change this template, choose Tools | Templates
# and open the template in the editor.
module Aspose
  module Cloud

    module Slides
      class Extractor
        def initialize (filename)
          @filename = filename
        end
=begin
  Gets total number of images in a presentation
=end
        def get_image_count storage_type = '',storage_name='',folder_name  =''
          begin
            if @filename == ''
              raise 'No file name specified'
            end
            str_uri = $product_uri + '/slides/' + @filename + '/images'
            if !folder_name.empty?
              str_uri += '?folder=' + folder_name
            end
            if !storage_name.empty?
              str_uri += '&storage=' + storage_name
            end
            signed_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
            response = RestClient.get(signed_uri, :accept => 'application/json')
            json = JSON.parse(response)
            return json['Images']['List'].count
          rescue Exception=>e
            print e
          end
        end
=begin
  Gets number of images in the specified slide
	@param number slide_number
=end
        def get_slide_image_count(slide_number,storage_type='',storage_name='',folder_name='')
          begin
            if @filename == ''
              raise 'No file name specified'
            end
            str_uri = $product_uri + '/slides/' + @filename + '/slides/' + slide_number.to_s + '/images'
            if !folder_name.empty?
              str_uri += '?folder=' + folder_name
            end
            if !storage_name.empty?
              str_uri += '&storage=' + storage_name
            end
            signed_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
            response = RestClient.get(signed_uri, :accept => 'application/json')
            json = JSON.parse(response)
            return json['Images']['List'].count
          rescue Exception=>e
            print e
          end
        end
=begin
  Gets all shapes from the specified slide
	@param number slide_number
=end
        def get_shapes(slide_number,storage_type = '',storage_name='',folder_name='')
          begin
            if @filename == ''
              raise 'No file name specified'
            end
         
            str_uri = $product_uri + '/slides/' + @filename + '/slides/' + slide_number.to_s + '/shapes'
            if !folder_name.empty?
              str_uri += '?folder=' + folder_name
            end
            if !storage_name.empty?
              str_uri += '&storage=' + storage_name
            end
            signed_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
            response = RestClient.get(signed_uri, :accept => 'application/json')
            json = JSON.parse(response)
            shapes = Hash.new
            json['ShapeList']['ShapesLinks'].each { |item| 
          
              signed_uri = Aspose::Cloud::Common::Utils.sign(item['Uri']['Href'])
              response = RestClient.get(signed_uri, :accept => 'application/json')
              shapes = JSON.parse(response)
            }
            return shapes
          rescue Exception=>e
            print e
          end
        end
=begin
  Get color scheme from the specified slide
	@param number slide_number
=end
        def get_color_scheme(slide_number,storage_type='',storage_name='')
          begin
            if @filename == ''
              raise 'No file name specified'
            end
            str_uri = $product_uri + '/slides/' + @filename + '/slides/' + slide_number.to_s + '/theme/colorScheme'
            if !storage_name.empty?
              str_uri += '?storage=' + storage_name
            end
            signed_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
            response = RestClient.get(signed_uri, :accept => 'application/json')
            json = JSON.parse(response)
            return json['ColorScheme']
          rescue Exception=>e
            print e
          end
        end
=begin
  Get font scheme from the specified slide
	@param number slide_number
=end   
        def get_font_scheme(slide_number,storage_type='',storage_name='')
          begin
            if @filename == ''
              raise 'No file name specified'
            end
            str_uri = $product_uri + '/slides/' + @filename + '/slides/' + slide_number.to_s + '/theme/fontScheme'
            if !storage_name.empty?
              str_uri += '?storage=' + storage_name
            end
            signed_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
            response = RestClient.get(signed_uri, :accept => 'application/json')
            json = JSON.parse(response)
            return json['FontScheme']
          rescue Exception=>e
            print e
          end
        end

=begin
  Get format scheme from the specified slide
	@param number slide_number
=end
        def get_format_scheme(slide_number,storage_type='',storage_name='')
          begin
            if @filename == ''
              raise 'No file name specified'
            end
            str_uri = $product_uri + '/slides/' + @filename + '/slides/' + slide_number.to_s + '/theme/formatScheme'
            if !storage_name.empty?
              str_uri += '?storage=' + storage_name
            end
            signed_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
            response = RestClient.get(signed_uri, :accept => 'application/json')
            json = JSON.parse(response)
            return json['FormatScheme']
          rescue Exception=>e
            print e
          end
        end
=begin
  Gets placeholder count from a particular slide
	@param number $slideNumber
=end
        def get_placeholder_count(slide_number,storage_type='',storage_name='',folder_name='')
          begin
            if @filename == ''
              raise 'No file name specified'
            end
            str_uri = $product_uri + '/slides/' + @filename + '/slides/' + slide_number.to_s + '/placeholders'
            if !folder_name.empty?
              str_uri += '?folder=' + folder_name
            end
            if !storage_name.empty?
              str_uri += '&storage=' + storage_name
            end
            signed_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
            response = RestClient.get(signed_uri, :accept => 'application/json')
            json = JSON.parse(response)
            return json['Placeholders']['PlaceholderLinks'].count
          rescue Exception=>e
            print e
          end
        end

=begin
  Gets placeholder count from a particular slide
	@param number $slideNumber
	@param number $placeholderIndex
=end
        def get_placeholder(slide_number,placeholder_index,storage_type = '',storage_name='',folder_name = '')
          begin
            if @filename == ''
              raise 'No file name specified'
            end
            str_uri = $product_uri + '/slides/' + @filename + '/slides/' + slide_number.to_s + '/placeholders/' + placeholder_index.to_s
            if !folder_name.empty?
              str_uri += '?folder=' + folder_name
            end
            if !storage_name.empty?
              str_uri += '&storage=' + storage_name
            end
            signed_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
            response = RestClient.get(signed_uri, :accept => 'application/json')
            json = JSON.parse(response)
            return json['Placeholder']
          rescue Exception=>e
            print e
          end
        end
      end
    end
    
  end
end