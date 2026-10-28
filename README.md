# Resume and portfolio site

Two static pages, served by nginx, deployed on Railway as two services from this
one repository.

| Service | `ROOT_DOC` | What `/` shows |
|---|---|---|
| `resume` | `resume.html` | the resume |
| `portfolio` | `portfolio.html` | the portfolio |

Both pages are also reachable on either service at `/resume.html` and
`/portfolio.html`, and the PDFs at `/Muhammad_Jehanzaib_Resume.pdf` and
`/Muhammad_Jehanzaib_Portfolio.pdf`.

## Updating

Edit the files under `site/`, regenerate the PDFs if the content changed, and
push to `main`. Railway rebuilds both services.

## Running locally

```sh
docker build -t resume-site .
docker run --rm -p 8080:8080 resume-site                           # resume at /
docker run --rm -p 8081:8080 -e ROOT_DOC=portfolio.html resume-site  # portfolio at /
```
