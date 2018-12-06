# Spotlight ANE for iOS Adobe AIR apps #
Spotlight ANE brings iOS 9 spotlight library to Adobe Air applications. With this ANE, you can index search items at runtime and even from user generated content.

**Main Features:**
1. Add search items to iOS spotlight indexing system
1. group the search items for easier managing them
1. delete all items or specefic groups
1. Listeners to be invoked as soon as your app opens from Spotlight search results

* [Click here for ASDOC](https://myflashlab.github.io/asdoc/com/myflashlab/air/extensions/spotlight/package-detail.html)
* [See the ANE setup requirements](https://github.com/myflashlab/Spotlight-ANE/blob/master/src/ANE/extension.xml)

**IMPORTANT:** Implementing ANEs in your AIR projects means you may be required to add some [dependencies](https://github.com/myflashlab/common-dependencies-ANE) or copy some frameworks or editing your app's manifest file. Our ANE setup instruction is designed in a human-readable format but you may still need to familiarize yourself with this format. [Read this post for more information](https://www.myflashlabs.com/understanding-ane-setup-instruction/)

If you think manually setting up ANEs in your projects is confusing or time-consuming, you better check the [ANELAB Software](https://github.com/myflashlab/ANE-LAB/).

[![The ANE-LAB Software](https://www.myflashlabs.com/wp-content/uploads/2017/12/myflashlabs-ANE-LAB_features.jpg)](https://github.com/myflashlab/ANE-LAB/)

# Tech Support #
If you need our professional support to help you with implementing and using the ANE in your project, you can join [MyFlashLabs Club](https://www.myflashlabs.com/product/myflashlabs-club-membership/) or buy a [premium support package](https://www.myflashlabs.com/product/myflashlabs-support/). Otherwise, you may create new issues at this repository and the community might help you.

# Air Usage
```actionscript
import com.myflashlab.air.extensions.spotlight.*

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

Are you using this ANE in your project? Maybe you'd like to buy us a beer :beer:?

[![paypal](https://www.paypalobjects.com/en_US/i/btn/btn_donateCC_LG.gif)](https://www.paypal.com/cgi-bin/webscr?cmd=_donations&business=payments@myflashlabs.com&lc=US&item_name=Donation+to+RateMe+ANE&no_note=0&cn=&currency_code=USD&bn=PP-DonationsBF:btn_donateCC_LG.gif:NonHosted)

Add your name to the below list? Donate anything more than $100 and it will be.

## Sponsored by... ##
<table align="left">
    <tr>
        <td align="left"><img src="https://via.placeholder.com/128?text=LOGO" width="60" height="60"></td>
        <td align="left"><a href="#">your_website.com</a><br>Your company motto can be here!</td>
    </tr>
</table>