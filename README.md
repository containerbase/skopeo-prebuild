![build](https://github.com/visualon/skopeo-prebuild/actions/workflows/build.yml/badge.svg)
![GitHub release (latest SemVer)](https://img.shields.io/github/v/release/visualon/skopeo-prebuild)
![GitHub](https://img.shields.io/github/license/visualon/skopeo-prebuild)

# skopeo

prebuild skopeo[^1] binaries for containerbase[^2]

## Development

`mise install` installs Node.js, pnpm, jactionlint, shellcheck and zizmor, then `pnpm install --frozen-lockfile` installs the dependencies.

```bash
pnpm lint            # pnpm oxfmt-fix to fix the formatting
jactionlint          # the GitHub workflows
zizmor .github/      # security audit of the GitHub workflows
```

CI runs jactionlint and zizmor through mise in the `lint` job, and the commit hook runs them on staged workflow files.

[^1]: https://github.com/containers/skopeo

[^2]: https://github.com/containerbase/buildpack
