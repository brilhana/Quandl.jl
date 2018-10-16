@testset "Auth token generation is successful"
    include(joinpath(dirname(@__FILE__),"../src/Quandl.jl"))

    @testset "created an empty token file after importing module"
        @testset "created token file"
            @test isfile(joinpath(dirname(@__FILE__),"../token/auth_token")) == true
        end

        @testset "token file is empty"
            @test open(readall, joinpath(dirname(@__FILE__),"../token/auth_token")) == ""
        end
    end

    @testset "invalid tokens detected"
        @testset "detects short token"
            @test Quandl.set_auth_token("a")
        end

        @testset "detects long token"
            @test Quandl.set_auth_token("a"^21)
        end
    end
end
