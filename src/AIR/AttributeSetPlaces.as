package com.myflashlab.air.extensions.spotlight
{

	/**
	 * 
	 * @author Hadi Tavakoli - 6/25/2016 2:00 PM
	 */
	public class AttributeSetPlaces
	{
		/** A publishable entry providing a synopsis of the contents of the item. */
		public var headline:String;
		
		/** Other editorial instructions concerning the use of the item, such as embargoes and warnings. */
		public var instructions:String;
		
		/** Identifies city of item origin according to guidelines established by the provider. */
		public var city:String;
		
		/** Identifies Province/State of origin according to guidelines established by the provider. */
		public var stateOrProvince:String;
		
		/** Provides full, publishable, name of the country/primary location where the intellectual property of the item was created,according to guidelines of the provider. */
		public var country:String;
		
		/** The name of the location or point of interest associated with the item. The name may be user provided. */
		public var namedLocation:String;
		
		/**  */
		public var GPSStatus:String;
		
		/**  */
		public var GPSMeasureMode:String;
		
		/**  */
		public var GPSMapDatum:String;
		
		/**  */
		public var GPSProcessingMethod:String;
		
		/**  */
		public var GPSAreaInformation:String;
		
		/**  */
		public var GPSDateStamp:Number;
		
		/** The timestamp on the item.  This generally is used to indicate the time at which the event captured by the item took place. */
		public var timestamp:Number;
		
		/** The altitude of the item in meters above sea level, expressed using the WGS84 datum.  Negative values lie below sea level. */
		public var altitude:Number;
		
		/** The latitude of the item in degrees north of the equator, expressed using the WGS84 datum.  Negative values lie south of the equator. */
		public var latitude:Number;
		
		/** The longitude of the item in degrees east of the prime meridian, expressed using the WGS84 datum.  Negative values lie west of the prime meridian. */
		public var longitude:Number;
		
		/** The speed of the item, in kilometers per hour. */
		public var speed:Number;
		
		/** The direction of the item's image, in degrees from true north. */
		public var imageDirection:Number;
		
		/** The direction of travel of the item, in degrees from true north. */
		public var GPSTrack:Number;
		
		/**  */
		public var GPSDOP:Number;
		
		/**  */
		public var GPSDestLatitude:Number;
		
		/**  */
		public var GPSDestLongitude:Number;
		
		/**  */
		public var GPSDestBearing:Number;
		
		/**  */
		public var GPSDestDistance:Number;
		
		/**  */
		public var GPSDifferental:Number;
		
		public function AttributeSetPlaces():void{}
		
		/** @private */
		internal function get props():Object
		{
			return {
				"headline":headline,
				"instructions":instructions,
				"city":city,
				"stateOrProvince":stateOrProvince,
				"country":country,
				"namedLocation":namedLocation,
				"GPSStatus":GPSStatus,
				"GPSMeasureMode":GPSMeasureMode,
				"GPSMapDatum":GPSMapDatum,
				"GPSProcessingMethod":GPSProcessingMethod,
				"GPSAreaInformation":GPSAreaInformation,
				"GPSDateStamp":GPSDateStamp,
				"timestamp":timestamp,
				"altitude":altitude,
				"latitude":latitude,
				"longitude":longitude,
				"speed":speed,
				"imageDirection":imageDirection,
				"GPSTrack":GPSTrack,
				"GPSDOP":GPSDOP,
				"GPSDestLatitude":GPSDestLatitude,
				"GPSDestLongitude":GPSDestLongitude,
				"GPSDestBearing":GPSDestBearing,
				"GPSDestDistance":GPSDestDistance,
				"GPSDifferental":GPSDifferental
			};
		}
	}
}