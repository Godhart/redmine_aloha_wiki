# redmine_aloha_wiki

is Aloha-editor based WYSIWYG Wiki editor plugin for Redmine. It's currently in early test stage. Known issues are listed below.

# Installation

1. Prior to using this plugin do install [redmine_conv_htmltotextile](https://github.com/Godhart/redmine_conv_htmltotextile) plugin
2. Copy the plugin directory into the `vendor/plugins` directory (make sure the name is redmine_aloha_wiki)
3. Run migration: `rake db:migrate:plugins` _(don't forget to be in the root redmine directory when doing this)_
4. Restart Redmine: `touch tmp/restart.txt` _(don't forget to be in the root redmine directory when doing this)_
5. From now on you'll be able to chose WYSIWYG editor when editing Wiki page, no settings required

**NOTE:** _Probably plugin is incompatible with your current WYSIWYG plugins so be sure to uninstall/deactivate them_

# Usage

After installing plugin there would be new links in the top of Wiki editing page, allowing you to switch between WYSIWYG and Textile modes.

When entering Wiki edit page by default there would be well-known Textile editor as it were there in old good times.

After switching to WYSIWYG editor Textile box would be replaced with HTML content. To edit content just click in the area. After clicking there you'll see cursor blinking and editor menu floating nearby. Enjoy - it's very intuitive.

When in WYSIWYG mode you can always return to Textile mode by pressing link in the top of page. More of it - currently you **SHOULD** do it just before you want to press **'Save'** button. That's current restriction to WYSIWYG mode.

# Limitations

Aloha editor currently lacks of some features:

1. Can't underline
2. Can't add natively wiki link
3. Can't add natively redmine stored image
4. Can't do citation
5. Can't do preformated/code blocks
6. Can't adjust alignment
7. Can't set abbreviation
8. Most annoying - an issue with a backspace - backspace does nothing for me when I'm pressing it. Probably it's could be due to library conflict between Prototype (used in Redmine) and JQuery (used in Aloha-editor) since demos on [Aloha-editor site](http://aloha-editor.org) are just fine.

Another limitation already mentioned above and **most critical** for now - you should switch back to Textile mode before saving. Hope that link above 'Save' button would remind you about this each time you about to save. It was done by intention as plugin is now in early test stage and it's always good to take a look on Textile code before saving.

# Disclaimer

Plugin provided "as is" under copyleft license and it'll always be like this.

Plugin is tested only for Redmine v.1.4. There is no guarantee that it would work for other versions of Redmine.

I'm real newbie to Ruby, Rails, Redmine and not doing well with HTML things so you may find some ugly things within code. A good advice is always welcomed.

# Word of thanks

Thanks to P.J.Lawrence who started [redmine_wysiwyg_textile](https://github.com/kalmykov/redmine_wysiwyg_textile) plugin and Alexey Kalmykov who made some corrections as I've heavily used that plugin to get HTML to textile conversion in my redmine_conv_htmltotextile plugin. Actualy I took it's core and did some adjustments.

[Stackoverflow](http://stackoverflow.com) people as it's there I found most answers to my questions (thank's to Google but anyway...)

World of opensource
