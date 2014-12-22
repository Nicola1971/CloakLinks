/**
 * CloakLinks
 *
 * CloakLinks 1.0.1 - cloak affiliate links base64 encoder
 *
 * @version     1.0.1
 * @author      Author: Nicola Lambathakis http://www.tattoocms.it/
 * @category snippet
 * @internal @modx_category Cloak Affiliate Links
 * @license http://www.gnu.org/copyleft/gpl.html GNU Public License (GPL)
 * @internal @installset base, sample
 */
// CloakLinks
// author: by Nicola Lambathakis
// credits: http://ctrtard.com/affiliate-marketing/better-affiliate-link-cloaking-for-seo/
//
// method 1: using a template variable [!CloakLinks? &landing=`49` &textlink=`site preview` &LinkTv=`AffiliateLink`!]
// method 1 + custom url parameter [!CloakLinks? &landing=`49` &urlparam=`visit` &textlink=`site preview` &LinkTv=`AffiliateLink`!]
// method 2 [!CloakLinks? &landing=`49` &textlink=`site preview` &LinkWeb=`http://modx.com/`!]
//
// Parameters:
// &textlink = text placeholder | default value: "Go to the website"
// &targetlink = href target attribute | default value: "_blank"
// &landing = resource id of the landing page for redirect (must contain a [[CloakLinksRedirect]] snippet call)
// &LinkTv = (method 1) name of the Text template variable containing the affiliate link
// &LinkWeb = (method 2) full affiliate link
// &urlparam = custom parameter url | default value: "goto"
// &ErrorEmptyLink = text placeholder for empty tv and/or missing linkweb parameter | default value: "Empty Link"

$textlink = isset ($textlink) ? $textlink : "Go to the website";
$linkelements = isset ($linkelements) ? $linkelements : "";
$targetlink = isset ($targetlink) ? $targetlink : "_blank";
$landing = isset ($landing) ? $landing : "[*id*]";
$landingurl = ($modx->makeUrl($landing, '', '', 'full'));
$LinkWeb = isset($LinkWeb) ? $LinkWeb : '';
$LinkTv = isset($LinkTv) ? $LinkTv : '';
$ErrorEmptyLink = isset($ErrorEmptyLink) ? $ErrorEmptyLink : "Empty Link";
$urlparam = isset($urlparam) ? $urlparam : "goto";

if($LinkTv == ""){
$url = $LinkWeb;
} else {
$Link = $modx->getTemplateVarOutput(''.$LinkTv.'',$id);
$url = $Link[''.$LinkTv.''];
}

$url = base64_encode($url);
$url = urlencode($url);

$linkurl = "<a $linkelements="" target="\"$targetlink\"" rel="\"nofollow\"" href="\"$landingurl&$urlparam=$url\"">$textlink</a>";

if($LinkTv == "" && $LinkWeb == ""){
echo $ErrorEmptyLink;
} else {
echo $linkurl;
}