# To change this template, choose Tools | Templates
# and open the template in the editor.
module Aspose
  module Cloud

    module Words
      class Builder
        def initialize filename
          @filename = filename
          raise 'Base file not specified.' if @filename.blank?
        end

=begin
   Inserts water mark text into the document.
   @param string text
   @param string rotation_angle
=end

        def insert_watermark_text text, rotation_angle

          raise 'Text not specified.' if text.blank?
          check_angle(rotation_angle)

          str_uri = $product_uri + '/words/' + @filename + '/insertWatermarkText'
          signed_str_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
          post_hash = {'Text' => text,
                       'RotationAngle' => rotation_angle}
          json_data = post_hash.to_json

          process_response RestClient.post(signed_str_uri, json_data, {:content_type => :json})
        end

        def check_angle(rotation_angle)
          raise 'Rotation Angle not specified.' if rotation_angle.blank?
        end

=begin
   Inserts water mark image into the document.
   @param string image_file
   @param string rotation_angle
=end

        def insert_watermark_image image_file, rotation_angle

          check_angle(rotation_angle)
          raise 'Image file not specified.' if image_file.blank?

          str_uri = $product_uri + '/words/' + @filename + '/insertWatermarkImage?imageFile=' + image_file.to_s + '&rotationAngle=' + rotation_angle.to_s
          signed_str_uri = Aspose::Cloud::Common::Utils.sign(str_uri)

          process_response RestClient.post(signed_str_uri, '', {:content_type => :json})

        end

      end

=begin
   Replace a text with the new value in the document
   @param string old_value
   @param string new_value
   @param string is_match_case
   @param string is_match_whole_word   
=end

      def replace_text old_value, new_value, is_match_case, is_match_whole_word
        raise 'Old value not specified.' if old_value.blank?
        raise 'New Value not specified.' if new_value.blank?

        post_hash = {'OldValue' => old_value,
                     'NewValue' => new_value,
                     'IsMatchCase' => is_match_case,
                     'IsMatchWholeWord' => is_match_whole_word}
        json_data = post_hash.to_json
        str_uri = $product_uri + '/words/' + @filename + '/replaceText'
        signed_str_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
        process_response RestClient.post signed_str_uri, json_data, {:content_type => :json}

      end

      private

      def process_response response_stream
        valid_output = Aspose::Cloud::Common::Utils.validate_output(response_stream)

        return valid_output unless  valid_output.empty?
        folder = Aspose::Cloud::AsposeStorage::Folder.new
        output_stream = folder.get_file(@filename)
        output_path = $out_put_location + @filename
        Aspose::Cloud::Common::Utils.save_file(output_stream, output_path)
        ''

      end
    end

  end
end