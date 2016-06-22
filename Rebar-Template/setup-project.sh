
echo "Please enter bundle identifier: "
read bundle_identifier

# Replace the bundle identifier
find . -name '*.pbxproj' -print0 | xargs -0 sed -i "" "s/io.monkton.rebarapp/$bundle_identifier/g"

# Replace the bundle identifier in entitlements
find . -name '*.entitlements' -print0 | xargs -0 sed -i "" "s/io.monkton.rebarapp/$bundle_identifier/g"




# Find the bundle prefix
echo "Please enter bundle prefix: (From Developer Portal) "
read prefix_identifier

# Update the configuration files
find . -name '*.json' -print0 | xargs -0 sed -i "" "s/your-app-identifier/$prefix_identifier.apps/g"

# Update the entitlements for the prefix
find . -name '*.entitlements' -print0 | xargs -0 sed -i "" "s/your-app-identifier/$prefix_identifier.apps/g"




# Add the API URL
echo "Please enter api url: (https://api.example.com/v1) "
read url_identifier

# Update the configuration files
find . -name '*.json' -print0 | xargs -0 sed -i "" "s#https://api.example.com/v1#$url_identifier#g"


