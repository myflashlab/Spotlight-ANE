package com.myflashlab.air.extensions.spotlight
{

	/**
	 * 
	 * @author Hadi Tavakoli - 6/25/2016 2:00 PM
	 */
	public class AttributeSetImages
	{
		/** What color space model is this item following (For example, "RGB", "CMYK", "YUV", "YCbCr") */
		public var colorSpace:String;
		
		/** Device make that was used to acquire this item */
		public var acquisitionMake:String;
		
		/** Device model that was used to acquire this item */
		public var acquisitionModel:String;
		
		/** The owner of the camera used to capture this image. */
		public var cameraOwner:String;
		
		/** The model of the lens used to capture this image. */
		public var lensModel:String;
		
		/** Name of the color profile used for the image */
		public var profileName:String;
		
		/** The verion of the EXIF header that was used to generate the metadata */
		public var EXIFVersion:String;
		
		/** The version of GPSInfoIFD header that was used to generate the metadata */
		public var EXIFGPSVersion:String;
		
		/** The metering mode for the image (Average, Partial, Pattern, ...) */
		public var meteringMode:String;
		
		/** The class of the program used by the camera to set exposure when the picture is taken (Manual, Normal, Aperture Priority, ...) */
		public var exposureProgram:String;
		
		/** The time  of the exposure as a string, e.g. "1/250 seconds". */
		public var exposureTimeString:String;
		
		/** The names of the various layers in the file */
		public var layerNames:Array;
		
		/** The height of the item in pixels (ie Image height or Video frame height) */
		public var pixelHeight:Number;
		
		/** The width of the item in pixels (ie Image width or Video frame width) */
		public var pixelWidth:Number;
		
		/** The total number of pixels in the item. */
		public var pixelCount:Number;
		
		/** Number of bits per sample For example bit depth of an image (8-bit, 16-bit etc..) or bit depth per audio sample of uncompressed audio data (8, 16, 24, 32, 64, etc..) */
		public var bitsPerSample:Number;
		
		/** Indicates if the flash was used to take the picture.  Should be 1 if flash is on, 0 otherwise. */
		public var flashOn:Number;
		
		/** The actual focal length of the lens in mm. */
		public var focalLength:Number;
		
		/** Indicates if the focal length is 35mm.  Should be 1 if true, 0 otherwise */
		public var focalLength35mm:Number;
		
		/** The ISO Speed the camera was set to when the image was taken. Examples are 100, 200, 400, etc. */
		public var ISOSpeed:Number;
		
		/** The orientation of the data.  Should be 0 for Landscape or 1 for Portrait. */
		public var orientation:Number;
		
		/** The white balance setting of the camera when the image was acquired.  Should be 0 for Auto or 1 for Manual. */
		public var whiteBalance:Number;
		
		/** The size of the lens aperture as a log-scale APEX value when the image was acquired. */
		public var aperture:Number;
		
		/** Resolution width of this image in DPI */
		public var resolutionWidthDPI:Number;
		
		/** Resolution height of this image in DPI */
		public var resolutionHeightDPI:Number;
		
		/** Mode that was used for the exposure.  Should be 0 for AutoExposure, 1 for Manual, 2 for AutoBracket. */
		public var exposureMode:Number;
		
		/** Time that the lens was open during exposure in seconds */
		public var exposureTime:Number;
		
		/** Indicates if this image file has an alpha channel.  Should be 0 for no alpha channel, 1 for alpha channel. */
		public var hasAlphaChannel:Number;
		
		/** Indicates if red-eye reduction was used to take the picture.  Should be 0 for no red-eye, 1 for red-eye */
		public var redEyeOn:Number;
		
		/** The smallest F number of the lens. The unit is the APEX value. Ordinarily it is given in the range of 00.00 to 99.99. */
		public var maxAperture:Number;
		
		/** The focal length of the lens divided by the diameter of the aperture when the image was acquired. */
		public var fNumber:Number;
		
		public function AttributeSetImages():void{}
		
		/** @private */
		internal function get props():Object
		{
			return {
				"colorSpace":colorSpace,
				"acquisitionMake":acquisitionMake,
				"acquisitionModel":acquisitionModel,
				"cameraOwner":cameraOwner,
				"lensModel":lensModel,
				"profileName":profileName,
				"EXIFVersion":EXIFVersion,
				"EXIFGPSVersion":EXIFGPSVersion,
				"meteringMode":meteringMode,
				"exposureProgram":exposureProgram,
				"exposureTimeString":exposureTimeString,
				"layerNames":layerNames,
				"pixelHeight":pixelHeight,
				"pixelWidth":pixelWidth,
				"pixelCount":pixelCount,
				"bitsPerSample":bitsPerSample,
				"flashOn":flashOn,
				"focalLength":focalLength,
				"fNumber":fNumber,
				"maxAperture":maxAperture,
				"redEyeOn":redEyeOn,
				"hasAlphaChannel":hasAlphaChannel,
				"exposureTime":exposureTime,
				"exposureMode":exposureMode,
				"resolutionHeightDPI":resolutionHeightDPI,
				"resolutionWidthDPI":resolutionWidthDPI,
				"aperture":aperture,
				"whiteBalance":whiteBalance,
				"orientation":orientation,
				"ISOSpeed":ISOSpeed,
				"focalLength35mm":focalLength35mm
			};
		}
	}
}