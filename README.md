# cd-static

A reference implementation of continuous deployment to Netlify for a static site.

Upon a merge to the `develop` branch, the site is deployed to Netlify.

This repo will also be used to check Netlify [branch deploys and branch previews](https://www.netlify.com/blog/2017/11/16/get-full-control-over-your-deployed-branches/).

# How does it work?

Netlify watches this repository on BitBucket.  Upon a push to the repository, Netlify takes actions to be further described here.

## Watermarking the site before deploy

Before deploying to each location, Netlify's build process will use the Linux [sed](https://linux.die.net/man/1/sed) search-and-replace utility to add the build number, commit hash, location, and time to `index.html`.

That way, you don't have to keep asking yourself or other people "Is this the latest code?"

The build number and commit hash are available as [default variables](https://confluence.atlassian.com/bitbucket/variables-in-pipelines-794502608.html) in BitBucket pipelines; we'll have to see if the same things are available in Netlify.

The deployed page also uses a Javascript [timeago](https://timeago.org/) utility to format the deploy time so that the page will say "3 days ago" rather than an ISO 8601 datestamp that requires some thinking.
