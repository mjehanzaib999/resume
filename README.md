# Resume and portfolio site

- **Resume:** https://mjehanzaib-ai-resume.up.railway.app
- **Portfolio:** https://mjehanzaib-ai-portfolio.up.railway.app
- **Case studies:** https://mjehanzaib-ai-case-studies.up.railway.app

Three static pages, served by nginx, deployed on Railway as three services from
this one repository.

| Service | `ROOT_DOC` | What `/` shows | Live |
|---|---|---|---|
| `resume` | `resume.html` | the resume | https://mjehanzaib-ai-resume.up.railway.app |
| `portfolio` | `portfolio.html` | the portfolio | https://mjehanzaib-ai-portfolio.up.railway.app |
| `case-studies` | `case-studies.html` | the case studies | https://mjehanzaib-ai-case-studies.up.railway.app |

Every page is also reachable on any service at `/resume.html`,
`/portfolio.html` and `/case-studies.html`, and the PDFs at
`/Muhammad_Jehanzaib_Resume.pdf`, `/Muhammad_Jehanzaib_Portfolio.pdf` and
`/Muhammad_Jehanzaib_Case_Studies.pdf`.

## Updating

Edit the files under `site/`, regenerate the PDFs if the content changed, and
push to `main`. Railway rebuilds all three services.

## Running locally

```sh
docker build -t resume-site .
docker run --rm -p 8080:8080 resume-site                           # resume at /
docker run --rm -p 8081:8080 -e ROOT_DOC=portfolio.html resume-site  # portfolio at /
```
