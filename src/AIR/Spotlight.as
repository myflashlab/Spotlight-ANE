package com.myflashlab.air.extensions.spotlight
{
	import flash.events.EventDispatcher;
	import flash.external.ExtensionContext;
	import flash.events.StatusEvent;
	import flash.utils.getDefinitionByName;
	import flash.utils.getQualifiedClassName;

	/**
	 * The Spotlight ANE will let you index your suggested keywords even in runtime with user generated content and
	 * your search results will be immediately shown in the iOS spotlight window.
	 * 
	 * @author Hadi Tavakoli - 6/23/2016 1:27 PM
	 */
	public class Spotlight extends EventDispatcher
	{
		/** @private */
		internal static const DEMO_ANE:Boolean = true;
		
		public static const EXTENSION_ID:String = "com.myflashlab.air.extensions.spotlight";
		public static const VERSION:String = "1.0.31";
		private var _context:ExtensionContext;
		
		private var OverrideClass:Class;
		
		/**
		 * <p>
		 * To use Spotlight ANE, you should initialize it in your app the soonest possible and make sure that you have
		 * added the <code>SpotlightEvents.SEARCH_SELECTED</code> listener as early as possible. The reason is that when
		 * a user selects your item from the spotlight search items, your app will be launched and the and the item's
		 * unique identifier string will be sent to the SEARCH_SELECTED event.
		 * </p>
		 * 
		 * <p>
		 * <b>Notice:</b> If you are testing your app in debug mode, the <code>SpotlightEvents.SEARCH_SELECTED</code> listener
		 * won't be dispatched when your app is launching because the debug connection process may take a while before the
		 * app starts and the event happens before you have the time to listen to it! We hope Adobe can fix this bug in future
		 * versions of Air SDK. However, when you test your app in release or adHoc mode, the <code>SpotlightEvents.SEARCH_SELECTED
		 * </code> listener will be dispatched everytime your app starts because of the spotlight search item being touched.
		 * </p>
		 */
		public function Spotlight():void
		{
			OverrideClass = getDefinitionByName("com.myflashlab.air.extensions.dependency.OverrideAir") as Class;
		
			// Tell Override ANE to read the ANE-LAB ID from the manifest. This must happen on Android and iOS.
			// Pass id/version of this ANE to Override ANE so it can check its validity.
			OverrideClass["applyToAneLab"](getQualifiedClassName(this));
			
			_context = ExtensionContext.createExtensionContext(EXTENSION_ID, null);
			_context.addEventListener(StatusEvent.STATUS, onStatus);
			
			// let Override ANE know that this ANE needs access to iOS overrides
			OverrideClass["applyToOverrides"](_context);
			
			// show a dialog on the test version of the extension
			if (Spotlight.DEMO_ANE) _context.call("command", "isTestVersion");
		}
		
		private function onStatus(e:StatusEvent):void
		{
			switch (e.code) 
			{
				case SpotlightEvents.INDEXING_SUCCESS:
					
					dispatchEvent(new SpotlightEvents(SpotlightEvents.INDEXING_SUCCESS));
					
					break;
				case SpotlightEvents.INDEXING_FAILURE:
					
					dispatchEvent(new SpotlightEvents(SpotlightEvents.INDEXING_FAILURE, e.level));
					
					break;
				case SpotlightEvents.DELETING_SUCCESS:
					
					dispatchEvent(new SpotlightEvents(SpotlightEvents.DELETING_SUCCESS));
					
					break;
				case SpotlightEvents.DELETING_FAILURE:
					
					dispatchEvent(new SpotlightEvents(SpotlightEvents.DELETING_FAILURE, e.level));
					
					break;
				case SpotlightEvents.SEARCH_SELECTED:
					
					dispatchEvent(new SpotlightEvents(SpotlightEvents.SEARCH_SELECTED, e.level));
					
					break;
			}
		}
		
// ------------------------------------------------------------------------------------------------------------------------------------ methods

		/**
		 * Call this method while passing in an Array of <code>AttributeSet</code> so the ANE can index these search items in the device. The result
		 * of the process will be dispatched through <code>SpotlightEvents.INDEXING_SUCCESS</code> or <code>SpotlightEvents.INDEXING_FAILURE</code>.
		 * 
		 * @param	$itemsArray
		 * 
		 * @see #deleteItems()
		 */
		public function indexItems($itemsArray:Array):void
		{
			var currAtt:AttributeSet;
			var currAttStr:String;
			var currAttObj:Object;
			var finalArr:Array = [];
			for (var i:int = 0; i < $itemsArray.length; i++) 
			{
				currAtt = $itemsArray[i] as AttributeSet;
				currAttStr = currAtt.toString();
				currAttObj = JSON.parse(currAttStr);
				finalArr.push(currAttObj);
			}
			
			_context.call("command", "indexItems", JSON.stringify(finalArr));
		}
		
		/**
		 * If you can add items to spotlight, you need to be able to delete them and this method does just that. If you call this method
		 * without any parameters, it will delete all the items indexed before but you may use the method arguments to filter the type of
		 * information your wish to delete. The result of the process will be dispatched through <code>SpotlightEvents.DELETING_SUCCESS
		 * </code> or <code>SpotlightEvents.DELETING_FAILURE</code>.
		 * 
		 * @param	$identifiers		An Array of unique identifiers Strings which you wish to delete.
		 * @param	$domainIdentifiers	An Array of domain identifiers which you had used before for grouping your search items.
		 * 
		 * @see #indexItems()
		 */
		public function deleteItems($identifiers:Array=null, $domainIdentifiers:Array=null):void
		{
			if ($identifiers)
			{
				_context.call("command", "deleteItemsWithIdentifiers", JSON.stringify($identifiers));
			}
			else if ($domainIdentifiers)
			{
				_context.call("command", "deleteItemsWithDomainIdentifiers", JSON.stringify($domainIdentifiers));
			}
			else
			{
				_context.call("command", "deleteAllItems");
			}
		}

// ------------------------------------------------------------------------------------------------------------------------------------ properties

		/** @private */
		public function get context():ExtensionContext
		{
			return _context;
		}
		
		public function get isIndexingAvailable():Boolean
		{
			return _context.call("command", "isIndexingAvailable") as Boolean;
		}
	}
}