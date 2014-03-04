module Aspose
  module Cloud

    module AsposeStorage
      # This class provides functionality to manage files in a Remote Aspose Folder
      class Folder

        def initialize
          @str_uri_folder = $product_uri + '/storage/folder'
          @str_uri_file = $product_uri + '/storage/file/'
          @str_uri_exist = $product_uri + '/storage/exist/'
          @str_uri_disc = $product_uri + '/storage/disc/'
        end

        # Uploads file from the local path to the remote folder.
        # * :localFilePath represents full local file path and name
        # * :remoteFolderPath represents remote folder relative to the root. Pass empty string for the root folder.		 
        def upload_file(local_file, remote_folder='', storage_type='Aspose', storage_name='')

          begin

            raise 'Local file not specified' if local_file.empty?

            if storage_type == 'Aspose'

              filename = File.basename(local_file)

              if remote_folder.empty?
                struri = $product_uri + '/storage/file/' + filename
              else
                struri = $product_uri + '/storage/file/' + remote_folder + '/' + filename
              end

              signeduri = Aspose::Cloud::Common::Utils.sign(struri)

            else

              filename = File.basename(local_file)

              if remote_folder.empty?
                struri = $product_uri + '/storage/file/' + filename + '?storage=' + storage_name
              else
                struri = $product_uri + '/storage/file/' + remote_folder + '/' + filename + '?storage=' + storage_name
              end

              signeduri = Aspose::Cloud::Common::Utils.sign(struri)

            end

            Aspose::Cloud::Common::Utils.upload_file_binary(local_file, signeduri)

          rescue Exception => e
            print e
          end
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

        def file_exists(filename, storage_type = 'Aspose', storage_name = '')
          begin

            raise('Filename cannot be empty') if  filename.empty?

            str_uri = @str_uri_exist + filename
            unless storage_name.empty?
              str_uri += '?storage=' + storage_name
            end
            signed_str_uri = Aspose::Cloud::Common::Utils.sign(str_uri)

            response_stream = RestClient.get(signed_str_uri, {:accept => 'application/json'})
            JSON.parse(response_stream)['FileExist']['IsExist']

          rescue Exception => e
            print e
          end
        end

        def delete_file(filename, storage_type = 'Aspose', storage_name = '')
          begin
        
            if(filename == '')
              raise('Filename cannot be empty')
            end                
        
            str_uri = @str_uri_file + filename
            if(!storage_name.empty?)
              str_uri += '?storage=' + storage_name
            end
            signed_str_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
        
            response_stream = RestClient.delete(signed_str_uri, {:accept=>'application/json'})
        
            stream_hash = JSON.parse(response_stream)
        
            if(stream_hash['Code'] != 200)
              return false
            else
              return true
            end                
        
          rescue Exception=>e
            print e
          end
        end
   
        def create_folder (folder_name,storage_type = 'Aspose',storage_name='')
          begin
            if folder_name==''
              raise 'Filename cannot be empty'
            end
            str_uri = @str_uri_folder + folder_name
            if(!storage_name.empty?)
              str_uri += '?storage=' + storage_name
            end
            signed_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
            response = RestClient.put(signed_uri, :accept => 'application/json')
            JSON.parse(response)['Code'] == 200

          rescue Exception => e
            print e
          end
        end
    
        def delete_folder (folder_name)
          begin
            if folder_name==''
              raise 'Filename cannot be empty'
            end
            str_uri = @str_uri_folder + folder_name
            signed_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
            response = RestClient.delete(signed_uri, :accept=>'application/json')
            json = JSON.parse(response)
            if json['Code'] ==200
              return true
            else
              return false
            end
          rescue Exception => e
            print e
          end
        end
    
        def get_disc_usage (storage_type = 'Aspose',storage_name='')
          begin
            str_uri = @str_uri_disc
            if(!storage_name.empty?)
              str_uri += '?storage=' + storage_name
            end
            signed_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
            response = RestClient.get(signed_uri, :accept=>'application/json')
            json = JSON.parse(response)
            return json['DiscUsage']
          rescue Exception => e
            print e
          end
        end
        # Get file from Aspose server
        def get_file (file_name,storage_type = 'Aspose',storage_name='')
          begin
            if file_name==''
              raise 'Filename cannot be empty'
            end
            str_uri = @str_uri_file + file_name
            if(!storage_name.empty?)
              str_uri += '?storage=' + storage_name
            end
            signed_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
            response = RestClient.get(signed_uri, :accept=>'application/json')
            return response
          rescue Exception => e
            print e
          end
        end

      end #Class Ends Here
    end    
  end
end