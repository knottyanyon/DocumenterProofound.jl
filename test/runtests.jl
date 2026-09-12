using DocumenterProofound
using Test

@testset "DocumenterProofound" begin
    @test "documenter-proofound.css" in DocumenterProofound.assets()
    @test isfile(joinpath(DocumenterProofound.assets_dir(), "documenter-proofound.css"))

    @test DocumenterProofound.page_meta_preprocessor("{page-info\nstatus: draft\n}") !=
        "{page-info\nstatus: draft\n}"

    @test DocumenterProofound.flowdiagram_preprocessor(
        "{{flowdiagram: numerical-routines/svd-truncation-decision}}", 0
    ) != "{{flowdiagram: numerical-routines/svd-truncation-decision}}"
end
