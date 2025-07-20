# CUSTOM TURBO-REPO SETUP 🚀

## IMPORTANT ☢️

The folder of repo named **scaffolds** should be copied at root of your home to make script work properly and generate pre filled src.
To be sure it is in right position the command

```bash
pwd
```

should return as result `/home/<your linux username>/scaffolds`.

In scripts like `build` delete commands relative to `prisma` if you use a different `ORM` or you just did not implement tables yet.

## Info ℹ️

I wrote this script after using Turborepo for the first time in one of my learning projects.
Before that, I often duplicated logic between the client and server, which led to redundant code and occasional desync errors in shared types or data.

During setup and management, I ran into some common pitfalls.
So I decided to save my working configuration in a script to avoid repeating mistakes and, maybe, help others who are approaching Turborepo for the first time.

This is not a definitive version — I'm still improving it as I keep learning new tools or discovering better ways to organize full-stack monorepos.
I plan to keep extending the script with more features and refinements over time.

Any advice, ideas, or suggestions to improve it are always welcome 💡
