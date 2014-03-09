module Aspose
  module Cloud

    module AsposeStorage
      # This class provides functionality to manage files in a Remote Aspose Folder
      class Folder

        def initialize
          @str_uri_folder = $product_uri + '/storage/folder/'
          @str_uri_file = $product_uri + '/storage/file/'
          @str_uri_exist = $product_uri + '/storage/exist/'
          @str_uri_disc = $product_uri + '/storage/disc/'
        end

        # Uploads file from the local path to the remote folder.
        # * :localFilePath represents full local file path and name
        # * :remoteFolderPath represents remote folder relative to the root. Pass empty string for the root folder.		 
        def upload_file(local_file, remote_folder='', storage_type='Aspose', storage_name='')

          struri = build_file_name local_file, remote_folder
          struri += append_storage(storage_name) unless storage_type == 'Aspose'

          signeduri = Aspose::Cloud::Common::Utils.sign(struri)
          Aspose::Cloud::Common::Utils.upload_file_binary(local_file, signeduri)

        end


        # Retrieves Files and Folder information from a remote folder. The method returns an Array of AppFile objects.
        # * :remoteFolderPath represents remote folder relative to the root. Pass empty string for the root folder.
        def get_files(remote_folder_path)
          str_url = @str_uri_folder + remote_folder_path

          signed_uri = Aspose::Cloud::Common::Utils.sign(str_url)
          response = RestClient.get(signed_uri, :accept => 'application/json')

          JSON.parse(response)['Files']

          #      urlFolder = $product_uri + '/storage/folder'
          #      urlFile = ''
          #      urlExist = ''
          #      urlDisc = ''
          #      if not remoteFolderPath.empty?
          #        urlFile = $product_uri + '/storage/folder/' + remoteFolderPath
          #      end
          #      signedURL = Aspose::Cloud::Common::Utils.sign(urlFolder)
          #      response = RestClient.get(signedURL, :accept => 'application/json')
          #      result = JSON.parse(response.body)
          #      apps = Array.new(result['Files'].size)
          #
          #      for i in 0..result['Files'].size - 1
          #        apps[i] = AppFile.new
          #        apps[i].Name = result['Files'][i]['Name']
          #        apps[i].IsFolder = result['Files'][i]['IsFolder']
          #        apps[i].Size = result['Files'][i]['Size']
          #        apps[i].ModifiedDate = Aspose::Cloud::Common::Utils.parse_date(result['Files'][i]['ModifiedDate'])
          #      end
          #      return apps
        end

        def file_exists(file_name, storage_type = 'Aspose', storage_name = '')

          signed_str_uri = build_file_uri(file_name, storage_name)

          response_stream = RestClient.get(signed_str_uri, {:accept => 'application/json'})
          JSON.parse(response_stream)['FileExist']['IsExist']

        end

        def delete_file(file_name, storage_type = 'Aspose', storage_name = '')

          signed_str_uri = build_file_uri(file_name, storage_name)
          response_stream = RestClient.delete(signed_str_uri, {:accept => 'application/json'})
          JSON.parse(response_stream)['Code'] == 200
        end

        def create_folder (folder_name, storage_type = 'Aspose', storage_name='')

          raise 'Folder name cannot be empty' if folder_name.blank?
          folder_uri = URI.join(@str_uri_folder, folder_name)
          unless storage_name.empty?
            storage_query = URI.decode_www_form(folder_uri.query || []) << ["storage", storage_name]
            folder_uri.query = URI.encode_www_form(storage_query)
          end
          signed_uri = Aspose::Cloud::Common::Utils.sign(folder_uri.to_s)
          response = RestClient.put(signed_uri, nil, :accept => :json)
          JSON.parse(response)['Code'] == 200
        end

        def delete_folder (folder_name)

          raise 'Folder name cannot be empty' if folder_name.blank?

          str_uri = URI.join(@str_uri_folder, folder_name)
          signed_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
          response = RestClient.delete(signed_uri, :accept => 'application/json')
          JSON.parse(response)['Code'] == 200

        end

        def get_disc_usage (storage_type = 'Aspose', storage_name = '')

          str_uri = @str_uri_disc
          str_uri += append_storage(storage_name)

          signed_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
          response = RestClient.get(signed_uri, :accept => 'application/json')
          JSON.parse(response)['DiscUsage']

        end

        # Get file from Aspose server
        def get_file (file_name, storage_type = 'Aspose', storage_name = '')
          signed_uri = build_file_uri(file_name, storage_name)
          RestClient.get(signed_uri, :accept => 'application/json')
        end

        private

        def build_file_uri file_name, storage_name
          raise 'Filename cannot be empty' if file_name.blank?
          str_uri = @str_uri_file + file_name
          str_uri += append_storage(storage_name)

          Aspose::Cloud::Common::Utils.sign(str_uri)

        end

        def append_storage storage_name
          storage_name.blank? ? '' : "?storage=#{ storage_name }"
        end


        def build_file_name local_file, remote_folder
          raise 'Local file not specified' if local_file.blank?

          struri = $product_uri + '/storage/file/'
          struri += remote_folder + '/' unless remote_folder.blank?
          struri += File.basename(local_file)

        end

      end #Class Ends Here
    end
  end
end
