using DataFrames 
 
include(joinpath(dirname(@__FILE__),"../src/dataframe.jl"))
 
#r  = load(joinpath(dirname(@__FILE__),"resp.jld"), "resp")
#df = dataframe(r)

@testset "dataframe works on Request object"

  @testset "there are three rows"
      @test  size(df,1) == 30
      @test  size(df,1) == 30
  end

  @testset "there are six columns"
      @test  size(df,2) == 13
      @test  size(df,2) == 13
  end

  @testset "correct values"
      @test  df[:Close][1] == 115.01
      @test  df[:Close][30] == 109.95
  end

  @testset "oldest date last"
      @test df[1,1] < df[30,1] == true
  end
end
