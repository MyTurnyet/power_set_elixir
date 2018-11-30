# ElixirPowerSet

This is an Elixir program that will calculate powersets of a comma-deliniated string in a text file.

## Installation

Download this repository, then run:
```elixir
mix deps.get
mix escript.build
```


## Run the application
To run all the tests use ```mix test```

To run the applicaion:
```elixir
./power_set_elixir test/powerset-input.txt
```

You should see the output: ```{},{a},{b},{c},{d},{e},{a,b},{a,c},{a,d},{a,e},{b,c},{b,d},{b,e},{c,d},{c,e},{d,e},{a,b,c},{a,b,d},{a,b,e},{a,c,d},{a,c,e},{a,d,e},{b,c,d},{b,c,e},{b,d,e},{c,d,e},{a,b,c,d},{a,b,c,e},{a,b,d,e},{a,c,d,e},{b,c,d,e},{a,b,c,d,e}```

