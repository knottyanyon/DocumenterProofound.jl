using Documenter
using Documenter: Remotes
using DocumenterProofound

src_dir = joinpath(@__DIR__, "src")

# Vendor this package's own compiled theme CSS/JS into docs/src/assets/proofound/ -
# Documenter only serves files under docs/src/assets/.
let assets_src = DocumenterProofound.assets_dir(), assets_dst = joinpath(src_dir, "assets", "proofound")
    isdir(assets_dst) && rm(assets_dst; recursive=true)
    mkpath(dirname(assets_dst))
    cp(assets_src, assets_dst)
end

DocumenterProofound.setup(src_dir)

makedocs(;
    modules=[DocumenterProofound],
    authors="knottyanyon",
    sitename="DocumenterProofound.jl",
    repo=Remotes.GitHub("knottyanyon", "DocumenterProofound.jl"),
    format=Documenter.HTML(;
        canonical="https://knottyanyon.github.io/DocumenterProofound.jl",
        edit_link="main",
        assets=joinpath.("assets/proofound", DocumenterProofound.assets()),
    ),
    pages=["Home" => "index.md", "Kitchen Sink" => "kitchen_sink.md"],
)

if get(ENV, "CI", "false") == "true"
    deploydocs(; repo="github.com/knottyanyon/DocumenterProofound.jl", devbranch="main")
end
