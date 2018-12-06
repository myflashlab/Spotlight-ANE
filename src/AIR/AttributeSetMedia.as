package com.myflashlab.air.extensions.spotlight
{

	/**
	 * 
	 * @author Hadi Tavakoli - 6/25/2016 2:00 PM
	 */
	public class AttributeSetMedia
	{
		/** URL of the item */
		public var URL:String;
		
		/** This is a comment related to a file. */
		public var comment:String;
		
		/** This is the copyright of the content. */
		public var copyright:String;
		
		/** A version specifier for this item. */
		public var version:String;
		
		/** Used to indicate the role of the document creator */
		public var role:String;
		
		/** Used to provide a link to information about rights held in and over the resource. Typically a Rights element will contain a rights management statement for the resource, or reference a service providing such information. Rights information often encompasses Intellectual Property Rights (IPR), Copyright, and various Property Rights. If the rights element is absent, no assumptions can be made about the status of these and other rights with respect to the resource. */
		public var rights:String;
		
		/** A description of the rating.  E.g. the number of reviewers. */
		public var ratingDescription:String;
		
		/** Information about the item */
		public var information:String;
		
		/** Director of the item (e.g. movie director) */
		public var director:String;
		
		/** Producer of the content */
		public var producer:String;
		
		/** Genre of the item (e.g. movie genre) */
		public var genre:String;
		
		/** Original format of the movie */
		public var originalFormat:String;
		
		/** Original source of the movie */
		public var originalSource:String;
		
		/** The list of editor/editors that have worked on this item. */
		public var editors:Array;
		
		/** The list of people who are visible in an image or movie or written about in a document. */
		public var participants:Array;
		
		/** The list of projects that this item is part of. For example if you were working on a movie, all of the movie files could be marked as belonging to the project "My movie" */
		public var projects:Array;
		
		/** This attribute indicates where the item was obtained from. Examples: - downloaded file may refer to the site they were downloaded from,the refering URL, etc - files received by email may indicate who sent the file, the message subject, etc */
		public var contentSources:Array;
		
		/** A list of contacts that are somehow associated with this document, beyond what is captured as Author. */
		public var contactKeywords:Array;
		
		/** The codecs used to encode/decode the media */
		public var codecs:Array;
		
		/** Media types present in the content */
		public var mediaTypes:Array;
		
		/** Used to indicate company/Organization that created the document. */
		public var organizations:Array;
		
		/** Used to designate the languages of the intellectual content of the resource. Recommended best practice for the values of the Language element is defined by BCP 47. */
		public var languages:Array;
		
		/** Used to designate the entity responsible for making the resource available. Examples of a Publisher include a person, an organization, or a service. Typically, the name of a Publisher should be used to indicate the entity. */
		public var publishers:Array;
		
		/** Used to designate the entity responsible for making contributions to the content of the resource. Examples of a Contributor include a person, an organization or a service. Typically, the name of a Contributor should be used to indicate the entity. */
		public var contributors:Array;
		
		/** Used to designate the extent or scope of the content of the resource. Coverage will typically include spatial location (a place name or geographic co-ordinates), temporal period (a period label, date, or date range) or jurisdiction (such as a named administrative entity). Recommended best practice is to select a value from a controlled vocabulary, and that, where appropriate, named places or time periods be used in preference to numeric identifiers such as sets of co-ordinates or date ranges. */
		public var coverage:Array;
		
		/** Performers in the movie */
		public var performers:Array;
		
		/** This is the date that the file was last downloaded / received. */
		public var downloadedDate:Number;
		
		/** This is the date that the contents of the item were created */
		public var contentCreationDate:Number;
		
		/** This is the date that the contents of the item were last modified */
		public var contentModificationDate:Number;
		
		/** This is the date that the item was moved into the current location. */
		public var addedDate:Number;
		
		/** This is the date that the item was last used */
		public var lastUsedDate:Number;
		
		/** This is the duration, in seconds, of the content of the item (if appropriate). */
		public var duration:Number;
		
		/** Whether the content is prepared for streaming.  Should be 0 for not streamable, 1 for streamable. */
		public var streamable:Number;
		
		/** The total bit rate (audio &amp; video combined) of the media */
		public var totalBitRate:Number;
		
		/** The video bit rate */
		public var videoBitRate:Number;
		
		/** The audio bit rate */
		public var audioBitRate:Number;
		
		/** The delivery type of the item.  Should be 0 for fast start and 1 for RTSP. */
		public var deliveryType:Number;
		
		/** User rating of this item out of 5 stars */
		public var rating:Number;
		
		/** User play count of this item */
		public var playCount:Number;
		
		/** Whether or not the item is local. Should be 1 if true, 0 otherwise. */
		public var local:Number;
		
		/** Whether or not the item has explicit content. Should be 1 if explicit, 0 for clean. */
		public var contentRating:Number;
		
		
		
		public function AttributeSetMedia():void{}
		
		/** @private */
		internal function get props():Object
		{
			return {
				"URL":URL,
				"comment":comment,
				"copyright":copyright,
				"version":version,
				"role":role,
				"rights":rights,
				"ratingDescription":ratingDescription,
				"information":information,
				"director":director,
				"producer":producer,
				"genre":genre,
				"originalFormat":originalFormat,
				"originalSource":originalSource,
				"editors":editors,
				"participants":participants,
				"projects":projects,
				"contentSources":contentSources,
				"contactKeywords":contactKeywords,
				"codecs":codecs,
				"mediaTypes":mediaTypes,
				"organizations":organizations,
				"languages":languages,
				"publishers":publishers,
				"contributors":contributors,
				"coverage":coverage,
				"performers":performers,
				"downloadedDate":downloadedDate,
				"contentCreationDate":contentCreationDate,
				"contentModificationDate":contentModificationDate,
				"addedDate":addedDate,
				"lastUsedDate":lastUsedDate,
				"duration":duration,
				"streamable":streamable,
				"totalBitRate":totalBitRate,
				"videoBitRate":videoBitRate,
				"audioBitRate":audioBitRate,
				"deliveryType":deliveryType,
				"rating":rating,
				"playCount":playCount,
				"local":local,
				"contentRating":contentRating
			};
		}
	}
}