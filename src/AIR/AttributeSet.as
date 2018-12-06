package com.myflashlab.air.extensions.spotlight
{

	/**
	 * <p>
	 * This class represents all the information you wish to have for your search item in spotlight. Before being able to
	 * see your app results in the spotlight, you need to create an instance of this class and specify what data and what
	 * keywords you wish to have for that item.
	 * </p>
	 * 
	 * The kind of information you can set for each of your search items, have been mirrored from iOS Spotlight framework.
	 * Therefore, you can find more information about these properties if you look through the official apple documents
	 * related to spotlight search classes.
	 * 
	 * @author Hadi Tavakoli - 6/25/2016 2:25 PM
	 */
	public class AttributeSet
	{
		private var _contentType:String;
		private var _uniqueIdentifier:String;
		private var _domainIdentifier:String;
		
		public var documents:	AttributeSetDocuments = 	new AttributeSetDocuments();
		public var events:		AttributeSetEvents = 		new AttributeSetEvents();
		public var general:		AttributeSetGeneral = 		new AttributeSetGeneral();
		public var images:		AttributeSetImages = 		new AttributeSetImages();
		public var media:		AttributeSetMedia = 		new AttributeSetMedia();
		public var messaging:	AttributeSetMessaging = 	new AttributeSetMessaging();
		public var music:		AttributeSetMusic = 		new AttributeSetMusic();
		public var places:		AttributeSetPlaces = 		new AttributeSetPlaces();
		
		/**
		 * Initialize a new instance of the AttributeSet class and pass in the content type which your search item has. Also 
		 * pass in a unique identifier string so when end users click on your item in the spotlight window, you can know where
		 * to take your user inside the app because the unique identifier string will be posted to your app through the
		 * <code>SpotlightEvents.SEARCH_SELECTED</code> listene. And eventually, you will pass in the domain identifier which 
		 * will help you group your search results.
		 * 
		 * @param	$contentType		the content type your search item has. You may choose a type from <code>ContentType</code>
		 * class.
		 * @param	$uniqueIdentifier	a unique string to identify your item when users click on your search item from the 
		 * spotlight results
		 * @param	$domainIdentifier	a string to help your group your search items. grouping the items will also make it
		 * easy to delete them. for example you need to delete all indexes related to "old.apples". If you have grouped them
		 * before, you can easily use the <code>deleteItems</code> method and delete those items from the spotlight search.
		 */
		public function AttributeSet($contentType:String, $uniqueIdentifier:String, $domainIdentifier:String):void
		{
			_contentType = $contentType;
			_uniqueIdentifier = $uniqueIdentifier;
			_domainIdentifier = $domainIdentifier;
		}
		
		private function addAtt($att:Object, $attSet:Object):void
		{
			for(var name:String in $attSet.props)
			{
				if ($attSet[name] is Number)
				{
					if (!isNaN($attSet[name]))
					{
						$att[name] = $attSet[name];
					}
				}
				else
				{
					if ($attSet[name])
					{
						$att[name] = $attSet[name];
					}
				}
			}
		}
		
		/** @private */
		internal function toString():String
		{
			var obj:Object = {};
			obj.contentType = _contentType;
			obj.uniqueIdentifier = _uniqueIdentifier;
			obj.domainIdentifier = _domainIdentifier;
			
			var att:Object = {};
			addAtt(att, documents);
			addAtt(att, events);
			addAtt(att, general);
			addAtt(att, images);
			addAtt(att, media);
			addAtt(att, messaging);
			addAtt(att, music);
			addAtt(att, places);
			
			obj.attributes = att;
			
			return JSON.stringify(obj);
		}
	}
}