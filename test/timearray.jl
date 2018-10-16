using JLD, TimeSeries

include(joinpath(dirname(@__FILE__),"../src/timearray.jl"))

r  = load(joinpath(dirname(@__FILE__),"resp.jld"), "resp")
ta = timearray(r)["Close"]

@testset "timearray works on Request object"

  @testset "there are 30 rows") do
      @test  length(ta) == 30
  end

  @testset "correct values") do
      @test  ta[1][1].values[1]  == 115.01
      @test  ta[30][1].values[1] == 109.95
  end
end

@testset "Request object inspection check"
  
    @testset "status is 200"
        @test  r.status == 200
    end
  
    @testset "data is UInt8"
        @test  r.data[1] == 0x44
    end
 
# facts("floats and NaNs present") do
# 
#   @testset "NaN fills in missing values slot") do
# #      @pending isnan(sum(md.values[:,1])) == true
#   end
# 
#   @testset "existing values remain floats") do
# #      @test  sum(md.values[:,2]) == 66.86
#   end
#end
end
