#-------------------------
# renovate rebuild trigger
# https://www.ruby-lang.org/en/downloads/branches/
#-------------------------

# makes lint happy
FROM scratch


# renovate: datasource=github-releases depName=containers/skopeo
ENV SKOPEO_VERSION=1.13.3
