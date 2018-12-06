package com.myflashlab.air.extensions.spotlight
{

	/**
	 * 
	 * @author Hadi Tavakoli - 6/25/2016 2:00 PM
	 */
	public class AttributeSetGeneral
	{
		/** A localized string to be displayed in the UI for this item. */
		public var displayName:String;
		
		/** The title of this particular item. Title of the document, or it could be the title of this mp3 or a subject of a mail message. */
		public var title:String;
		
		/** Optional file URL pointing to a thumbnail image for this item */
		public var thumbnailURL:String;
		
		/** Represents keywords associated with this particular item. Example Keywords might be Birthday,Important etc. */
		public var keywords:Array;
		
		/** If supportsPhoneCall is 1 and the item has the phoneNumbers property, then the phone number may be used to initiate phone calls. This should be used to indicate that using the phone number is appropriate, and a primary action for the user. For example, supportsPhoneCall would be set on a business, but not an academic paper that happens to have phone numbers for the authors or the institution. */
		//public var supportsPhoneCall:Number;
		
		/** If supportsNavigation is set to 1, and the item has the latitude and longitude properties set, then the latitude and longitude may be used for navigation. For example, supportsNavigation would be set on a restaurant review, but not on a photo. */
		//public var supportsNavigation:Number;
		
		/**
		 * 
		 */
		public function AttributeSetGeneral():void{}
		
		/** @private */
		internal function get props():Object
		{
			return {
				"displayName":displayName,
				"title":title,
				"thumbnailURL":thumbnailURL,
				//"supportsPhoneCall":supportsPhoneCall,
				//"supportsNavigation":supportsNavigation,
				"keywords":keywords
			};
		}
	}
}