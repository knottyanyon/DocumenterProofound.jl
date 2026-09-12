# DocumenterProofound.jl

A reusable [Documenter.jl](https://github.com/JuliaDocs/Documenter.jl) theme + preprocessor
pipeline, extracted from Qritical.jl's docs: colored theorem/definition/proof admonitions,
math-environment boxes, an on-page TOC, a version badge, a tutorials card grid, a
tensor-network representation switcher, and an interactive flow-diagram embed system —
loaded alongside Documenter's default theme, not replacing it.

Depends on [DocumenterGlossip.jl](https://github.com/knottyanyon/DocumenterGlossip.jl) for
glossary linking.

## Usage

In `docs/make.jl`:

```julia
using Documenter, DocumenterProofound

src_dir = joinpath(@__DIR__, "src")
DocumenterProofound.setup(src_dir)  # glossary links, page-info drawers, flow diagrams

makedocs(;
    format=Documenter.HTML(;
        assets=joinpath.("assets/proofound", DocumenterProofound.assets()),
    ),
    ...
)
```

Copy (or symlink) `DocumenterProofound.assets_dir()` into your `docs/src/assets/proofound/`
before building — Documenter only serves assets that live under `docs/src/assets/`.

## Rebuilding the theme CSS

The compiled `assets/documenter-proofound.css` is generated from the SCSS partials in `sass/`:

```julia
using DocumenterTools
DocumenterTools.Themes.compile("sass/documenter-proofound.scss", "assets/documenter-proofound.css")
```
