# Copy src/index.html to dist/index.html
cp src/index.html dist/

# Speak environment variables into the deploy log
echo "BRANCH is $BRANCH"
echo "HEAD is $HEAD"
echo "PULL_REQUEST is $PULL_REQUEST"
echo "REVIEW_ID is $REVIEW_ID"

# Use sed to watermark dist/index.html
cd dist
sed -i "s/\$BRANCH/$(echo $HEAD | sed "s/\//\\\//g")/g" index.html
sed -i "s/\$COMMIT/$(echo $COMMIT_REF | cut -c1-7)/g" index.html
sed -i "s/\$TIME/$(date)/g" index.html
