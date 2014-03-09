module Aspose
  module Cloud
    module Barcode
      class Builder

        def save code_text, symbology, image_format, x_resolution, y_resolution, x_dimension, y_dimension

            str_uri = $product_uri + '/barcode/generate?text=' + code_text.to_s + '&type=' + symbology.to_s + '&format=' + image_format.to_s +
              (x_resolution <= 0 ? '' : '&resolutionX=' + x_resolution.to_s) +
              (y_resolution <=0 ? '' : '&resolutionY=' + y_resolution.to_s) +
              (x_dimension <= 0 ? '' : '&dimensionX=' + x_dimension.to_s) +
              (y_dimension <= 0 ? '' : '&dimensionY=' + y_dimension.to_s)
            signed_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
            response = RestClient.get(signed_uri,:accept => 'application/json')
            output_path = "#{$out_put_location}barcode#{symbology}.#{image_format}"
            Aspose::Cloud::Common::Utils.save_file(response, output_path)
            output_path

        end
      end
    end

  end
end

