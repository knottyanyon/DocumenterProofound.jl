using Documenter
using DocumenterProofound

src_dir = joinpath(@__DIR__, "src")

# Vendor this package's own compiled theme CSS/JS into docs/src/assets/proofound/ -
# Documenter only serves files under docs/src/assets/.
let assets_src = DocumenterProofound.assets_dir(), assets_dst = joinpath(src_dir, "assets", "proofound")
    isdir(assets_dst) && rm(assets_dst; recursive=true)
    cp(assets_src, assets_dst)
end

DocumenterProofound.setup(src_dir)

makedocs(;
    modules=[DocumenterProofound],
    authors="knottyanyon",
    sitename="DocumenterProofound.jl",
    repo="https://github.com/knottyanyon/DocumenterProofound.jl/blob/{commit}{path}#{line}",
    format=Documenter.HTML(;
        edit_link="main",
        assets=joinpath.("assets/proofound", DocumenterProofound.assets()),
    ),
    pages=["Home" => "index.md", "Kitchen Sink" => "kitchen_sink.md"],
)
