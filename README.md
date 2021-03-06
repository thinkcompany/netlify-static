# netlify-static

This static site is reference implementation of continuous deployment using Netlify.

Upon a merge to the `main` branch, this site is deployed to [netlify-static.netlify.com](https://netlify-static.netlify.com/)

Upon creation of any pull request, Netlify builds a [deploy preview](https://www.netlify.com/blog/2016/07/20/introducing-deploy-previews-in-netlify/) and deploys the site to an ephemeral URL.

## Contributing

You are encouraged to kick the tires on this site!

1. Clone this repository
2. In the terminal, run `npm install` to install dependencies.
3. Then run `npm run dev` to start the development server at `http://localhost:3000/`.
4. Create a feature branch
5. Push your branch to `origin`
6. Create a pull request
7. Notice all the Netlify tooling that happens when you create your pull request, and check out the deploy preview that was created.
8. Share your experience in Think Company Slack channel #devops
