module Aspose
  module Cloud
    module Barcode
      class Reader
        def initialize filename
          @filename = filename
        end

        def read symbology

          precheck
          str_uri = $product_uri + '/barcode/' + @filename + '/recognize?' + (symbology.length <= 0 ? 'type=' : 'type=' + symbology.to_s)
          build_result str_uri
        end

        def read_from_local_image local_image, remote_folder, barcode_read_type, format
          precheck
          folder = Aspose::Cloud::AsposeStorage::Folder.new
          folder.upload_file(local_image, remote_folder)
          readr(File.basename(local_image), remote_folder, barcode_read_type, format)
        end

        def readr remote_image_name, remote_folder, read_type, format
          precheck
          str_uri = uri_builder(remote_image_name, remote_folder, read_type, format)
          build_result str_uri
        end

        def uri_builder remote_image, remote_folder, read_type, format
          uri = $product_uri + '/barcode/'
          uri += remote_image + '/' unless remote_image.blank?
          uri += 'recognize?type='
          uri += read_type.to_s unless read_type == 'AllSupportedTypes'
          uri += '&format=' + format unless format.blank?
          uri += '&folder=' + remote_folder unless remote_folder.blank?
          uri
        end

        private

        def precheck
          raise 'Base file is not specified' if @filename.blank?
        end

        def build_result str_uri
          signed_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
          response = RestClient.get(signed_uri, :accept => 'application/json')
          json = JSON.parse(response)
          json['Code']==200 ? json['Barcodes'] : nil
        end

      end
    end

  end
end