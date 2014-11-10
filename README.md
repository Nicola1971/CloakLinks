CloakLinks
==========

Affiliate Link Cloaker snippet for MODX Evolution 

![cloaklink] (https://raw.githubusercontent.com/Nicola1971/training-materials/master/Images/cloak/cloak-links-affiliate-modx-snippet.jpg)

Encode urls in base64 and redirect through a blocked page/folder

credits: http://ctrtard.com/affiliate-marketing/better-affiliate-link-cloaking-for-seo/   
 
# Install instructions

### Create the redirect landing page
* create a new resource with the name of your choice
* add ```[[CloakLinksRedirect]]``` snippet call
* This page must be noindex-nofollow in the robots metatags and/or "Disallow" in the robot.txt 

### Create a Cloaked link (Example calls)
#### method 1: using a template variable 
```[!CloakLinks? &landing=`49` &textlink=`site preview` &LinkTv=`AffiliateLink`!]```

#### method 2 
```[!CloakLinks? &landing=`49` &textlink=`site preview` &LinkWeb=`http://modx.com/`!]```

### Custom Url Parameter
#### method 1 + custom url parameter 
```[!CloakLinks? &landing=`49` &urlparam=`visit` &textlink=`site preview` &LinkTv=`AffiliateLink`!]```
#### Landing page + custom url parameter 
```[!CloakLinksRedirect? &urlparam=`visit`!]```

 
## Parameters:
* &textlink = text placeholder | default value: "Go to the website"
* &targetlink = href target attribute | default value: "_blank"
* &landing = resource id of the landing page for redirect (must contain a [[CloakLinksRedirect]] snippet call)
* &LinkTv = (method 1) name of the Text template variable containing the affiliate link
* &LinkWeb = (method 2) full affiliate link
* &urlparam = custom parameter url | default value: "goto"
* &ErrorEmptyLink = text placeholder for empty tv and/or missing linkweb parameter | default value: "Empty Link"



