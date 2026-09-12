using Documenter
using DocumenterProofound

makedocs(;
    modules=[DocumenterProofound],
    authors="knottyanyon",
    sitename="DocumenterProofound.jl",
    repo="https://github.com/knottyanyon/DocumenterProofound.jl/blob/{commit}{path}#{line}",
    format=Documenter.HTML(; edit_link="main"),
    pages=["Home" => "index.md"],
)
