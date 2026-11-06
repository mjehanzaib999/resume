# Resume, portfolio and case studies site

Three static pages published in two places from this one repository. A single
push to `main` updates both.

| Page | Railway | GitHub Pages |
|---|---|---|
| Resume | https://mjehanzaib-ai-resume.up.railway.app | https://mjehanzaib999.github.io/resume/resume.html |
| Portfolio | https://mjehanzaib-ai-portfolio.up.railway.app | https://mjehanzaib999.github.io/resume/portfolio.html |
| Case studies | https://mjehanzaib-ai-case-studies.up.railway.app | https://mjehanzaib999.github.io/resume/case-studies.html |
| Landing page | | https://mjehanzaib999.github.io/resume/ |

## Which link to use

- **Railway** links are the ones to share with people, in proposals and on profiles.
- **GitHub Pages** links are the ones to give to AI tools that need to read the
  pages, such as a Claude Project. Some fetchers cannot reach the
  `up.railway.app` subdomains and return "Cache miss"; the `github.io` links
  work there.

Both serve the same files, so the content is always identical.

## PDFs

Each PDF is served next to its page on both hosts:

| PDF | GitHub Pages |
|---|---|
| Resume | https://mjehanzaib999.github.io/resume/Muhammad_Jehanzaib_Resume.pdf |
| Portfolio | https://mjehanzaib999.github.io/resume/Muhammad_Jehanzaib_Portfolio.pdf |
| Case studies | https://mjehanzaib999.github.io/resume/Muhammad_Jehanzaib_Case_Studies.pdf |

On Railway, add the same file name to any of the three service URLs, for
example `https://mjehanzaib-ai-resume.up.railway.app/Muhammad_Jehanzaib_Resume.pdf`.

## How it is deployed

**Railway.** One Dockerfile (nginx) builds the `site/` folder. Three services
run the same image, and the `ROOT_DOC` variable picks which page answers at `/`.

| Service | `ROOT_DOC` | What `/` shows |
|---|---|---|
| `resume` | `resume.html` | the resume |
| `portfolio` | `portfolio.html` | the portfolio |
| `case-studies` | `case-studies.html` | the case studies |

Every page is also reachable on any service at `/resume.html`,
`/portfolio.html` and `/case-studies.html`.

**GitHub Pages.** The workflow in `.github/workflows/pages.yml` uploads the
`site/` folder on every push to `main`. `site/index.html` is the landing page.

## Updating

1. Edit the files under `site/`. This folder is the only source; nothing is
   edited on Railway or GitHub Pages directly.
2. Regenerate the PDFs if the content changed (Chrome headless
   `--print-to-pdf`, written into `site/`).
3. Push to `main`. Railway rebuilds the three services and GitHub Pages
   republishes, usually within a minute or two.

This repository is public, so never commit secrets to it.

## Running locally

```sh
docker build -t resume-site .
docker run --rm -p 8080:8080 resume-site                              # resume at /
docker run --rm -p 8081:8080 -e ROOT_DOC=portfolio.html resume-site     # portfolio at /
docker run --rm -p 8082:8080 -e ROOT_DOC=case-studies.html resume-site  # case studies at /
```
