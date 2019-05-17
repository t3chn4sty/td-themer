# td-themer
Google ITRP | Ticket Dispatcher Theme Automation Script


-- Background --
Ticket Dispatcher allows custom theme creation.  If you are not satisfied with the default or optional built-in color themes, you can create your own by following the guide located at go/td-themes.

For those who are not comfortable following the guide but still want custom themes, there is a script to automate the process for you.



-- I'm in!  What do I do? --
Great question.  You'll need to do this on a gLinux workstation or Cloudtop device.  Text like this are commands that need ran in in a terminal, so go ahead and open a terminal window.

-- Download td_themer here --
Run this command in the terminal window:

cd ~/Downloads && tar -xvzf td_themer.sh.tar.gz && chmod +x td_themer.sh && ./td_themer.sh

Follow the prompts.


-- Prompts?  HELP! --
Here are the prompts you'll respond to in the script:

"What is the name of your CitC client?"
This is the workspace name to test out the theme before submitting it for everyone else to use

You can create a new workspace with this command:

g4d -f <workspacename>

e.g. g4d -f steveo_test

"What do you want to call the new theme?"
Name the theme

"Now choose your colors" (primary, accent, warning)
Color Choices:
red, pink, purple, indigo, blue, cyan, teal, green, lime, yellow, amber, orange, grey

"Are you ready to continue? [y/n]"
If you're ready, give this a yes.

-- Okay, what's happening now?! --
You're spinning up a dev instance of TD.  Let Blaze run its course until it says the dev instance is ready.  The output will state "Server listening on http://<your_hostname>:5432/


-- Final Steps --
Navigate to http://localhost:5432 in Chrome, login with your corp credentials if prompted, and you'll be greeted with your test instance of TD.

Select Preferences, and find the Theme dropdown menu under the General heading.  Here you can select  your newly-created theme.

Look good?  Refer to go/td-themes for info regarding the process for your theme to be added to Ticket Dispatcher.
