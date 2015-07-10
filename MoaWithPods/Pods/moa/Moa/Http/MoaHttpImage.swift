
import Foundation

/**

Helper functions for downloading an image and processing the response.

*/
struct MoaHttpImage {
  static func createDataTask(url: String,
    onSuccess: (MoaImage)->(),
    onError: (NSError, NSHTTPURLResponse?)->()) -> NSURLSessionDataTask? {
    
    return MoaHttp.createDataTask(url,
      onSuccess: { data, response in
        self.handleSuccess(data, response: response, onSuccess: onSuccess, onError: onError)
      },
      onError: onError
    )
  }
  
  static func handleSuccess(data: NSData,
    response: NSHTTPURLResponse,
    onSuccess: (MoaImage)->(),
    onError: (NSError, NSHTTPURLResponse?)->()) {
      
    // Show error if response code is not 200
    if response.statusCode != 200 {
      onError(MoaHttpImageErrors.HttpStatusCodeIsNot200.new, response)
      return
    }
    
    // Ensure response has the valid MIME type
    if let mimeType = response.MIMEType {
      if !validMimeType(mimeType) {
        // Not an image Content-Type http header
        let error = MoaHttpImageErrors.NotAnImageContentTypeInResponseHttpHeader.new
        onError(error, response)
        return
      }
    } else {
      // Missing Content-Type http header
      let error = MoaHttpImageErrors.MissingResponseContentTypeHttpHeader.new
      onError(error, response)
      return
    }
      
    if let image = MoaImage(data: data) {
      onSuccess(image)
    } else {
      // Failed to convert response data to UIImage
      let error = MoaHttpImageErrors.FailedToReadImageData.new
      onError(error, response)
    }
  }
  
  private static func validMimeType(mimeType: String) -> Bool {
    let validMimeTypes = ["image/jpeg", "image/pjpeg", "image/png"]
    return contains(validMimeTypes, mimeType)
  }
}