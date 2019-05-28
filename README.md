Version 1.1
#Base image
	Docker Small Web Server < 7 MB
		This is a Minimal docker image/compose for nginx webserver for your static web pages. It's less than 7 MB in total.

#Service
	Serves a set of static files generated using Wp2static plugin v.7 (7.0-build0002, dated 05-21-2019, pre-release)
	Website: Islandwines.hk

#Usage
	docker-compose build
	docker-compose up -d

#Required tweaks
##	Ownership
	    chown -R www-data:www-data *
##	Wp2static settings:
###        URL Detection:
*            All published Pages. Use the date range option below to further filter.
*            All published Posts. Use the date range option below to further filter.
*            Include URLs for all Custom Post Types.
*            The additional URLs for attachments, such as images. Usually not needed.
*            Get all paginated URLs for Posts.
*            Get all paginated URLs for Categories.
*            Get all URLs within Parent Theme dir.
*            Get all URLs within Child Theme dir.
*            Get all public URLs for WP uploads dir.
*            Get all public URLs for wp-includes assets.
###        Processing:
*            Rewrite Links in source code
  *              var/www/wp-content/uploads,wp-content/uploads
*            Rename Exported Directories
  *              var/www/wp-content/uploads,wp-content/upload
*            Allow offline usage OFF
###       Deployment
*            ZIP archive
*            destination URL http://localhost
##    	   After running Crawl&process        
          	Crawl&process delivers var/www/wp-content/uploads contents as wp-content/uploads,
        	but the contents are corrupted
        	(all jpgs are 10KB and broken)
    	Copying /wp-content/uploads from source

#Working static website:
*	274MB (wp-content/uploads = 99.9% of it)
*	5600+ files
*	accessible on http://localhosti

#Changelog
###v.1.1

*   Content changes
 *       removed unused plugins
 *       removed unused images (~750)
 *       removed checkout and cart
*    Rewriten wp-related paths
 *       Rewrite Links in source code
  * wp-content/themes/,lib/
  * wp-content/plugins/,src/
  * wp-content/uploads/,images/
  * wp-admin/,local/
  * wp-includes/,cssjs/
  * lib/twentyfourteen/,lib/layout/
 *       Rename Exported Directories
  * wp-content/themes,lib
  * wp-content/plugins,src
  * wp-content/uploads,images
  * wp-admin,local
  * wp-includes,cssjs
  * lib/twentyfourteen,lib/layout
* Added a script to automate the process of copying static files from downloads to work dir
 * copy-files.sh
* Added integration with Dockerhub
 * Moved Dockerfile and other files from /image to .
# minimal-iw-wp2st
