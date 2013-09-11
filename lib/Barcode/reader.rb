module Aspose
  module Cloud
    module Barcode
      class Reader
        def initialize filename
          @filename = filename
        end

        def read symbology
          begin
            if @filenmae == ''
              raise 'Base file is not specified'
            end
            str_uri = $product_uri + '/barcode/' + @filename + '/recognize?' + (symbology.length <= 0 ? 'type=' : 'type=' + symbology.to_s)
            signed_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
            response = RestClient.get(signed_uri,:accept => 'application/json')
            json = JSON.parse(response)
            if(json['Code']== 200)
              return json['Barcodes']
            else
              return nil
            end
          rescue Exception=>e
            print e
          end
        end

        def read_from_local_image local_image, remote_folder, barcode_read_type,format
          begin
            if @filename==''
              raise 'Base file is not specified.'
            end
            folder = Aspose::Cloud::AsposeStorage::Folder.new
            folder.upload_file(local_image,remote_folder)
            data = readr(File.basename(local_image), remote_folder, barcode_read_type,format)
            return data
          rescue Exception=>e
            print e
          end
        end

        def readr remote_image_name,remote_folder,read_type,format
          begin
            if @filename == ''
              raise 'Base file is not specified'
            end
            str_uri = uri_builder(remote_image_name, remote_folder, read_type,format)
            signed_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
            response = RestClient.get(signed_uri , :accept=>'application/json')
            json = JSON.parse(response)
            if(json['Code']==200)
              return json['Barcodes']
            else
              return nil
            end
          rescue Exception=>e
            print e
          end

        end

        def uri_builder remote_image,remote_folder,read_type,format
          uri = $product_uri + '/barcode/'
          if remote_image != nil && remote_image!=''
            uri += remote_image + '/'
          end
          uri += 'recognize?'

          if read_type == 'AllSupportedTypes'
            uri += 'type='
          else
            uri += 'type=' + read_type.to_s;
          end
          if format != nil && format != ''
            uri += '&format=' + format;
          end
          if remote_folder != nil && remote_folder != ''
            uri += '&folder=' + remote_folder;
          end
          return uri;
        end

      end
    end

  end
end