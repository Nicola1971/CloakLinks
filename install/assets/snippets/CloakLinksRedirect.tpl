/**
 * CloakLinksRedirect
 *
 * CloakLinksRedirect 1.0 - cloak affiliate links base64 decoder and redirect
 *
 * @version     1.0
 * @author      Author: Nicola Lambathakis http://www.tattoocms.it/
 * @category snippet
 * @internal @modx_category Cloak Affiliate Links
 * @license http://www.gnu.org/copyleft/gpl.html GNU Public License (GPL)
 * @internal @installset base, sample
 */

// CloakLinksRedirect
// author: by Nicola Lambathakis
// Cloak links base64 decoder and redirect
// pass a get variable 'goto=' with value that's urlencoded and base64 encoded
// basic call [!CloakLinksRedirect!]
// example call with custom url parameter [!CloakLinksRedirect? &urlparam=`visit`!]

$urlparam = isset($urlparam) ? $urlparam : "goto";
$item = $_GET[$urlparam];
$url = urldecode($item);
$url = base64_decode($url);
header("Location: $url");