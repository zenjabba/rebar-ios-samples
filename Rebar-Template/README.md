
# Rebar Template

This project is a template to build apps with Rebar. It is meant to have the basic building blocks for starting an app.

# Configuring Project

Rebar can be easily configured with by running the `./setup-project.sh` command at the root of the project. This will replace all the necessary configuration settings for a seameless setup.

Setup will prompt for:

* Bundle Identifier: The identifer used within the app
* Bundle Prefix: The prefix used by the app, found in the developer portal
* API Url: The API Endpoint of your application, eg: https://api.example.com/v1
* URL Scheme: The URL Scheme for the app to be opened by other apps

After running this script, the bulk of the setup is now done. Developers may need to chose the provisioning profile. 

## Runtime Error

If the script will not run, permissions may need to be modified `chmod 777 setup-project.sh`
