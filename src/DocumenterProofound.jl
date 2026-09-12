module DocumenterProofound

using DocumenterGlossip

export assets, setup

include("page_meta.jl")
include("flowdiagram.jl")

const ASSETS_DIR = normpath(joinpath(@__DIR__, "..", "assets"))

"Path to this package's `assets/` directory, for copying/serving alongside a consumer's own docs assets."
assets_dir() = ASSETS_DIR

"""
    assets() -> Vector{String}

Paths (relative to `assets_dir()`) to pass as `Documenter.HTML(assets = ...)`, prefixed
by the caller's own asset mount point (e.g. `joinpath.("assets/proofound", assets())`).
"""
function assets()
    return [
        "documenter-proofound.css",
        "output-fold.js",
        "page-toc.js",
        "math-env.js",
        "tn-repr.js",
    ]
end

"""
    setup(src_dir::String; glossary_path="/references/glossary/")

Call once from a package's `docs/make.jl` before `makedocs`: runs the page-info and
flow-diagram markdown preprocessors over `src_dir`, plus `DocumenterGlossip.setup_glossary`.
"""
function setup(src_dir::String; glossary_path::String="/references/glossary/")
    DocumenterGlossip.setup_glossary(src_dir; glossary_path=glossary_path)
    preprocess_page_meta(src_dir)
    preprocess_flowdiagrams(src_dir)
    return nothing
end

end # module
