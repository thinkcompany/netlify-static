# Copy src/index.html to dist/index.html
# In a "real" site, this would be handled by something like Webpack
cp src/index.html dist/

# Add a watermark
# For pull requests: "Commit abc123 on branch 'feature/new-feature' for PR#456 deployed three days ago'"
# For a master deploy: "Commit abc123 deployed three days ago"

cd dist

# Truncate long commit hashes to five characters
sed -i "s/\$COMMIT/$(echo $COMMIT_REF | cut -c1-5)/g" index.html

# Escape forward slashes in branch names.
sed -i "s/\$BRANCH/$(echo "$HEAD" | sed 's~\/~\\\/~g')/g" index.html

# If this is a pull request, add a pull request link.  Otherwise, skip it.

if [ "$PULL_REQUEST" = "true" ]
then
    echo "PULL_REQUEST = true"
    sed -i "s/\$PR_NUMBER/$REVIEW_ID/g" index.html
else
    echo "PULL_REQUEST != true"
    sed -i "s/<!-- pr.*//g" index.html
    sed -i "s/<!-- branch.*//g" index.html
fi

# Add a date, which timeago.js will display as 'just now' or 'two minutes ago'
sed -i "s/\$TIME/$(date)/g" index.html
