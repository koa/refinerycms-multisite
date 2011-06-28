Simple Multisite-Plugin for refinery-cms
========================================

## Idea
With this Plugin you can have Multiple Site in one Refinery-Instance by
switching the Menu-Tree and the Style-Sheet based on the hostname.

## Integrate in your own Refinery Project

Add following line to your Gemfile:

    gem "refinerycms-multisite"

And update your Project by executing the following commands

    bundle
    rails g refinerycms_multisite
    rake db:migrate

### Stylesheet
Write your site-specific stylesheet to public/stylesheets.

### Entring Site-Data
Go to the Page `refinery/sites` and add a Start-Site. You have to select the
Root-Page and enter the stylesheet-name and all valid hostnames for this site.

## How to test
call script/test.sh