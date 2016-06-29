# Spotlight ANE V1.0.0 for iOS
Spotlight ANE brings iOS 9 spotlight library to Adobe Air applications. With this ANE, you can index search items at runtime and even from user generated content.

**Main Features:**
* Add search items to iOS spotlight indexing system
* group the search items for easier managing them
* delete all items or specefic groups
* Listeners to be invoked as soon as your app opens from Spotlight search results

# asdoc
[find the latest asdoc for this ANE here.](http://myflashlab.github.io/asdoc/index.html?com/myflashlab/air/extensions/spotlight/package-detail.html&com/myflashlab/air/extensions/spotlight/class-list.html)  
[How to get started? **read here**](https://github.com/myflashlab/Spotlight-ANE/wiki)

**NOTICE**: the demo ANE works only after you hit the "OK" button in the dialog which opens. in your tests make sure that you are NOT calling other ANE methods prior to hitting the "OK" button.
[Download the ANE](https://github.com/myflashlab/Spotlight-ANE/tree/master/FD/lib)

# Air Usage
```actionscript
import com.myflashlab.air.extensions.spotlight.Spotlight;
import com.myflashlab.air.extensions.spotlight.SpotlightEvents;
import com.myflashlab.air.extensions.spotlight.AttributeSet;
import com.myflashlab.air.extensions.spotlight.ContentType;

var _ex:Spotlight = new Spotlight();
_ex.addEventListener(SpotlightEvents.INDEXING_SUCCESS, onIndexingSuccess);
_ex.addEventListener(SpotlightEvents.INDEXING_FAILURE, onIndexingFailure);
_ex.addEventListener(SpotlightEvents.DELETING_SUCCESS, onDeletingSuccess);
_ex.addEventListener(SpotlightEvents.DELETING_FAILURE, onDeletingFailure);
_ex.addEventListener(SpotlightEvents.SEARCH_SELECTED, onSearchSelected);

trace("isIndexingAvailable = " + _ex.isIndexingAvailable);

// add as many required items as required by your app
var att:AttributeSet = new AttributeSet(ContentType.kUTTypeItem, "com.site.uniquIdentifier.1", "domain.identifier.1");
att.general.title = "The title";
att.documents.contentDescription = "The description";
att.general.keywords = ["Adobe Air", "ANE", "MyFLashLabs"];
att.general.thumbnailURL = File.applicationDirectory.resolvePath("spotlightIcon.jpg").nativePath;

// you should index your search items like this:
_ex.indexItems([att]);

private function onIndexingSuccess(e:SpotlightEvents):void
{
	trace("on indexing completed successfully");
}

private function onIndexingFailure(e:SpotlightEvents):void
{
	trace("on indexing failed! try again: " + e.msg);
}

private function onDeletingSuccess(e:SpotlightEvents):void
{
	trace("on deleting success");
}

private function onDeletingFailure(e:SpotlightEvents):void
{
	trace("on deleting failed: " + e.msg);
}

private function onSearchSelected(e:SpotlightEvents):void
{
	// when an item is touched in the spotlight search results, the unique identifier will be delivered here
	// so you will know which of your items has been selected and can take the user to a specefic page related
	// to what they have clicked.
	trace("on search result touched: " + e.msg);
}
```

# Air .xml manifest
```xml
<!--
FOR iOS:
-->
	<InfoAdditions>
		
		<!--
			iOS 9.0 or higher can support this ANE
			
			We have weak-referenced to iOS9 libraries so you still
			can embed this ANE in earlier iOS versions. However, it
			will work properly only on iOS 9+
		-->
		<key>MinimumOSVersion</key>
		<string>9.0</string>
		
	</InfoAdditions>
	
	
	
	
	
<!--
Embedding the ANE:
-->
  <extensions>
	
	<extensionID>com.myflashlab.air.extensions.spotlight</extensionID>
	
  </extensions>
-->
```

# Requirements 
1. iOS SDK 9.0 or higher
2. Air SDK 22 or higher

# Tech Details
* If you are testing your app in debug mode, the ```SpotlightEvents.SEARCH_SELECTED``` listener won't be dispatched when your app is launching because the debug connection process may take a while before the app starts and the event happens before you have the time to listen to it! We hope Adobe can fix this bug in future versions of Air SDK. However, when you test your app in release or adHoc mode, the ```SpotlightEvents.SEARCH_SELECTED``` listener will be dispatched everytime your app starts because of the spotlight search item being touched.

# Commercial Version
http://www.myflashlabs.com/product/ios9-spotlight-air-native-extension/

![Spotlight ANE](http://www.myflashlabs.com/wp-content/uploads/2016/04/product_adobe-air-ane-extension-spotlight-595x738.jpg)

# Tutorials
[How to embed ANEs into **FlashBuilder**, **FlashCC** and **FlashDevelop**](https://www.youtube.com/watch?v=Oubsb_3F3ec&list=PL_mmSjScdnxnSDTMYb1iDX4LemhIJrt1O)  
[How to get started with Spotlight ANE?](https://github.com/myflashlab/Spotlight-ANE/wiki)

# Changelog
*Jun 26, 2016 - V1.0.0*
* beginning of the journey!
